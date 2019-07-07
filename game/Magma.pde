abstract class Magma{
  float x, y, w, h;                           //x,yはマグマの左上頂点の座標, w,hはマグマの幅と高さ
  
  Magma(float magmaX, float magmaY, float magmaW, float magmaH) {
    x = magmaX;
    y = magmaY;
    w = magmaW;
    h = magmaH;
  }
  
  void display() {
    fill(color(255, 0, 0));                   //赤色にする
    noStroke();                               //輪郭なしにする
    rect(x, y, w, h);                         //マグマを描画
    stroke(0);                                //輪郭ありにする
  }
  
  abstract void move(float step);
  
  boolean isTouched(float playerX, float playerY, float playerR) {
    if( ((x <= playerX+playerR && playerX+playerR <= x + w) || (x <= playerX-playerR && playerX-playerR <= x + w))
    && ((y <= playerY+playerR && playerY+playerR <= y + h) || (y <= playerY+playerR && playerY+playerR <= y + h)) ) {    //playerがマグマの範囲内に入ったら
      return true;
    } else {
      return false;
    }
  }
}
