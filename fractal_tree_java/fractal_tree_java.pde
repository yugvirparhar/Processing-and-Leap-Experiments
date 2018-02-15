import de.voidplus.leapmotion.*;
LeapMotion leap;
void setup() {
  size(800,600, P3D); 
  leap = new LeapMotion(this);

}

void draw() {
  background(0);
  stroke(255);

  
  for (Hand hand : leap.getHands())
  { 
   PVector handPosition= new PVector(10,0,0);
   handPosition = hand.getPosition();
   float hP = handPosition.x; 
   System.out.println(hP);
   
  
  float a = (hP / (float) width) * 90f;
  translate(width/2,height);
  line(0,0,0,-200);
  translate(0,-200);
  branch(200, a);
  
  hand.draw();
}}

void branch(float h, float a) {
    h *= 0.66;
    if(a>90)
    a=90;
   else if(a<0)
    a=0;
    if (h > 2) {
    pushMatrix();    
    rotate(2*radians(a));   
    line(0, 0, 0, -h);
    translate(0, -h); 
    branch(h, a);       
    popMatrix();     
    
   
    pushMatrix();
    rotate(-(2*radians(a)));
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h,a);
    popMatrix();
  }
}