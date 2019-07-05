/*
======================================================================
                             グローバル変数の宣言，初期化
======================================================================
*/
int tip;
int stage;//ステージ
int floors[] = {1, 4, 0}; //floors[i]はステージ1で必要な床数,bはステージ2,cはステージ3,dはステージ4,各自具体的な数字で与えてください。 
int walls[]  = {0, 2, 0};
int spikes[] = {0, 4, 0};
int magmas[] = {0, 1, 0};

int n_floor = 0;
int n_wall = 0;
int n_spike = 0;
int n_magma = 0;
int n_bullet = 3;          // 撃てる弾の数
float ground = 1000;

Wall wall[];
Floor floor[];
Flag flag;
Java_c player;
Bullet b[];
Spike spike[];
Magma magma[];
/*
======================================================================
                             setup()関数
======================================================================
*/
void setup() {
  
  size(800, 500);
  
  stage = 0;
  tip = 0;
  frameRate(120);
  textSize(30);
  textAlign(CENTER, CENTER);
  flag = new Flag();
  //floorのセット
  for(int i=0; i<floors.length; i++){
    n_floor += floors[i];
  }
  floor = new Floor[n_floor];
  floor[0] = new Floor(0,height-150,width,10);
  floor[1] = new Floor(0,height-30,width,10);
  floor[2] = new Floor(200,height-150, 200, 10);
  floor[3] = new Floor(350, height-270, 100, 10);
  floor[4] = new Floor(420, height-400, 50, 10);
  /*
  ここで床を設定してください,例:floor[0]= new Floor(x,y,l,h);　-----x,yは座標,lは長さ,hは高さ,rect()に対応する
  */
  
  //Wallのセット
  for(int i=0; i < walls.length; i++){
    n_wall += walls[i];
  }
  wall = new Wall[n_wall];
  wall[0] = new Wall(100,height-110,100);
  wall[1] = new MovingWall(50,0,300);
  
  player = new Java_c(30, height-300);
  b = new Bullet[n_bullet];
  for(int i=0; i < n_bullet; i ++) {
    b[i] = new Bullet();
  }
  
  for(int i=0; i < spikes.length; i++){
    n_spike += spikes[i];
  }
  spike = new Spike[n_spike];
  spike[0] = new MovingSpike(width/2, height-30, 'u');
  spike[1] = new StoppingSpike(440, height-360, 'd');
  spike[2] = new StoppingSpike(400, height-30, 'u');
  spike[3] = new StoppingSpike(500, height-30, 'u');
  
  for(int i=0; i < magmas.length; i++){
    n_magma += magmas[i];
  }
  magma = new Magma[n_magma];
  magma[0] = new StoppingMagma(200, 400, 50, 10);
  

}

/*
======================================================================
                             draw()関数
======================================================================
*/
void draw() {
  
  background(255);
  
  if(player.y > height){
    player.isDied = true;
  }
  
  //ステージ画面ごとにWALLと床を設定してください
  switch(stage){
    case 0:
    //ステージ開始画面(0)の内容はここで書いてください
    
      text("hogehoge", width/2, height/2);
    
      //壁判定
      for(int i = 0; i < walls[0]; i++){
        wall[i].display();
        wall[i].isbound();
      }
      //
      
      for(int i = 0; i < floors[0]; i++){
        floor[i].display();
      }
      //床判定
      for(int i = 0; i < floors[0]; i++){
        if(floor[i].isstand()){
          ground = floor[i].y+player.r;
          break;
        }else{
          ground = 1000;
        }
      }
      //
      if(tip >= 3){
        text("s",50,50);
      }
      
      player.move();
      judge_stage();
      break;
    
    case 1:    
    //ステージ1の内容はここで書いてください
    
      //壁判定
      for(int i = walls[0]; i < walls[0]+walls[1]; i++){
        wall[i].display();
        wall[i].isbound();
      }
      //
      wall[1].move(1, 0, width, 0);
      
      for(int i = floors[0]; i < floors[0]+floors[1]; i++){
        floor[i].display();
      }
      //床判定
      for(int i = floors[0]; i < floors[0]+floors[1]; i++){
        if(floor[i].isstand()){
          ground = floor[i].y+player.r;
          break;
        }else{
          ground = 1000;
        }
      }
      //
    
      for(int i = spikes[0]; i < spikes[0]+spikes[1]; i++){
        spike[i].display();
        if( spike[i].isTouched(player.x, player.y) ){
          player.isDied = true;
        }
      }
      spike[0].move(3.0);
      
      for(int i=magmas[0]; i<magmas[0]+magmas[1]; i++){
        magma[i].display();
        if( magma[i].isTouched(player.x, player.y) ){
          player.isDied = true;
        }
      }
      
      player.move();
      judge_stage();
      break;
    
    case 2:
    //ステージ2内容はここで書いてください
      //壁判定
      for(int i = walls[0]+walls[1]; i < walls[0]+walls[1]+walls[2]; i++){
        wall[i].isbound();
      }
      //
      
      //床判定
      for(int i = floors[0]+floors[1]; i < floors[0]+floors[1]+floors[2]; i++){
        if(floor[i].isstand()){
          ground  = floor[i].y+player.r;
          break;
        }else{
          ground =1000;
        }
      }
      //
      player.move();
      judge_stage();
      break;
      
    default:
      break;
  }  
  
  player.display();
    
  if(player.isDied){
    background(255);
    fill(0);
    textSize(40);
    text("GAME OVER", width/2-50, height/2-20);
    textSize(30);
    text("r:restart", width/2-50, height/2+20);
    
    if(keyPressed){
      if(key == 'r'){
        tip++;
        stage = 0;
        for(int i = 0; i < walls[0]+walls[1]+walls[2]; i++){
          wall[i].setDefault();
        }
        for(int i = 0; i < spikes[0]+spikes[1]+spikes[2]; i++){
          spike[i].setDefault();
        }
        player.setDefault();
      }
    }
  }
  
  for(int i = 0; i < n_bullet; i ++) {
    if(b[i].isDisplayed == true) {
      b[i].display();
      b[i].move();
      b[i].judge();
    }
  }
}

/*
======================================================================
                             自作関数
======================================================================
*/


//ステージの幅を超えたら、ステージ変数を更新する関数。

void judge_stage(){
  //ステージ0と1は進むしかできない,前のステージには戻せない
  if(stage == 0 || stage == 1){
    if(player.x >= width){
      stage++;
      player.x = 1;
    }
  }
  //ステージ2はステージ1には戻せるが、次のステージが無いため進めない
  if(stage == 2){
    if(player.x <= 0){
      stage--;
      player.x = width - 1;
    }
  }
}

void mouseClicked() {
  for(int i = 0; i < n_bullet; i++) {
    if(b[i].isDisplayed == false) {
      b[i].isDisplayed = true;
      b[i].setX();
      b[i].setY();
      break;
    }
  }
}

void keyReleased() {
  keyCode = 40;
}
