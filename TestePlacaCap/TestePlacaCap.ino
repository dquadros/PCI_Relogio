/*
 * Teste da placa de capacimetro / relogio
 * 17/08/19 - Daniel Quadros
 * https://dqsoft.blogspot.com
 */
 
// Conexões
const int pinBuzzer = 8;
const int pinTec1 = 11;
const int pinTec2 = 12;
const int pinTec3 = 13;
const int pinCap = 6;
const int pinDig1 = 4;
const int pinDig2 = 5;
const int pinDig3 = 2;
const int pinDig4 = 3;
const int pinSegtoA = A5;
const int pinSegtoB = A4;
const int pinSegtoC = A3;
const int pinSegtoD = A2;
const int pinSegtoE = A1;
const int pinSegtoF = A0;
const int pinSegtoG = 10;
const int pinSegtoDP = 9;


// Iniciação
void setup() {
  pinMode (pinBuzzer, OUTPUT);
  pinMode (pinTec1, INPUT_PULLUP);
  pinMode (pinTec2, INPUT_PULLUP);
  pinMode (pinTec3, INPUT_PULLUP);
  pinMode (pinDig1, OUTPUT);
  pinMode (pinDig2, OUTPUT);
  pinMode (pinDig3, OUTPUT);
  pinMode (pinDig4, OUTPUT);
  pinMode (pinSegtoA, OUTPUT);
  pinMode (pinSegtoB, OUTPUT);
  pinMode (pinSegtoC, OUTPUT);
  pinMode (pinSegtoD, OUTPUT);
  pinMode (pinSegtoE, OUTPUT);
  pinMode (pinSegtoF, OUTPUT);
  pinMode (pinSegtoG, OUTPUT);
  pinMode (pinSegtoDP, OUTPUT);

  digitalWrite (pinBuzzer, LOW);
  digitalWrite (pinDig1, HIGH);
  digitalWrite (pinDig2, HIGH);
  digitalWrite (pinDig3, HIGH);
  digitalWrite (pinDig4, HIGH);
  digitalWrite (pinSegtoA, LOW);
  digitalWrite (pinSegtoB, LOW);
  digitalWrite (pinSegtoC, LOW);
  digitalWrite (pinSegtoD, LOW);
  digitalWrite (pinSegtoE, LOW);
  digitalWrite (pinSegtoF, LOW);
  digitalWrite (pinSegtoG, LOW);
  digitalWrite (pinSegtoDP, LOW);

  pinMode (pinCap, OUTPUT);
  digitalWrite (pinCap, LOW);
  
  Serial.begin(9600);
}

// Laço principal
void loop() {
  switch (menu()) {
    case 1:
      testeBuzzer();
      break;
    case 2:
      testeTecla();
      break;
    case 3:
      testeDisplay();
      break;
  }
}

// Mostra menu e lê a opção
int menu () {
  Serial.println ("1: Buzzer");
  Serial.println ("2: Teclas");
  Serial.println ("3: Display");
  Serial.print ("Opcao: ");

  while (!Serial.available()) {
    delay (100);
  }
  int opc = Serial.read();
  Serial.println ();
  if (opc == '1') {
    return 1;
  } else if (opc == '2') {
    return 2;
  } else if (opc == '3') {
    return 3;
  }
  return 0;
}

// Teste do Buzzer
void testeBuzzer () {
  digitalWrite (pinBuzzer, HIGH);
  delay (1000);
  digitalWrite (pinBuzzer, LOW);
}

// Teste das teclas
void testeTecla () {
  uint8_t anterior = 0;
  uint8_t leitura;
  Serial.println ("Aperte as tres teclas juntas para sair");
  while (anterior != 7) {
    leitura = 0;
    if (digitalRead(pinTec1) == LOW) {
      leitura |= 1;
    }
    if (digitalRead(pinTec2) == LOW) {
      leitura |= 2;
    }
    if (digitalRead(pinTec3) == LOW) {
      leitura |= 4;
    }
    if (leitura != anterior) {
      anterior = leitura;
      Serial.print ((leitura & 1) ? "X" : "-");
      Serial.print ((leitura & 2) ? "X" : "-");
      Serial.println ((leitura & 4) ? "X" : "-");
    }
    delay (100);
  }
}

// Conexões ao display
int pinDigito[] = { pinDig1, pinDig2, pinDig3, pinDig4 };
int pinSegto[] = { pinSegtoA, pinSegtoB, pinSegtoC, pinSegtoD,
                   pinSegtoE, pinSegtoF, pinSegtoG, pinSegtoDP };

// Teste do display
void testeDisplay () {
  for (int rep = 0; rep < 3; rep++) {
    for (int dig = 0; dig < 4; dig++) {
      digitalWrite (pinDigito[dig], LOW);
      for (int segto = 0; segto < 8; segto++) {
        digitalWrite (pinSegto[segto], HIGH);
        delay (500);
        digitalWrite (pinSegto[segto], LOW);
      }
      digitalWrite (pinDigito[dig], HIGH);
      delay(1000);
    }
  }
}
