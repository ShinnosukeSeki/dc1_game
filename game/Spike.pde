abstract class Spike extends Trap{
  float x,y,size; //x,yはトゲの中心座標
  float stepX, stepY;
  char direction; //トゲの向き(上：u，下：d，左：l，右：r)
  boolean isMoved = false;
  
  Spike(float spikeX, float spikeY, float spikeS, char spikeD){
    x = spikeX;
    y = spikeY;
    size = spikeS;
    direction = spikeD;
  }
  
  void display(){
    fill(255);
    
    pushMatrix();
    translate(x,y);//中心座標

    //各頂点を直線で結んで三角形を描画（各頂点の座標は中心からの距離）
    beginShape();
    vertex(-size/2, size/2);
    vertex(size/2, size/2);
    vertex(0, -size/2);
    endShape(CLOSE);
    
    popMatrix();
    
    //↑ triangle(x-size/2,y+size/2,x+size/2,y+size/2,x,y-size/2)と同じ三角形
  }
  
  abstract void move();
}
