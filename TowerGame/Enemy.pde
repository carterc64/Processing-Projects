public class Enemy {
    public float x, y, rotate, size, speed, tX, tY, health, spawn, sector;
    //public boolean targeted = false;
    public PVector position;

    Enemy(){
      sector = 0;
        spawn = random(2);
        if(spawn <= 1){
            x = random(0, 500);
            y = random(0, 245);
            if(y > 100){
              if(x > 250){
                sector = 1;
                x = 500;
              }else{
                x = 0;
              }
            } else {
              y = 0;
            }
         
        } else{
            x = random(0, 500);
            y = random(255,500);
            if(y < 400){
              if(x > 250){
                x = 500;
              }else{
                sector = 1;
                x = 0;
              }
           } else {
             y = 500;
           }
       }

        rotate = 0;
        speed = 1;
        tX = 250;
        tY = 250;
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
        this.x = lerp(tX, x, speed);
        this.y = lerp(tY, y, speed);
        this.speed -= 0.00007;
    }

    public void display(){
        this.update();
        square(x, y, size);
    }
}