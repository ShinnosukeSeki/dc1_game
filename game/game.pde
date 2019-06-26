/*
======================================================================
                             グローバル変数の宣言，初期化
======================================================================
*/

int floorHeight;     // 試し用(後に削除)

JavaC player;
Wall w1;
Spike s1, s2;
Magma m1;
/*
======================================================================
                             setup()関数
======================================================================
*/
void setup() {
  
  size(600, 600);
  
  floorHeight = height - 150;
  
  frameRate(120);
  textSize(30);
  textAlign(CENTER, CENTER);
  
  player = new JavaC(width/2, floorHeight);
  
  s1 = new MovingSpike(width/2, height, 20, 'u');
  s2 = new StoppingSpike(width/2, height/2, 20, 'd');
  
  m1 = new StoppingMagma(200, 400, 50, 10);
  
  w1 = new StoppingWall(0, 0, 20, height);
}

/*
======================================================================
                             draw()関数
======================================================================
*/
void draw() {
  
  background(255);
  
  line(0, floorHeight, width, floorHeight);
  
  player.display();
  player.move(floorHeight);
  
  w1.display();
  
  s1.display();
  s2.display();
  s1.move(3.0);
  
  m1.display();
}

/*
======================================================================
                             自作関数
======================================================================
*/

void keyReleased() {
  keyCode = 40;
}
