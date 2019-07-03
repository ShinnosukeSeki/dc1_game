class Java_c {
  float x, y, dx, dy, vy;
  
  // Javaちゃんの大きさ
  float r = 15.0;
  
  // x方向の速さ
  float vx = 2.0;
  
  // y方向の初速度
  float a = 7.54;
  
  // 重力
  float g = 0.2;
  
  // ジャンプしているか否か
  boolean isJump = false;
  
  // 死んだか否か
  boolean isDied = false;
  
  Java_c(float initial_x, float initial_y) {
    x = initial_x;
    y = initial_y-r;
  }
  
  
  void display() {
    
    fill(#F5A3F4);
    ellipse(x, y, r*2, r*2);
    fill(0);
    ellipse(x-7, y-5, 5, 5);
    ellipse(x+7, y-5, 5, 5);
    
  }
  
  void move() {
    
    keyDirection();
    
    updateX();
    updateY();
  
  }
  
  void keyDirection() {
    
    if(isJump == false) {
      if(keyPressed) {
        
        switch(keyCode) {
          case LEFT:
            dx = -vx;
            break;
          case RIGHT:
            dx = vx;
            break;
          case UP:
            isJump = true;
            dy = -a;
            break;
          default:
            dx = 0;
            break;
        }
      } else {
        dx = 0;
      }
    }
  }
  
  void updateX() {    
    // 自キャラのx座標の更新
    x += dx;
  }
  
    
  void updateY() {
    
    // 自キャラのy方向の更新量の変化分を設定(重力？)
    float g = 0.2;
    
    // ジャンプモードの時の処理
      if(dy < a) { 
        dy += g;
      }
      
      // 自キャラが床の上に到達したら
      if(y + r > ground){
        isJump = false;
        dy = 0;
        y = ground - r;
        keyCode = 40;
        }
        // 自キャラのy座標の更新
      y += dy;
  }
  
  void keyReleased() {
    keyCode = 40;
  }
}
