/*
======================================================================
                             グローバル変数の宣言，初期化
======================================================================
*/
int tip;
int stage;//ステージ
int floors[] = {1, 7, 3}; //floors[i]はステージiで必要な床数,各自具体的な数字で与えてください。 
int walls[]  = {0, 5, 4};
int spikes[] = {0, 6, 2};
int magmas[] = {0, 3, 1};

int n_floor = 0;
int n_wall = 0;
int n_spike = 0;
int n_magma = 0;
int n_bullet = 3;          // 撃てる弾の数
float ground = 1000;

PImage description_img1;
PImage description_img2;
PImage tip_img0;
PImage tip_img1;
PImage tip_img2;
PImage tip_img3;
PImage tip_img4;
PImage clear_img;

Wall wall[];
Floor floor[];
Flag flag;
Enemy enemy;
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
  
  stage = 2;
  tip = 0;
  frameRate(120);
  noSmooth();
  textSize(30);
  textAlign(CENTER, CENTER);
  flag = new Flag();
  
  //floorのセット
  for(int i=0; i<floors.length; i++){
    n_floor += floors[i];
  }
  floor = new Floor[n_floor];
  floor[0] = new Floor(0, height-150, width, 10);
  floor[1] = new Floor(0, height-30, width/2-10, 10);
  floor[2] = new Floor(width/2-10, height-30, 150, 10);
  floor[3] = new Floor(width/2+140, height-30, width/2-140, 10);
  floor[4] = new Floor(200,height-150, 200, 10);
  floor[5] = new Floor(300, height-270, 100, 10);
  floor[6] = new Floor(350, height-400, 50, 10);
  floor[7] = new Floor(550, height-400, 20, 10);
  floor[8] = new Floor(200,height-30,600,10);
  floor[9] = new Floor(0,height-30,150,10);
  floor[10] = new Floor(150,height-150,50,10);
  /*
  ここで床を設定してください,例:floor[0]= new Floor(x,y,l,h);　-----x,yは座標,lは長さ,hは高さ,rect()に対応する
  */
  
  //Wallのセット
  for(int i=0; i < walls.length; i++){
    n_wall += walls[i];
  }
  wall = new Wall[n_wall];
  wall[0] = new MovingWall(50, 0, 300, 1, 0);
  wall[1] = new StoppingWall(100,height-110,100);
  wall[2] = new StoppingWall(200,height-175, 40);
  wall[3] = new StoppingWall(400, height-385,260);
  wall[4] = new StoppingWall(width-10, 250, 150);
  wall[5] = new MovingWall(0,height-80,80,-1,0);
  wall[6] = new StoppingWall(150, height-80,100);
  wall[7] = new MovingWall(width-150, height-230,200,-5,0);
  wall[8] = new StoppingWall(width-10, 0,height);
  
  
  //Spikeのセット
  for(int i=0; i < spikes.length; i++){
    n_spike += spikes[i];
  }
  spike = new Spike[n_spike];
  spike[0] = new MovingSpike(350, height-110, 'd');
  spike[1] = new StoppingSpike(215, height-110, 'd');
  spike[2] = new StoppingSpike(375, height-360, 'd');
  spike[3] = new StoppingSpike(550, height-30, 'u');
  spike[4] = new StoppingSpike(620, height-30, 'u');
  spike[5] = new StoppingSpike(width-25, 350, 'l');
  spike[6] = new StoppingSpike(width-400, 350, 'd');
  spike[7] = new StoppingSpike(width-300,height-15 , 'u');
  
  //Magmaのセット
  for(int i=0; i < magmas.length; i++){
    n_magma += magmas[i];
  }
  magma = new Magma[n_magma];
  magma[0] = new StoppingMagma(350, height-135, 50, 10);
  magma[1] = new StoppingMagma(350, height-255, 50, 10);
  magma[2] = new StoppingMagma(560, height-15, 50, 10);
  magma[3] = new StoppingMagma(width-200,height-15,50,10);
  
  
  //Java_c（プレイヤー）とBulletのセット
  enemy = new Enemy(100,400,20);
  player = new Java_c(30, height-300);
  b = new Bullet[n_bullet];
  for(int i=0; i < n_bullet; i ++) {
    b[i] = new Bullet();
  }
  
  // 画像データの読み込み
  description_img1 = loadImage("description.png");
  description_img2 = loadImage("description2.png");
  tip_img0 = loadImage("tip0.png");
  tip_img1 = loadImage("tip1.png");
  tip_img2 = loadImage("tip2.png");
  tip_img3 = loadImage("tip3.png");
  tip_img4 = loadImage("tip4.png");
  clear_img = loadImage("clear.jpg");
}

