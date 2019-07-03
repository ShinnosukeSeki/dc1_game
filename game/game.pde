/*
======================================================================
                             グローバル変数の宣言，初期化
======================================================================
*/

int stage;//ステージ
int floors[] = {2, 0, 0, 1}; //floors[i]はステージ1が必要される床数,bはステージ2,cはステージ3,dはステージ4,各自具体的な数字で与えてください。 
int walls[]  = {2, 0, 0, 0};

int n_floor = 0;
int n_wall = 0;
float ground=1000;

Wall wall[];
Floor floor[];
Flag flag;
Java_c player;
Spike s1, s2;
Magma m1;
/*
======================================================================
                             setup()関数
======================================================================
*/
void setup() {
  
  size(800, 500);
  
  stage = 0;
  
  frameRate(120);
  textSize(30);
  textAlign(CENTER, CENTER);
  flag = new Flag();
  //floorのセット
  for(int i=0; i<floors.length; i++){
    n_floor += floors[i];
  }
  floor = new Floor[n_floor];
  floor[0] = new Floor(0,350,width-200,10);
  floor[1] = new Floor(-100,300,250,20);
  floor[2] = new Floor(0,height-30,width,5);
  /*
  ここで床を設定してください,例:floor[0]= new Floor(x,y,l,h);　-----x,yは座標,lは長さ,hは高さ,rect()に対応する
  */
  
  //Wallのセット
  for(int i=0; i < walls.length; i++){
    n_wall += walls[i];
  }
  wall = new Wall[n_wall];
  wall[0] = new Wall(500,0,500);
  wall[1] = new MovingWall(100,0,500);
  
  player = new Java_c(width/2, height-100);
  
  s1 = new MovingSpike(width/2, height, 'u');
  s2 = new StoppingSpike(width/2, height/2, 'd');
  m1 = new StoppingMagma(200, 400, 50, 10);
  

}

/*
======================================================================
                             draw()関数
======================================================================
*/
void draw() {
  
  background(255);
  //ステージ画面ごとにWALLと床を設定してください
  switch(stage){
    case 0:
    //ステージ開始画面(0)の内容はここで書いてください
      floor[0].display();
      floor[1].display();
      wall[0].display();
      wall[1].display();
      wall[1].move(1,0,100,0);
      //壁判定
      for(int i = 0; i < walls[0]; i++){
        wall[i].isbound();
      }
      //
      
      //床判定
      for(int i = 0; i < floors[0]; i++){
        if(floor[i].isstand()){
          ground  = floor[i].y+player.r;
          break;
        }else{
          ground =1000;
        }
      }
      //
      
      s1.display();
      s2.display();
      s1.move(3.0);
      m1.display();
      
      player.move();
      judge_stage();
      break;
    
    case 1:
    //ステージ1の内容はここで書いてください
      player.move();
      judge_stage();
      break;
    
    case 2:
    //ステージ2内容はここで書いてください
      player.move();
      judge_stage();
      break;
    
    case 3:
    //ステージゴール画面(3)の内容はここで書いてください
      floor[2].display();
      flag.display();
      player.move();
      judge_stage();
      break;
    
    default:
      break;
  }  
  player.display();
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
  //ステージ2には１に戻せるし,ステージ3にも行ける
  if(stage == 2  ){
    if(player.x >= width){
      stage++;
      player.x = 1;
    }
    if(player.x <= 0){
      stage--;
      player.x = width - 1;
    }
  }
  //ステージ3はステージ2には戻せるが、次のステージが無いため進めない
  if(stage == 3){
    if(player.x <= 0){
      stage--;
      player.x = width - 1;
    }
  }
}

void keyReleased() {
  keyCode = 40;
}
