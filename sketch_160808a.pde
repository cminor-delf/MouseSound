import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
Minim minim;
AudioInput input;
FFT fft;
   
 
float brushSize;
float brushColor;
float brushSaturation;
float xPos;
float yPos;
float incriment;
 
 
void setup(){
  size(1920,1080);
//  frameRate(4);
  colorMode(HSB);
  background(0);
  smooth();
  noStroke();
   
  minim = new Minim(this);
  input = minim.getLineIn(Minim.MONO, 512);
 
 
  brushSize = 5;
  brushColor = 100;
  brushSaturation = 255;
  xPos = 0;
  yPos = 0;
  incriment = brushSize;
   
 
}
 
 
 
 
void draw(){
 
  brushColor = map(input.left.get(50), 0, 1, 0, 255);
  brushColor = map(input.right.level(), 0, .3, 235, 5);
  fill(brushColor, 235, 250,100);
   
  ellipse(xPos, yPos, brushSize, brushSize);
   
  xPos=mouseX;
  yPos=mouseY;
  brushSize=map(input.mix.level(),0,.3,1,20);
 
}
 
void keyPressed(){
  if(key == ' '){
    background(0);
    xPos = 0;
    yPos = 0;
  }
 
}
 
 
void stop(){
  input.close();
  minim.stop();
  super.stop();
}