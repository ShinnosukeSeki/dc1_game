abstract class Trap{
  abstract void display();
  
  abstract void move(float step);
  
  abstract boolean isTouched(float playerX, float playerY);
}
