class Floor{
  int y0,x,y,l,h;
  boolean isFallen = false;
  
  Floor(int a, int b, int c,int d){
    x=a;
    y0=b;
    l=c;
    h=d;
    y=y0;
  }
  
  void setDefault(){
    y = y0;
    isFallen = false;
  }
  
  void display(){
    fill(0);
    rect(x, y+player.r, l, h);
  }
  
  void isFallen(float playerX){
    if( (x < playerX && playerX < x+l) && isstand()){
      isFallen = true;
    }
  }
    
  void fall(float stepY){
    if(! isFallen){
      isFallen(player.x);
    }
    if(isFallen){
      y += stepY;
      player.y = y;//床落下中はジャンプできないようにする
    }
  }
  
  //playerが床に立てるかのを調べる
  boolean isstand(){
    if(player.y - y >= 0 && player.y - y <= 10){
      if(player.x >= x && player.x <= x+l){ 
        return true;
      }
    }
    return false;
  }
  //playerの頭が床に当てるかのを調べる
}
