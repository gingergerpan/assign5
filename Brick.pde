class Brick{
  float x;
  float y;
  float w;
  float h;
  boolean die = false;
   
   
  void display(){
    rect(x,y,w,h); 
  }
  
  Brick(float posx, float posy){
    x = posx;
    y = posy;
    w = 27;
    h = 27;
  }
}
