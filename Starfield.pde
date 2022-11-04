Particle[] bobs = new Particle[1000];
void setup()
{
  size(700, 700);
   bobs[0] = new OddballParticle();
  for (int i = 0; i < bobs.length; i++) {
    bobs[i] = new Particle();
    bobs[i].myX = 350;
    bobs[i].myY = 350;
  }
}
void draw()
{
  background(0);
  for (int i = 0; i < bobs.length; i++) {
    bobs[i].explosion();
    bobs[i].show();
  }
}
void mousePressed() {
  for (int i = 0; i < bobs.length; i++) {
    bobs[0] = new OddballParticle();
    bobs[i] = new Particle();
  }
}

class Particle
{
  double myX, myY, myAngle;
  int myColor, mySize, mySpeed, myO;
  Particle() {
    myX = mouseX;
    myY = mouseY;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = (int)(Math.random()*10);
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    myO = (int)(Math.random()*60)+60; //opacity
    mySize = 20;
  }
  void show() {
    noStroke();
    fill(myColor, myO);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
  void explosion() {
    myX += (Math.cos(myAngle) * mySpeed);
    myY += (Math.sin(myAngle) * mySpeed);
  }
}

class OddballParticle extends Particle
{
  OddballParticle()
  {
    myX = myY;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = (int)(Math.random()*5);
    myColor = color(255);
    mySize = 50;
  }
}

