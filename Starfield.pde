Bubble [] bubs = new Bubble[1000];
void setup(){
  size(1000,1000);
  
  imageMode(CENTER);
  //cursor(img);
  
  noStroke();
  for(int i = 1; i< bubs.length; i++){
    //bubs[i] = new Bubble((int)(Math.random()*width),(int)(Math.random()*70)+height);
    //bubs[i] = new Bubble(width/2,height/2);
    bubs[0] = new poop();
    bubs[i] = new Bubble(mouseX,mouseY);
  }
}


void draw(){
  background(255);
  for(int i = 0; i< bubs.length; i++){
    bubs[i].rise();
    bubs[i].show();
  }  
  //PImage img;  
  //img = loadImage("pony.png");  
  //img.resize(50,50);
  //image(img,mouseX,mouseY);
  ellipse(mouseX, mouseY, 25,25);
  
}



class Bubble{
  public int  myC, mySize ;
  public double myAngle,mySpeed,myX, myY;
  
  Bubble(){
    myX = width/2;
    myY = height-70;
    myC = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
    mySpeed = (Math.random()*5)+1;
    mySize = (int)(Math.random()*50)+20;
    myAngle = (Math.random()*2)*Math.PI;
  }
  Bubble(int x, int y){
    myX = x;
    myY = y;
    myC = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));    
    mySize = (int)(Math.random()*50)+20;
    mySpeed = (Math.random()*5)+1;
    myAngle = (Math.random()*2)*Math.PI;
  }  
  private void rise(){
    myY = myY+ (Math.sin(myAngle)*mySpeed);
    myX = myX+ (Math.cos(myAngle)*mySpeed);
   // if(bubs.myX > width || bubs.myX < width*-1){
      
   // }
    if(dist(width/2,height/2,(float)myX,(float)myY)>width){
      //myX = width/2;
      //myY = height/2;
      myX = mouseX;
      myY = mouseY;
    }    
  }
  public void show(){
    fill(myC);
    ellipse((float)myX, (float)myY, 5, 5);
  }
}
class poop extends Bubble{
   poop(){
    myX = width/2;
    myY = height-70;
    myC = color(122,89,1);
    mySpeed = (Math.random()*50)+10;
    mySize = (int)(Math.random()*20)+10;
    myAngle = (Math.random()*2)*Math.PI;
  }
   void show(){
    fill(myC);
    ellipse((float)myX, (float)myY, mySize, mySize);
  }
  
}
