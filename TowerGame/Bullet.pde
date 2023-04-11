public class Bullet {
  float x, y,rotate, radius, distance, tX, tY, bulletSpeed;
  int damage, pierce;
  Enemy enemy;
  
  Bullet(Enemy enemy, PVector center, float bulletSpeed){
    x = center.x;
    y = center.y;
    radius = 10;
    tX = enemy.x;
    tY = enemy.y;
    distance = 0;
    this.bulletSpeed = bulletSpeed;
    damage = 1;
    this.enemy = enemy;
    pierce = 1;
  }
  
  
  public void update(){
    this.x = lerp(x, tX, distance);
    this.y = lerp(y, tY, distance);
   // this.collison();
    this.distance += bulletSpeed;
  }
  
  void display(){
    this.update();
    circle(x,y, radius);
  }
  
}