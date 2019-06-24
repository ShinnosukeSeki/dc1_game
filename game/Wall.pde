abstract class Wall{
  float x,y,w,h;
  
  Wall(float wallX, float wallY, float wallW, float wallH){
    x = wallX;
    y = wallY;
    w = wallW;
    h = wallH;
  }
  
  void display(){
    rect(x, y, w, h);
  }
    
  abstract void move(float step);
}
