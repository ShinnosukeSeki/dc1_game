class MovingSpike extends Spike{
  MovingSpike(float spikeX, float spikeY, float spikeS, char spikeD){
    super(spikeX, spikeY, spikeS, spikeD);
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
