abstract class Magma extends Trap{
  float x, y, w, h;                           //x,yはマグマの左上頂点の座標, w,hはマグマの幅と高さ
  
  Magma(float magmaX, float magmaY, float magmaW, float magmaH) {
    x = magmaX;
    y = magmaY;
    w = magmaW;
    h = magmaH;
  }
  
  void display() {
    fill(color(255, 0, 0));                   //赤色にする
    rect(x, y, w, h);                         //マグマを描画
  }
  
  abstract void move(float step);
}
