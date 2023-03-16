public class Enemy {
    public float x, y, rotate, size, speed, tX, tY, health, spawn;

    Enemy(){
        spawn = random(4);
        if(spawn >= 3){
            x = random(0, 500);
            y = 0;
        } else if(spawn >= 2)  {
            x = random(0, 250);
            y = random(0, 250);
            if(x >= y){
              y = 0;
            } else {
              x = 0;
            }
        } else if(spawn >= 1){
            x = random(0, 250);
            y = random(250, 500);
            if(random(1,2) >= 1.5){
              x = 0;
            } else {
              y = 500;
            }
        } else {
          x = random(250, 500);
          y = random(250,500);
          if(x >= y){
            y = 500;
          } else {
            x = 500;
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