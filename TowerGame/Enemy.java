public class Enemy {
  public float x, y, rotate, size, speed, tX, tY, health, spawn;

  Enemy(){
      spawn = random(2);
      if(spawn <= 1){
          x = random(0, 500);
          y = random(0, 250);
          if(y > 50){
            if(x > 250){
              x = 500;
            }else{
              x = 0;
            }
          } else {
            y = 0;
          }
       
      } else{
          x = random(0, 500);
          y = random(250,500);
          if(y < 450){
            if(x > 250){
              x = 500;
            }else{
              x = 0;
            }
         } else {
           y = 500;
         }
     }

      rotate = 0;
      size = 20;
      speed = 1;
      tX = 250;
      tY = 250;
      health = 1;
   
  }

  public void update(){
      this.x = lerp(tX, x, speed);
      this.y = lerp(tY, y, speed);
      this.speed -= 0.0001;
  }

  public void display(){
      this.update();
      square(x, y, size);
  }
}