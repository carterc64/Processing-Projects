public class Enemy {
    public float x, y, rotate, size, distance, tX, tY, health, spawn, sector, speed;
    //public boolean targeted = false;
    public PVector position;

    Enemy(float xWidth, float yHeight, PVector center, float speed){
      sector = 0;
        spawn = random(2);
        if(spawn <= 1){
            x = random(0, xWidth);
            y = random(0, yHeight/2-5);
            if(y > yHeight/5){
              if(x > xWidth/2){
                sector = 1;
                x = xWidth;
              }else{
                x = 0;
                y -= 50;
              }
            } else {
              y = 0;
            }
         
        } else{
            x = random(0, xWidth);
            y = random(yHeight/2+5, yHeight);
            if(y < yHeight-(yHeight/5)){
              if(x > xWidth/2){
                x = xWidth;
              }else{
                sector = 1;
                x = 0;
                y += 50;
              }
           } else {
             y = yHeight;
           }
       }

        rotate = 0;
        distance = 1;
        this.speed = speed;
        tX = center.x;
        tY = center.y;
        health = int(random(1,4));
        if(health == 1){
          size = 20; 
        }else if (health == 2){
          size = 25;
        } else {
          size = 30;
        }
        
          
    }
    
    public void deathAnimation(DeathParticles dp){
      dp.addParticles(new PVector(x,y));
    }  
    
    public void hitAnimation(DeathParticles dp){
      dp.addParticle(new PVector(x,y));
    }

    public void update(){
        this.x = lerp(tX, x, distance);
        this.y = lerp(tY, y, distance);
        this.distance -= speed;
    }

    public void display(){
        this.update();
        square(x, y, size);
    }
}