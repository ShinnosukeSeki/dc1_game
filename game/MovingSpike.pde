class MovingSpike extends Spike{
  MovingSpike(float spikeX, float spikeY, char spikeD){
    super(spikeX, spikeY, spikeD);
  }
  
  void move(float step){
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
