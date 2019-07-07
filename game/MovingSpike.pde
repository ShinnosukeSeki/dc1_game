class MovingSpike extends Spike{
  MovingSpike(float spikeX, float spikeY, char spikeD){
    super(spikeX, spikeY, spikeD);
  }
  
  //トゲを発射するタイミングの設定（プレイヤーの位置に応じて発射する）
  void isMoved(float playerX, float playerY, float sideR, float frontR){
    //sideR = sideRange = （トゲの進行方向に対して）垂直方向の範囲，frontR = トゲの進行方向の範囲（sideR,frontR両方の範囲内にプレイヤーが入った瞬間発射する）  
    switch(direction){
      case 'u':
      if( (x-size/2 - sideR < playerX && playerX < x+size/2 + sideR) && (y-size/2-frontR < playerY && playerY < y+size/2) ){
        isMoved = true;
      }
      break;
      case 'd':
      if( (x-size/2 - sideR < playerX && playerX < x+size/2 + sideR) && (y-size/2 < playerY && playerY < y+size/2 + frontR) ){
        isMoved = true;
      }
      break;
      case 'l':
      if( (x-size/2 - frontR < playerX && playerX < x+size/2) && (y-size/2-sideR < playerY && playerY < y+size/2 + sideR) ){
        isMoved = true;
      }
      break;
      case 'r':
      if( (x-size/2 < playerX && playerX < x+size/2 + frontR) && (y-size/2-sideR < playerY && playerY < y+size/2 + sideR) ){
        isMoved = true;
      }
      break;
    }    
  }
  
  void move(float step, float playerX, float playerY, float sideR, float frontR){
    if(! isMoved){
      isMoved(playerX, playerY, sideR, frontR);
    }
    if(isMoved){
      switch(direction){
        case 'u':
        y -= step;
        break;
        case 'd':
        y += step;
        break;
        case 'l':
        x -= step;
        break;
        case 'r':
        x += step;
        break;
      }
    }
  }
}
