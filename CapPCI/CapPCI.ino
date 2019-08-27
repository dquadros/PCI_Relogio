/**
 * Capacímetro - versão p/ placa de circuito impresso
 * 27/08/19 - Daniel Quadros
 * https://dqsoft.blogspot.com
 */

#include "PCICap.h"

#define FALSE   0
#define TRUE    1

// Variaveis
static volatile char fAmostra;          // TRUE quando é hora de amostrar
static volatile char fAmostrado;        // TRUE quando é amostra foi feita
static volatile unsigned int tempo;     // tempo para carga do capacitor até 2,5V
                                        // zero indica que ultrapassou o tempo máximo

// Um byte para cada segmento
// Bit 7 = segto G, Bit 6 = segto F, .. Bit 1 = segto A, Bit 0 = ponto
static unsigned char segto    [4];
static unsigned char newsegto [4];

// Controle dos segmentos do display
// Segmentos a serem acesos para cada dígito
// 0 1 2 3 4 5 6 7 8 9 - P n u
static const unsigned char segDigito[14] =
{
  0b01111110, 0b00001100, 0b10110110, 0b10011110, 0b11001100,
  0b11011010, 0b11111010, 0b00001110, 0b11111110, 0b11011110,
  0b10000000, 0b11100110, 0b10101000, 0b00111000
};

#define TRACO   10
#define C_PICO  11
#define C_NANO  12
#define C_MICRO 13


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

    // Pino ligado ao buzzer (não usado)
    pinMode (pinBuzzer, OUTPUT);   digitalWrite(pinBuzzer, LOW);

    // Configura o comparador
    ADCSRB &= ~_BV(ACME);
    ACSR = _BV(ACIC) | _BV(ACIS1) | _BV(ACIS0); 
    DIDR1 = _BV(AIN1D) | _BV(AIN0D);

    // Configura o timer 2
    TCCR2A = 0;                         // Modo normal
    TCCR2B = _BV(CS22);                 // Usar clkIO/64
    TIMSK2 = _BV(TOIE2);                // Interromper no overflow
    
    // Configura o timer 1
    TCCR1A = 0;                     // Operação normal
    TCCR1B = 0;                     // Contador parado
    TCCR1C = 0;                     // Não usado
    
    // Descarrega o capacitor
    DescarregaCap ();
}

void loop() {
    if (fAmostra)                   // Quando for hora de amostrar
    {
        Amostra ();                     // Amostra
        fAmostra = FALSE;
        CalculaCap ();                  // Calcula
        AtlDisp ();                     // Mostra no display
    }
}

// Calcula o valor do capacitor e coloca em newsegto
static void CalculaCap (void)
{
    if (tempo < 3)
    {
        // Ccapacitância muito alta ou ausente
        newsegto[0] = newsegto[1] = newsegto[2] = newsegto[3] = segDigito[TRACO];
    }
    else
    {
        // Capacitor está entre 17pF e 1.146.218 pF (1.15uF)
        unsigned long cap = (tempo * 40000UL) / 2287UL;     // em pF
        unsigned int valor;
        unsigned int ponto;
        if (cap < 1000UL)
        {
            valor = (unsigned int) cap;
            newsegto [3] = segDigito[C_PICO];
            ponto = 2;
        }
        else if (cap < 9995UL)
        {
            cap += 5UL;       // arredonda
            valor = ((unsigned int) cap) / 10;
            newsegto [3] = segDigito[C_NANO];
            ponto = 0;
        }
        else if (cap < 99950UL)
        {
            cap += 50UL;       // arredonda
            valor = (unsigned int) (cap / 100UL);
            newsegto [3] = segDigito[C_NANO];
            ponto = 1;
        }
        else if (cap < 999500UL)
        {
            cap += 500UL;       // arredonda
            valor = (unsigned int) (cap / 1000UL);
            newsegto [3] = segDigito[C_NANO];
            ponto = 2;
        }
        else
        {
            cap += 5000UL;       // arredonda
            valor = (unsigned int) (cap / 10000UL);
            newsegto [3] = segDigito[C_MICRO];
            ponto = 0;
        }
        newsegto [0] = segDigito [valor / 100];
        newsegto [1] = segDigito [(valor / 10) % 10];
        newsegto [2] = segDigito [valor % 10];
        newsegto [ponto] |= 1;  // coloca o ponto
    }
}

// Tratamento da interrupção do timer 0, usada para varrer o display
// e disparar a amostragem
#define DLY_AMOSTRA 1953        // 1 amostra a cada 2 segundos
ISR (TIMER2_OVF_vect)
{
    static unsigned int cntAmostra = DLY_AMOSTRA;
    
    VarreDisp ();
    if (--cntAmostra == 0)
    {
        cntAmostra = DLY_AMOSTRA;
        fAmostra = TRUE;
    }
}

// Amostragem do valor do capacitor
static void Amostra (void)
{
    fAmostrado = FALSE;

    TCNT1H = 0;
    TCNT1L = 0;
    
    CarregaCap ();
    
    TIMSK1 = _BV(ICIE1) | _BV(TOIE1);
    TCCR1B = _BV(ICES1) | _BV(CS11) | _BV(CS10);
    
    while (!fAmostrado)
        ;
    
    DescarregaCap ();
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

// Descarrega o capacitor
static void DescarregaCap (void)
{
    // Configura pino AIN0/D6 como saída digital
    // em nível 0
    pinMode (pinCap, OUTPUT);
    digitalWrite (pinCap, LOW);
}

// Dispara a carga do capacitor
static void CarregaCap (void)
{
    // Configura o pino AIN0/D6 como entrada digital
    // (sem pullup) para não interferir
    pinMode (pinCap, INPUT);
    digitalWrite (pinCap, LOW);
}

// Tratamento da interrupção de captura do timer1, 
ISR (TIMER1_CAPT_vect)
{
    unsigned char cntLo, cntHi;
    cntLo = ICR1L;                  // ler primeiro Low
    cntHi = ICR1H;
    tempo = (cntHi << 8) + cntLo;
    TCCR1B = 0;                     // para o timer
    TIMSK1 = 0;                     // não interromper
    fAmostrado = TRUE;
}

// Tratamento da interrupção de overflow do timer1
ISR (TIMER1_OVF_vect)
{
    tempo = 0;                      // indica overflow
    TCCR1B = 0;                     // para o timer
    TIMSK1 = 0;                     // não interromper
    fAmostrado = TRUE;
}
