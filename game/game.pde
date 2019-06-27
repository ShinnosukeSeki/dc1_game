/*
======================================================================
                             グローバル変数の宣言，初期化
======================================================================
*/

int stage;          //ステージ
int a = 2,b =0 ,c =0 ,d = 0;        //aはステージ1が必要される床数,bはステージ2,cはステージ3,dはステージ4,各自具体的な数字で与えてください。
int n_floor=a+b+c+d;
Floor floor[];
JavaC player;
Wall w1;
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
  
  floor = new Floor[n_floor];
  floor[0] = new Floor(0,350,width,10);
  floor[1] = new Floor(-100,300,250,20);
  /*
  ここで床を設定してください,例:floor[0]= new Floor(x,y,l,h);　-----x,yは座標,lは長さ,hは高さ,rect()に対応する
  */
  
  player = new JavaC(width/2, height-500);
  
  s1 = new MovingSpike(width/2, height, 20, 'u');
  s2 = new StoppingSpike(width/2, height/2, 20, 'd');
  
  m1 = new StoppingMagma(200, 400, 50, 10);
  
  w1 = new StoppingWall(0, 0, 20, height);

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
      w1.display();
      s1.display();
      s2.display();
      s1.move(3.0);
      m1.display();
      player.move(0,a);
      judge_stage();
      break;
    
    case 1:
    //ステージ1の内容はここで書いてください
      player.move(a,b);
      judge_stage();
      break;
    
    case 2:
    //ステージ2内容はここで書いてください
      player.move(c,d);
      judge_stage();
      break;
    
    case 3:
    //ステージゴール画面(3)の内容はここで書いてください
      player.move(d,n_floor-1);
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
