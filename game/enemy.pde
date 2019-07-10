class Enemy{
  int x,y,size,vx=1,vy=0,x0,y0;
  int x_set,y_set,life_set=5,size_set;
  int limtx,limty;
  boolean isDied = false;
  int life = 5;
  
  Enemy(int a,int b, int c){
    x0 = a;
    y0 = b;
    x = a;
    y = b;
    x_set=a;
    y_set=b;
    size = c;
    size_set=c;
    limtx = x + 50;
    limty = y + 50;
  }
  
  void setDefault(){
    x=x_set;
    y=y_set;
    x0 = x;
    y0 = y;
    limtx = x+50;
    limty = y+50;
    size=size_set;
    life=life_set;
  }
  
  void move(){
    if(!isDied){
      if(x > limtx || x < x0){
        vx*=-1;
      }
      if(y > limty || y < y0){
        vy*=-1;
      }
      x+=vx;
      y+=vy;
      if(dist(x,y,player.x,player.y) <= size*2){
        player.isDied = true;
      }
    }else{
      if(life > 0){
        isDied = false;
        life--;
        x=int(random(100,500));
        y=height - int(random(0,400))-30;
        limtx = x + 50*(life_set - life);
        limty = y + 50;
        x0 = x;
        y0 = y;
        vx=life_set - life;
        vy=life_set - life;
        size+=10;
      }
    }
  }
    
  
  void display(){
    if(!isDied){
      noFill();
      ellipse(x,y,size*2,size*2);
      fill(200,0,100);
      textSize(size-5);
      text("(^0^)",x,y);
    }
  }
}
