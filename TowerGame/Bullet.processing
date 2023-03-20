public class Bullet {
  float x, y,rotate, radius, speed, tX, tY;
  int damage, pierce;
  Enemy enemy;
  
  Bullet(Enemy enemy){
    x = 250;
    y = 250;
    radius = 20;
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
    this.collison();
    this.speed += 0.0003;
  }
    
  public void collison(){
    if(enemy.spawn > 1){
      if(enemy.x - (x+5) <= 0 && enemy.y - (y+5) <= 0){
        enemy.health -= damage;
        pierce--;
      } 
    } else {
      if(enemy.x - (x-5) >= 0 && enemy.y - (y-5) >= 0){
        enemy.health -= damage;
        pierce--;
      } 
    }
  }
 
  
  void display(){
    this.update();
    circle(x,y,radius);
  }
  
}
