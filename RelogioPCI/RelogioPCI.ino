/*
 * Relogio
 * 
 * Modo normal 
 * - mostra hh:mm
 * - qquer botão para alarme
 * - Manter Tec3 apertado até dar 2 bips para entrar na coniguração
 * Configuração
 * - mostra p-vv onde p é o parâmetro e vv o valor
 * - Tec3 sai da configuração
 * - Tec2 seleciona o parâmetro
 * - Tec1 seleciona o valor
 * - Parametros
 *   1 - hora atual (00 a 23)
 *   2 - minuto atual (00 a 59)
 *   3 - alarme (00 = desligado, 01 = ligado)
 *   4 - hora do alarme (00 a 23)
 *   5 - minuto do alarme (00 a 59)
 */

#include "PCICap.h"

#define FALSE   0
#define TRUE    1

// Um byte para cada segmento
// Bit 7 = segto G, Bit 6 = segto F, .. Bit 1 = segto A, Bit 0 = ponto
static unsigned char segto    [4];
static unsigned char newsegto [4];

// Controle dos segmentos do display
// Segmentos a serem acesos para cada dígito
// 0 1 2 3 4 5 6 7 8 9 - <espaco>
static const unsigned char segDigito[14] =
{
  0b01111110, 0b00001100, 0b10110110, 0b10011110, 0b11001100,
  0b11011010, 0b11111010, 0b00001110, 0b11111110, 0b11011110,
  0b10000000, 0b00000000
};

#define TRACO   10
#define ESPACO  11

// Modo atual
enum { NORMAL, ALARME, CONFIG } modo;
 
// Informações do relógio
volatile byte hora, minuto, segundo;
uint8_t alarme_ligado;
byte hora_alarme, minuto_alarme;

// Contole do buzzer
typedef enum { QUIETO, UM_BIP, DOIS_BIPS, PAUSA, ALARME_ON, ALARME_OFF } SOM;
volatile SOM bip;
volatile uint16_t cont_bip;
const uint16_t TICKS_BIP_ON = 200;
const uint16_t TICKS_PAUSA = 200;
const uint16_t TICKS_ALARME_ON = 500;
const uint16_t TICKS_ALARME_OFF = 500;

// Controle dos botões
#define BotaoApertado() ((digitalRead(pinTec1) == LOW) || \
                         (digitalRead(pinTec2) == LOW) || \
                         (digitalRead(pinTec3) == LOW))

// Modo Config
uint8_t i_param_cfg;
typedef struct {
  uint8_t *pVar;
  uint8_t maxVal;
} PARAM_CFG;
const PARAM_CFG param_cfg[] = {
  { &hora, 23 },
  { &minuto, 59 },
  { &alarme_ligado, 1 },
  { &hora_alarme, 23 },
  { &minuto_alarme, 59 }
};
#define N_PARAM_CFG (sizeof(param_cfg)/sizeof(param_cfg[0]))

// Iniciação
void setup() {
    // Pinos ligados ao display são de saída
    pinMode (pinSegtoA, OUTPUT);   digitalWrite(pinSegtoA, LOW);
    pinMode (pinSegtoB, OUTPUT);   digitalWrite(pinSegtoB, LOW);
    pinMode (pinSegtoC, OUTPUT);   digitalWrite(pinSegtoC, LOW);
    pinMode (pinSegtoD, OUTPUT);   digitalWrite(pinSegtoD, LOW);
    pinMode (pinSegtoE, OUTPUT);   digitalWrite(pinSegtoE, LOW);
    pinMode (pinSegtoF, OUTPUT);   digitalWrite(pinSegtoF, LOW);
    pinMode (pinSegtoG, OUTPUT);   digitalWrite(pinSegtoG, LOW);
    pinMode (pinSegtoDP, OUTPUT);  digitalWrite(pinSegtoDP, LOW);
    
    // Pinos de seleção do dígito (catodos) em 1
    pinMode (pinDig1, OUTPUT);   digitalWrite(pinDig1, HIGH);
    pinMode (pinDig2, OUTPUT);   digitalWrite(pinDig2, HIGH);
    pinMode (pinDig3, OUTPUT);   digitalWrite(pinDig3, HIGH);
    pinMode (pinDig4, OUTPUT);   digitalWrite(pinDig4, HIGH);

    // Pino ligado ao buzzer
    pinMode (pinBuzzer, OUTPUT);   digitalWrite(pinBuzzer, LOW);

    // Pinos ligados às teclas
    pinMode (pinTec1, INPUT_PULLUP);
    pinMode (pinTec2, INPUT_PULLUP);
    pinMode (pinTec3, INPUT_PULLUP);

    // Inicia o relogio
    hora = minuto = segundo = 0;
    hora_alarme = minuto_alarme = 0;
    alarme_ligado = false;
    modo = NORMAL;
    TocaBip (DOIS_BIPS);

    // Configura o timer 2 para atualização do display
    TCCR2A = 0;                         // Modo normal
    TCCR2B = _BV(CS22);                 // Usar clkIO/64
    TIMSK2 = _BV(TOIE2);                // Interromper no overflow
}

