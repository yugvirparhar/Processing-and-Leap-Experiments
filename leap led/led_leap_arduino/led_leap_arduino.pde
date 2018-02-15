import cc.arduino.*;
import org.firmata.*;

import de.voidplus.leapmotion.*;

import processing.serial.*;
Serial myPort;
int ledPinx;
int ledPinz;
int checkPinx;
int checkPinz;
LeapMotion leap;
Arduino arduino;
void setup() {
size(800, 500, P3D);
background(255);
noStroke();
fill(50);
// arduino = new Arduino(this, Arduino.list()[0], 9600);
// New port object
myPort = new Serial(this, Serial.list()[0], 9600);
// New leap object
printArray(Serial.list());
leap = new LeapMotion(this);
}
void draw() {
background(255);
//int fps = leap.getFrameRate();
// Clean LEAP Hand position
for (Hand hand : leap.getHands()) {
hand.draw();
PVector hand_position = hand.getPosition();
// println(“Hand on X: ” + hand.getPosition().x );
// Determine ledPin according to mapped hand x position
checkPinx = (int) map(hand_position.x, 0, 700, 3,5);
//System.out.println(hand_position.x);
checkPinz = (int) map(hand_position.z, -30, 80, 6, 9);
//System.out.println(hand_position.z);
if ((ledPinx != checkPinx)||(ledPinz!= checkPinz)) {
assignPin();
}
// Send ledPin number through port
}
}
void assignPin() {
ledPinx = checkPinx;
ledPinz= checkPinz;
myPort.write(ledPinz);
myPort.write(ledPinx);
System.out.println(ledPinx);
System.out.println(ledPinz);
}
void leapOnInit() {
// println(“Leap Motion Init”);
}
void leapOnConnect() {
// println(“Leap Motion Connect”);
}
void leapOnFrame() {
// println(“Leap Motion Frame”);
}
void leapOnDisconnect() {
// println(“Leap Motion Disconnect”);
}
void leapOnExit() {
// println(“Leap Motion Exit”);
}