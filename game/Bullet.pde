class Bullet {
  
  // 弾の座標
  float x = 0, y = 0;
  
  // 弾を撃った時のプレイヤーの座標
  float x_0 = 0, y_0 = 0;
  
  // 弾を撃った時のマウスの座標
  float x_1 = 0, y_1 = 0;
  
  // 弾を描画すべきかどうか
  // (画面外にでるか敵に当たると消滅)
  boolean isDisplayed;
  
  Bullet() {
    isDisplayed = false;
  }
  
  void setX() {
    x = player.x;
    x_0 = player.x;
    x_1 = mouseX;
  }
  
  void setY() {
    y = player.y;
    y_0 = player.y;
    y_1 = mouseY;
  }
    
  
  void display() {
    fill(0);
    ellipse(x, y, 10, 10);
  }
  
  void move() {
    
    // 弾を打った時のプレイヤーとマウスのx座標の関係を参照し
    // 弾のx座標の更新の仕方を変える
    if(x_0 > x_1) {
      x =x-5;
    } else {
      x =x+5;
    }

    y = (y_1-y_0) / (x_1-x_0)  * (x-x_0) + y_0;
  }
  
  // 画面外に出るか
  // 敵に当たったかどうかの判定
  void judge() {
    
    // 画面外に出たら描画しないようにする
    if(x < 0 || x > width || y < 0 || y > height) {
      isDisplayed = false;
    }
    
    // 敵に当たったら弾と敵を描画しないようにする
    if(dist(x,y,enemy.x,enemy.y) <= enemy.size * 2){
      enemy.isDied = true;
    }
  }

}