// Programa Principal
void loop() {
  switch (modo) {
    case NORMAL:
      if (AtlHora()&& alarme_ligado) {
        cli();
        bool tocar = (hora == hora_alarme) && (minuto == minuto_alarme);
        sei();
        if (tocar) {
          modo = ALARME;
          TocaBip (ALARME_ON);
        }
      }
      if (modo == NORMAL) {
        TrataBotaoConfig();
      }
      break;
    case ALARME:
      AtlHora();
      if (BotaoApertado()) {
        modo = NORMAL;
        TocaBip(QUIETO);
        EsperaSoltarBotoes();
      }
      break;
    case CONFIG:
      TrataConfig();
      break;
  }
}

// Atualiza a hora no display
bool AtlHora() {
  static byte hora_ant = 0xFF, minuto_ant = 0xFF;
  bool mudou = false;
  
  cli();
  if ((hora_ant != hora) || (minuto_ant != minuto)) {
    hora_ant = hora;
    minuto_ant = minuto;
    mudou = true;
  }
  sei();
  if (mudou) {
    newsegto[0] = segDigito[hora_ant / 10];
    newsegto[1] = segDigito[hora_ant %10];
    newsegto[2] = segDigito[minuto_ant / 10];
    newsegto[3] = segDigito[minuto_ant % 10];
    AtlDisp();
  }
  return mudou;
}

// Testa se apertou botão para entrar no modo config
void TrataBotaoConfig() {
  static uint32_t tmpBotaoConfig = 0;
  
  if (digitalRead(pinTec3) == LOW) {
    if (tmpBotaoConfig == 0) {
      tmpBotaoConfig = millis();
    } else if ((millis() - tmpBotaoConfig) > 3000) {
      TocaBip(DOIS_BIPS);
      EsperaSoltarBotoes();
      i_param_cfg = 0;
      modo = CONFIG;
    }
  } else {
    tmpBotaoConfig = 0;
  }
}

// Trata o modo Config
// só volta ao loop quando sair
void TrataConfig() {
  PARAM_CFG *pParam;
  uint32_t tmpBotao2 = 0;
  uint32_t tmpBotao1 = 0;
  uint32_t dlyBotao1;
  
  while (modo == CONFIG) {
    pParam = &param_cfg[i_param_cfg];

    // Atualiza display
    newsegto[0] = segDigito[i_param_cfg % 10];
    newsegto[1] = segDigito[ESPACO];
    newsegto[2] = segDigito[*pParam->pVar / 10];
    newsegto[3] = segDigito[*pParam->pVar % 10];
    AtlDisp();

    // Trata teclas
    while (TRUE) {
      if (digitalRead(pinTec3) == LOW) {  // Tec3 sai do config
        modo = NORMAL;
        break;
      }
      if (digitalRead(pinTec2) == LOW) {  // Tec2 seleciona parametro
        if (tmpBotao2 != 0) {
          // garante um tempo entre os acionamento
          if ((millis() - tmpBotao2) < 500) {
            delay(10);
            continue;
          }
        }
        tmpBotao2 = millis();
        if (++i_param_cfg == N_PARAM_CFG) {
          i_param_cfg = 0;
        }
        break;
      }
      if (digitalRead(pinTec1) == LOW) {  // Tec1 seleciona valor
        if (tmpBotao1 != 0) {
          // garante um tempo entre os acionamento
          if ((millis() - tmpBotao1) < dlyBotao1) {
            delay(10);
            continue;
          }
          dlyBotao1 = 200;
        } else {
          dlyBotao1 = 500;
        }
        tmpBotao1 = millis();
        *pParam->pVar = *pParam->pVar + 1;
        if (*pParam->pVar > pParam->maxVal) {
          *pParam->pVar = 0;
        }
        break;
      }      
    }
  }
  EsperaSoltarBotoes();
}

// Espera soltar todos os botoes
void EsperaSoltarBotoes() {
  while (BotaoApertado()) {
    delay(10);
  }
  delay(100);
}

