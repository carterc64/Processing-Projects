
public class Tower {
  
  Object[] guns, enemys;
  float x, y, radius;
  int health, cooldown;
 
  Tower(PVector origin){
    //System.out.println(origin.x);
    x = origin.x;
    //System.out.println(x);
    y = origin.y;
    radius = 80;
    health = 100;
    cooldown = 1000;
    //guns = new Object[10];
    //enemys = new Object[10];
  }
  
  
  public boolean collison() {
    //if(Math.pow(this.x-x, 2) + Math.pow(this.y-y, 2) <= this.radius*this.radius) {
     // health--;
     // return true;
   // }
    return false;
  }
  
  
  public void display(){
    circle(x, y, radius);
  }
  
}