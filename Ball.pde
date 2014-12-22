class Ball{
  float x;
  float y;
  float size;
  float xSpeed;
  float ySpeed;
  float w;
  
  void stick(){
    x = mouseX;
    if (x + w/2 >= width){
      x = width - w/2;
    }
    if (x - w/2 <= 0){
      x = w/2;
    }  
    xSpeed =(float) random(-7,7);

  }
  
  void move(){
    x += xSpeed;
    y += ySpeed;
    if (x + size/2 >= width || x - size/2 <= 0){
      xSpeed *= -1;
    }
    if (y - size/2 <= 0){
      ySpeed *= -1;
    }
    
    //detect if the ball would bounce back
    float bottom = y + size/2;
    float bl = aBar.y - aBar.h/2;
    float bLeft = aBar.x - aBar.w/2;
    float bRight = aBar.x + aBar.w/2;
    if (bottom >= bl && x > bLeft && x < bRight){
      y = bl - size/2;
      ySpeed *= -1;     
      
      //the functions below are used to accelerate/decelerate the ball
      //based on the hitten area (right/left side)
      if (x < aBar.x && xSpeed > 0){
        xSpeed --;
      }  
      if (x < aBar.x && xSpeed < 0){
        xSpeed ++;
      }  
      if (x > aBar.x && xSpeed > 0){
        xSpeed ++;
      }  
      if (x < aBar.x && xSpeed < 0){
        xSpeed --;  
      }
    }
  }
  
  void display(){
    noStroke();
    fill(255);
    ellipse(x, y, size, size);
  }

  Ball(){
    y = height - 48; 
    ySpeed = -8;
    size = 10;
    w = 100;
  }
}