// Dispara um sinal no buzzer
void TocaBip (SOM modo) {
  cli();
  switch (modo) {
    case QUIETO:
      digitalWrite (pinBuzzer, LOW);
      break;
    case UM_BIP:
    case DOIS_BIPS:
      digitalWrite (pinBuzzer, HIGH);
      cont_bip = TICKS_BIP_ON;
      break;
    case PAUSA:
      digitalWrite (pinBuzzer, LOW);
      cont_bip = TICKS_PAUSA;
      break;
    case ALARME_ON:
      digitalWrite (pinBuzzer, HIGH);
      cont_bip = TICKS_ALARME_ON;
      break;
    case ALARME_OFF:
      digitalWrite (pinBuzzer, LOW);
      cont_bip = TICKS_ALARME_OFF;
      break;
  }
  bip = modo;
  sei();
}

// Tratamento da interrupção do timer 2, usada para varrer o display
// e temporizações. Ocorre a cada 64*256/16000 mSeg = 1,024 mSeg
const uint16_t TICKS_SEG = 977;
ISR (TIMER2_OVF_vect)
{
    static uint16_t cont_seg = TICKS_SEG;

    if ((modo != CONFIG) && (--cont_seg == 0)) {
      // Atualiza hora atual
      cont_seg = TICKS_SEG;
      if (++segundo == 60) {
        segundo = 0;
        if (++minuto == 60) {
          minuto = 0;
          if (++hora == 24) {
            hora = 0;
          }
        }
      }
      
      // Indicação de segundos
      if (modo != CONFIG) {
        segto[1] ^= 1;
      }
    }

    // Trata bip
    if ((bip != QUIETO) && (--cont_bip == 0)) {
      if (bip == UM_BIP) {
        digitalWrite (pinBuzzer, LOW);
        bip = QUIETO;
      } else if (bip == PAUSA) {
        digitalWrite (pinBuzzer, HIGH);
        bip = UM_BIP;
        cont_bip = TICKS_BIP_ON;
      } else if (bip == DOIS_BIPS) {
        digitalWrite (pinBuzzer, LOW);
        bip = PAUSA;
        cont_bip = TICKS_PAUSA;
      } else if (bip == ALARME_ON) {
        digitalWrite (pinBuzzer, LOW);
        cont_bip = TICKS_ALARME_OFF;
        bip = ALARME_OFF;
      } else if (bip == ALARME_OFF) {
        digitalWrite (pinBuzzer, HIGH);
        cont_bip = TICKS_ALARME_ON;
        bip = ALARME_ON;
      }
    }

    // Atualiza o display
    VarreDisp ();
}

// Atualiza o display para mostrar o conteudo de newsegto
static void AtlDisp (void)
{
   segto[0] = newsegto[0];
   segto[1] = newsegto[1];
   segto[2] = newsegto[2];
   segto[3] = newsegto[3];
}   

// Faz a varredura (apresentação do display)
// Esta rotina está amarrada à conexão do display ao ATmega
static void VarreDisp (void)
{
    static unsigned char disp = 0;
    register unsigned char segtos;

    // apaga o digito anterior
    if (disp == 0)
        digitalWrite(pinDig4, HIGH);
    else if (disp == 1)
        digitalWrite(pinDig1, HIGH);
    else if (disp == 2)
        digitalWrite(pinDig2, HIGH);
    else
        digitalWrite(pinDig3, HIGH);
       
    // programa os segmentos
    segtos = segto[disp];
    digitalWrite (pinSegtoG, (segtos & 0x80) ? HIGH : LOW);
    digitalWrite (pinSegtoF, (segtos & 0x40) ? HIGH : LOW);
    digitalWrite (pinSegtoE, (segtos & 0x20) ? HIGH : LOW);
    digitalWrite (pinSegtoD, (segtos & 0x10) ? HIGH : LOW);
    digitalWrite (pinSegtoC, (segtos & 0x08) ? HIGH : LOW);
    digitalWrite (pinSegtoB, (segtos & 0x04) ? HIGH : LOW);
    digitalWrite (pinSegtoA, (segtos & 0x02) ? HIGH : LOW);
    digitalWrite (pinSegtoDP, (segtos & 0x01) ? HIGH : LOW);
    
    // acende o dígito atual
    if (disp == 0)
        digitalWrite(pinDig1, LOW);
    else if (disp == 1)
        digitalWrite(pinDig2, LOW);
    else if (disp == 2)
        digitalWrite(pinDig3, LOW);
    else
        digitalWrite(pinDig4, LOW);
    
   // passa para o dígito seguinte
   disp = (disp + 1) & 3;
}
