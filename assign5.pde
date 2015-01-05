Bar aBar;
Ball aBall;
Brick [] bricks;
boolean going = false;

int life = 3;
int BricksAlive = 50;
final int GAME_START   = 0;
final int GAME_PLAYING = 1;
final int GAME_WIN     = 2;
final int GAME_LOSE    = 3;
int status;


void setup() {
  status = GAME_START;
  bricks = new Brick[50];

  size(640, 480);

  aBar = new Bar();
  aBall = new Ball();

  reset();
}

void draw() {
  background(50, 50, 50);
  
  switch(status) {
  case GAME_START:
    printText("PONG", 30, 240);
    printText("Press ENTER to Start", 15, 260);
    break;

  case GAME_PLAYING:
    // for Life
    drawLife();
    
    //for Bar
    aBar.move();
    aBar.display();
    
    //for Ball
    if (going) {
      aBall.move();
    } else {
      aBall.stick();
    }
    aBall.display();  
    checkLine();
    
    //for Bricks
    drawBricks();
    checkBrickHit();
    break;

  case GAME_LOSE:
    printText("You Lose...", 30, 240);
    printText("Press ENTER to Restart", 15, 260);
    break;

  case GAME_WIN:
    printText("You Win!!", 30, 240);
    printText("Press ENTER to Start", 15, 260);
    break;
  }
}

void printText(String statusText, int size, int posy) {
  fill(95, 194, 226);
  textAlign(CENTER);
  textSize(size);
  text(statusText, 320, posy);
}

void drawLife() {
  fill(230, 74, 96);
  textSize(20);
  text("LIFE:", 35, height - 14);
  for (int i=0; i < life; i++) {
    ellipse(69+(i*25), 459, 15, 15);
  }
  if (life == 0) {
    status = GAME_LOSE;
  }
}

void checkLine(){
    if (aBall.y >= height) {
    life --;
      going = false;
  aBall.y = height - 48;
  aBall.x = mouseX;
  }
}

void reset() {
  BricksMaker(125, 50, 40, 40, bricks.length, 10);
  for (int i = 0; i<bricks.length; i++) {
    bricks[i].die = false;
  }
  BricksAlive = 50;
  going = false;
}

void BricksMaker(int ox, int oy, int spacingX, int spacingY, int num, int numInCol) {
  for (int i = 0; i < num; i++) {
    int row = int (i / numInCol);
    int col = int (i % numInCol);

    int x = ox + (spacingX * col);
    int y = oy + (spacingY * row);

    bricks[i] =new Brick(x, y);
  }
}

void drawBricks() {
  for (int i=0; i<bricks.length; i++) {
    Brick brick = bricks[i];
    int row =int (i / 10);
    if (brick != null && brick.die == false) {
      fill(10 + 40*row, 206 + 10*row, 0 + 45*row);
      bricks[i].display();
    }
  }
}

void checkBrickHit() {
  for (int i=0; i<bricks.length; i++) {
    Brick brick = bricks[i];  
    if (brick != null && !brick.die 
      && aBall.x + aBall.size/2 <= bricks[i].x + bricks[i].w/2 +3
      && aBall.x - aBall.size/2 >= bricks[i].x - bricks[i].w/2 -3
      && aBall.y + aBall.size/2 <= bricks[i].y + bricks[i].h/2 +3
      && aBall.y - aBall.size/2 >= bricks[i].y - bricks[i].h/2 -3) {
      removeBrick(bricks[i]);
      BricksAlive -= 1;
    }
    if (BricksAlive == 0) {
      status = GAME_WIN;
    }
  }
}

void removeBrick(Brick obj) {
  obj.die = true;
  obj.x = 2000;
  obj.y = 2000;
}

void keyPressed() {
  if (status == GAME_START && key == ENTER) {
    status = GAME_PLAYING;
  }
  if ((status == GAME_LOSE || status == GAME_WIN)
    && key == ENTER) {
    life = 3;
    status = GAME_PLAYING;
    reset();
  }
}

void mousePressed() {
  if (status == GAME_PLAYING && mouseButton == RIGHT) {
    going = true;
  }
}


