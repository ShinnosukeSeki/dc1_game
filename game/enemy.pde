class Enemy{
  int x,y,size,vx=1,vy=1,x0,y0;
  int limtx,limty;
  boolean isDied = false;
  int life = 5;
  
  Enemy(int a,int b, int c){
    x0 = a;
    y0 = b;
    x = a;
    y = b;
    size = c;
    limtx = x + 50;
    limty = y + 50;
  }
  
  void move(){
    if(!isDied){
      if(x > limtx || x < x0){
        vx*=-1;
      }
      if(y > limtx || y < y0){
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
        y=height - int(random(0,400))-30-size*2;
        limtx = x + 50;
        limty = y + 50;
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
