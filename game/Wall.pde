abstract class Wall{
  float x,y,w,h;
  
  Wall(float wallX, float wallY, float wallW, float wallH){
    x = wallX;
    y = wallY;
    w = wallW;
    h = wallH;
  }
  
  void display(){
    fill(200, 150, 150);
    rect(x, y, w, h);
  }
    
  abstract void move(float stepX, float stepY, float limitX, float limitY);
}
