int LEDgreen = 13;
int LEDred = 12;

void setup() {
  pinMode(LEDgreen,OUTPUT);
  pinMode(LEDred,OUTPUT);

}

void loop() {
  digitalWrite(LEDgreen, HIGH);
  digitalWrite(LEDred, LOW);
  delay(500);
  digitalWrite(LEDred, HIGH);
  digitalWrite(LEDgreen, LOW);
  delay(500);
}
