abstract class Spike extends Trap{
  float x0, y0, x, y, size = 30; //x0,y0は初期座標, x,yはトゲの中心座標
  char direction; //トゲの向き(上：u，下：d，左：l，右：r)
  
  Spike(float spikeX, float spikeY, char spikeD){
    x0 = spikeX;
    y0 = spikeY;
    x = x0;
    y = y0;
    direction = spikeD;
  }
  
  void setDefault(){
    x = x0;
    y = y0;
  }
  
  void display(){
    fill(255);
    
    pushMatrix();
    translate(x,y);//中心座標
    
    //各頂点を直線で結んで三角形を描画（各頂点の座標は中心からの距離，triangle()でも描ける）
    beginShape();
    switch(direction){
      case 'u':
      vertex(-size/2, size/2);
      vertex(size/2, size/2);
      vertex(0, -size/2);
      break;
      case 'd':
      vertex(-size/2, -size/2);
      vertex(size/2, -size/2);
      vertex(0, size/2);
      break;
      case 'l':
      vertex(size/2, -size/2);
      vertex(size/2, size/2);
      vertex(-size/2, 0);
      break;
      case 'r':
      vertex(-size/2, -size/2);
      vertex(-size/2, size/2);
      vertex(size/2, 0);
      break;
      default:
      println("directionの値が不正です");
      break;
    }
    endShape(CLOSE);
    
    popMatrix();      
  }
  
  abstract void move(float step);
  
  boolean isTouched(float playerX, float playerY, float playerR){
    if( (x-size/2 <= playerX+playerR && playerX-playerR <= x+size/2 || x-size/2 <= playerX-playerR && playerX-playerR <= x+size/2)
     && (y-size/2 <= playerY+playerR && playerY-playerR <= y+size/2 || y-size/2 <= playerY+playerR && playerY-playerR <= y+size/2) ){
      return true;
    }else{
      return false;
    }
  }
}
