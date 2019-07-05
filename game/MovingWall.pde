class MovingWall extends Wall{
  float x0 = x;
  float y0 = y;
  float stepX, stepY;
  
  MovingWall(float wallX, float wallY, float wallH, float wallStepX, float wallStepY){
    super(wallX, wallY, wallH);
    stepX = wallStepX;
    stepY = wallStepY;
  }
  
  void move(float limitX, float limitY){//limitX,limitY = 壁が跳ね返る座標
    x += stepX;
    y += stepY;
    if(x > limitX || x < x0){
      stepX = -stepX;
    }
    if(y > limitY || y < y0){
      stepY = -stepY;
    }      
  }
}
