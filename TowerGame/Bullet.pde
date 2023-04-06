public class Bullet {
  float x, y,rotate, radius, speed, tX, tY;
  int damage, pierce;
  Enemy enemy;
  
  Bullet(Enemy enemy, PVector center){
    x = center.x;
    y = center.y;
    radius = 10;
    tX = enemy.x;
    tY = enemy.y;
    speed = 0;
    damage = 1;
    this.enemy = enemy;
    pierce = 1;
  }
  
  
  public void update(){
    this.x = lerp(x, tX, speed);
    this.y = lerp(y, tY, speed);
   // this.collison();
    this.speed += 0.0003;
  }
  
  void display(){
    this.update();
    circle(x,y, radius);
  }
  
}