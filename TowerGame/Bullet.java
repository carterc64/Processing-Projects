public class Bullet {
  float x, y, xSpeed, ySpeed, tip, rotate, radius, path, tX, tY;
  
  Bullet(float X, float Y){
    x = 250;
    y = 250;
    xSpeed = 2;
    ySpeed = 2;
    radius = 20;
    path = 0;
    tX = X;
    tY = Y;
  }
  
  
  public void update(){
    this.x = lerp(x, tX, path);
    this.y = lerp(y, tY, path);
    this.path += 0.0005;
  }
 
  
  void display(){
    this.update();
    circle(x,y,radius);
  }
  
}
