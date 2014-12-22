class Bar{
  float x;
  float y;
  float w;
  float h;


  void move(){
    x = mouseX;
    y = height - 38;
    
    if (x + w/2 >= width){
      x = width - w/2;
    }
    if (x - w/2 <= 0){
      x = w/2;
    }
  }
  
  void display(){
    noStroke();
    rectMode(CENTER);
    fill(255);
    rect(x,y,w,h);
  }
  
  Bar(){
    x = 320;
    y = height - 30;
    w = 100;
    h = 12;
  }
}
