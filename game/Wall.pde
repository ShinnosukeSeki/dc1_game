class Wall{
  float x,y;
  float w=15;
  float h;
  
  Wall(float wallX, float wallY, float wallH){
    x = wallX;
    y = wallY;
    h = wallH;
  }
  
  void display(){
    fill(200, 150, 150);
    rect(x, y, w/2, h);
  }
    
  void move(float stepX, float stepY, float limitX, float limitY){
  //do nothing
  }
  
  
  //isbound
  void isbound(){
    if(player.y >= y && player.y <= y+h){
      if(abs(player.x - x) <= player.r/2){
        player.dx *= -0.7;
        if(player.x - x <= 0){
          player.x = x - player.r;
        }else{
          player.x = x + player.r*2;
        }
      }
    }
  }
}
