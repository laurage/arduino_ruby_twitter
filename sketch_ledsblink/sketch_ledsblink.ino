int LEDgreen = 13;
int LEDred = 12;

void setup() {
  // put your setup code here, to run once:
  pinMode(LEDgreen,OUTPUT);
  pinMode(LEDred,OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(LEDgreen, HIGH);
  digitalWrite(LEDred, LOW);
  delay(500);
  digitalWrite(LEDred, HIGH);
  digitalWrite(LEDgreen, LOW);
  delay(500);
}
