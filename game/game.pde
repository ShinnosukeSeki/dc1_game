/*
======================================================================
                             グローバル変数の宣言，初期化
======================================================================
*/
float myX, myY;
float myDx, myDy;
float r = 12.0;

// 0：通常モード  1：ジャンプモード
int mode;

float moveL = 1.0;

// 自キャラの初速度
float initDy = 3.54;

/*
======================================================================
                             seup()関数
======================================================================
*/
void setup() {
  
  size(600, 600);
  
  frameRate(120);
  textSize(30);
  textAlign(CENTER, CENTER);
  
  setupMyChara();
}

/*
======================================================================
                             draw()関数
======================================================================
*/
void draw() {
  
  background(255);
  
  moveMyChara();
  
}

/*
======================================================================
                             自作関数
======================================================================
*/

void setupMyChara() {
  
  myX = width / 2;
  myY = height - r;
  
  mode = 0;
}

void moveMyChara() {
  
  myCharaKey();
  
  updateMyCharaX();
  updateMyCharaY();
  drawMyChara();
  
}

// 自キャラのキーボードによる操作を行う関数
void myCharaKey() {
  
  if(mode == 0) {
    if(keyPressed) {
      switch(keyCode) {
        case LEFT:
          myDx = -moveL;
          break;
        case RIGHT:
          myDx = moveL;
          break;
        case UP:
          mode = 1;
          myDy = -initDy;
          break;
        default:
          myDx = 0;
          break;
      }
    } else {
      myDx = 0;
    }
  }
  
}

// 自キャラのx座標の更新を行う関数
void updateMyCharaX() {
  
  // 左端に到達したときの処理
  if(myX - r < 0) {
    if(mode == 1) {     // ジャンプモード
      myDx *= -1;
    } else {            // 通常モード
      myDx = 0;
      myX = r;
    }
  }
  
  // 右端に到達したときの処理
  if(myX + r > width) {
    if(mode == 1) {     //   ジャンプモード
      myDx *= -1;
    } else {            // 通常モード
      myDx = 0;
      myX = width - r;
    }
  }
  
  // 自キャラのx座標の更新
  myX += myDx;
  
}

// 自キャラのy座標の更新を行う関数
void updateMyCharaY() {
  
  // 自キャラのy方向の更新量の変化分を0.06に設定
  float dMoveL = 0.06;
  
  // ジャンプモードの時の処理
  if(mode == 1) {
    if(myDy < initDy) {
      myDy += dMoveL;
    }
    
    // 自キャラがウィンドウの下端に到達したら
    if(myY + r > height) {
      mode = 0;
      myDy = 0;
      myY = height - r;
    }
    
    // 自キャラのy座標の更新
    myY += myDy;
  }
  
}
  

// 自キャラの表示を行う関数
void drawMyChara() {
  
  stroke(128, 192, 255);
  fill(128, 192, 255);
  ellipse(myX, myY, r*2, r*2);
  
}