/*
======================================================================
                             draw()関数
======================================================================
*/
void draw() {
  
  if(player.y > height){
    player.isDied = true;
  }
  
  //ステージ画面ごとにWALLと床を設定してください
  switch(stage){
    case 0:
    //ステージ開始画面(0)の内容はここで書いてください
      background(230);
    
      image(description_img1, 0, 0, width/1.5, height/2);
      image(description_img2, 500, 0, 300, height/2);
      
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
      
      // ヒントの描画処理
      if(tip == 0) {
        image(tip_img0, 50, height-100, 300, 70);
      } else if(tip == 1){
        image(tip_img1, 50, height-100, 300, 70);
      } else if(tip == 2) {
        image(tip_img2, 50, height-100, 300, 70);
      } else if(tip == 3) {
        image(tip_img3, 50, height-100, 300, 70);
      } else if(tip >= 4) {
        image(tip_img4, 50, height-100, 300, 90);
      }

      player.move();
      judge_stage();
      break;
    
    case 1:    
    //ステージ1の内容はここで書いてください
      background(120);
    
      //壁判定
      for(int i = walls[0]; i < walls[0]+walls[1]; i++){
        wall[i].display();
        wall[i].isbound();
      }
      //
      wall[0].move(width-20, 0);
      
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
      floor[2].fall(5);
    
      for(int i = spikes[0]; i < spikes[0]+spikes[1]; i++){
        spike[i].display();
        if( spike[i].isTouched(player.x, player.y, player.r) ){
          player.isDied = true;
        }
      }
      spike[0].move(5, player.x, player.y, 25, 120);
      
      for(int i = magmas[0]; i < magmas[0]+magmas[1]; i++){
        magma[i].display();
        if( magma[i].isTouched(player.x, player.y, player.r) ){
          player.isDied = true;
        }
      }
      
      player.move();
      judge_stage();
      break;
    
    case 2:
    //ステージ2内容はここで書いてください
      background(190);
    
      //壁判定
      for(int i = walls[0]+walls[1]; i < walls[0]+walls[1]+walls[2]; i++){
        wall[i].display();
        wall[i].isbound();
      }
      //
      wall[5].move(400,0);
      if(enemy.life <= 0){
        wall[7].move(3000,0);
      }
      //床判定
      for(int i = floors[0]+floors[1]; i < floors[0]+floors[1]+floors[2]; i++){
        if(floor[i].isstand()){
          ground  = floor[i].y+player.r;
          break;
        }else{
          ground =1000;
        }
      }
      
      for(int i = spikes[0]+spikes[1]; i < spikes[0]+spikes[1]+spikes[2]; i++){
        spike[i].display();
        if( spike[i].isTouched(player.x, player.y, player.r) ){
          player.isDied = true;
        }
      }
       
      for(int i = floors[0]+floors[1]; i < floors[0]+floors[1]+floors[2]; i++){
        floor[i].display();
      }
      for(int i = magmas[0]+magmas[1]; i < magmas[0]+magmas[1]+magmas[2]; i++){
        magma[i].display();
        if( magma[i].isTouched(player.x, player.y, player.r) ){
          player.isDied = true;
        }
      }
      
      //
      enemy.move();
      enemy.display();
      flag.display();
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
    text("GAME OVER", width/2, height/2-20);
    textSize(30);
    text("r:restart", width/2, height/2+20);
    
    if(keyPressed){
      if(key == 'r'){
        if(stage == 0){
          tip++;
        }
        stage = 2;
        for(int i = 0; i < walls[0]+walls[1]+walls[2]; i++){
          wall[i].setDefault();
        }
        for(int i = 0; i < floors[0]+floors[1]+floors[2]; i++){
          floor[i].setDefault();
        }
        for(int i = 0; i < spikes[0]+spikes[1]+spikes[2]; i++){
          spike[i].setDefault();
        }
        player.setDefault();
        enemy.setDefault();
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
  
  // クリア判定(一回以上死んでいないとクリアできない)
  if(tip > 0 && stage == 0) {
    for(int i = 0; i < n_bullet; i++) {
      if(b[i].isDisplayed == true) {
        if(judge_clear((int)(b[i].x), (int)(b[i].y)) == true) {
          image(clear_img, 0, 0, width, height);
          noLoop();
        }
      }
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

// 弾の座標を受け取り
// 指定された範囲内に撃たれた時
// ゲームクリア画面を表示するため
// trueを返す
boolean judge_clear(int x, int y) {  
  if(100 < x && x < 200 && 100 < y && y < 140) {
    return true;
  }
  return false;
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
