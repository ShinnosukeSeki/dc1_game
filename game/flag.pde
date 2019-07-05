class Flag{
  float x = width - 100;
  float y = height - 100;
  void display(){
    rect(x,y,50,20);
    line(x,y,x,height-10);
    fill(255,0,0);
    ellipse(x + 25, y + 10, 10, 10);
    noFill();
  }
}
