// Arduino sketch turn LED on via serial input from Processing
// Define main variables
int ledPinx = 0;
int ledPinz = 0;
int currentRead=0;
int values[2];
// activate the pins I want to use on my board
int myPins[4] = {5,6, 9,3};
void setup() {
// Activate all Digital pins on my board
for (int i = 0; i < 4; i++) {
pinMode(myPins[i], OUTPUT);
}
Serial.begin(9600);
}
void loop() {
if (Serial.available()) {
values[currentRead] = Serial.read();
currentRead++;
if(currentRead>1)
currentRead=0;
if(values[0] != ledPinx) {
digitalWrite(ledPinx, LOW);
ledPinx = values[0];
digitalWrite(ledPinx, HIGH);

if(values[1] != ledPinz) {
digitalWrite(ledPinz, LOW);
ledPinz = values[1];
digitalWrite(ledPinz, HIGH);
}}}}
 



