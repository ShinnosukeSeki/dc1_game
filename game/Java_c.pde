class Java_c {
  float r, x, y, dx, dy, vx, vy, a, g;
  
  // Javaちゃんの大きさ
  r = 15.0;
  
  // x方向の速さ
  vx = 2.0;
  
  // y方向の初速度
  a = 7.54;
  
  // 重力
  g = 0.2;
  
  // ジャンプしているか否か
  boolean isJump = false;
  
  Java_c(int initial_x, int initial_y) {
    x = initial_x;
    y = initial_y;
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
    
    // 左端に到達したときの処理
    if(x - r < 0) {
      if(isJump == true) { // ジャンプモード
        dx *= -1;
      } else {                        // 通常モード
        dx = 0;
        x = r;
      }
    }
    
    // 右端に到達したときの処理
    if(x + r > width) {
      if(isJump == true) {                 // ジャンプモード
        dx *= -1;
      } else {                        // 通常モード
        dx = 0;
        x = width - r;
      }
    }
    
    // 自キャラのx座標の更新
    x += dx;
    
  }
  
    
  void updateY(int floorHeight) {
    
    // 自キャラのy方向の更新量の変化分を設定(重力？)
    float g = 0.2;
    
    // ジャンプモードの時の処理
    if(isJump == true) {
      if(dy < a) { 
        dy += g;
      }
      
      // 自キャラがウィンドウの下端に到達したら
      if(y + r > floorHeight) {
        isJump = false;
        dy = 0;
        y = floorHeight - r;
        keyCode = 40;
      }
      
      // 自キャラのy座標の更新
      y += dy;
    }
    
  }

}
