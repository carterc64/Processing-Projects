
public class Tower {
  
  Object[] guns;
  float x, y, radius;
  int health, cooldown;
  
  
  Tower(){
    x = 250;
    y = 250;
    radius = 80;
    health = 100;
    cooldown = 1000;
    guns = new Object[10];
  }
  
  public void rotate() {
    for(int i = 0; i < guns.length; i++) {
      try {
        Thread.sleep(150);
      } catch (InterruptedException e) {
        e.printStackTrace();
      }
    }
  }
  
  public boolean collison(float x, float y) {
    if(Math.pow(this.x-x, 2) + Math.pow(this.y-y, 2) <= this.radius*this.radius) {
      health--;
      return true;
    }
    return false;
  }
  
  
  public void display(){
    circle(x, y, radius);
  }
  
  
}
