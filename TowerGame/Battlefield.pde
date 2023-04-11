class Battlefield{
  
  boolean pause = false;
    
  int count = 0;
  int enemyIndex = 0;
  int enemySize = 0;
  int lastSector = 5;
  int spawned = 0;
  int dead = 0;
 
  
  int reloadCd; //30
  int enemyCd;  //15
  int maxEnemys; //10
  int screenHeight; //600
  int screenWidth;  //720
  int gap;
  int gunAmount; //5
  int enemyAmount; // add it
  int gunCd;
  int gunReload;
  int gunMagazine;
  
  float enemySpeed;
  float bulletSpeed;
  
  PVector center;
  
  ArrayList<Bullet> bullets;
  ArrayList<Enemy> enemys;
  ArrayList<Gun> guns;
  
  Tower tower;
  Enemy enemy;
  Bullet bullet;
  DeathParticles dp;
  
  Battlefield(int[] level, float enemySpeed, float bulletSpeed) {
                
    this.reloadCd = level[0];
    this.enemyCd = level[1];
    this.maxEnemys = level[2];
    this.screenHeight = level[3];
    this.screenWidth = level[4];
    this.gap = level[5];
    this.gunAmount = level[6];
    this.enemyAmount = level[7];
    this.gunCd = level[8];
    this.gunReload = level[9];
    this.gunMagazine = level[10];
    this.enemySpeed = enemySpeed;
    this.bulletSpeed = bulletSpeed;
    
    
    center = new PVector ((screenWidth)/2,(screenHeight)/2);
    
    bullets = new ArrayList<Bullet>();
    enemys = new ArrayList<Enemy>();
    guns = new ArrayList<Gun>();
    
    tower = new Tower(center);
    dp = new DeathParticles();
    
    for(int i = 0; i < gunAmount; i++){
      guns.add(new Gun(gunCd, gunReload, gunMagazine));
    }
  
  }
  
  //Spawns based off of current frame
  //enemyCd-frames between spawning
  //maxEnemys-max enemys on screen
  //enemySize-current amount of enemys
  void spawn(int frames){
    if(enemySize < maxEnemys && spawned < enemyAmount){
      if(frames >= count + enemyCd){
          spawned++;
          enemy = new Enemy(screenHeight, screenWidth, center, enemySpeed);
          enemys.add(enemy);
          enemySize++;
          count = frames;
      }
    }
  }
  
  //Targets gun on specific enemy
  //gun.enemy-guns current target
  //gun.shot-bullets fired from magazine
  void target(Gun gun){
    if(gun.enemy != null){
    
          bullet = new Bullet(gun.enemy, center, bulletSpeed);
          bullets.add(bullet);
          gun.shot++;
          if(gun.enemy.health - gun.shot*bullet.damage <= 0){
            gun.enemy = null;
            gun.shot = 0;
          }
      
     } else {
       if(enemyIndex < enemySize){
         gun.enemy = enemys.get(enemyIndex);
         enemyIndex++;
       }
    }
  }
  
  //fires at guns current enemy after gun cd is used
  void fire(Gun gun){
    if(gun.frameShot  <= frameCount){
        gun.frameShot = frameCount + gun.cd;
        if(gun.magazine == 0){
            gun.frameShot += gun.reload;
            gun.magazine = 10;
        }
        gun.magazine--;
        target(gun);
    }
  }
  
  //collison based off straight line between enemy and bullet
   public boolean collison(Bullet bullet, Enemy enemy){
      if(enemy.spawn > 1){
        if(enemy.sector == 0){
          if(enemy.x - (bullet.x+5) <= 0 && enemy.y - (bullet.y+5) <= 0){
            enemy.health -= bullet.damage;
            bullet.pierce--;
            return true;
          } 
        } else {
          if(enemy.x - (bullet.x) >= 0 && enemy.y - (bullet.y) <= 0){
            enemy.health -= bullet.damage;
            bullet.pierce--;
            return true;
          } 
        }
      } else {
        if(enemy.sector == 0){
          if(enemy.x - (bullet.x-5) >= 0 && enemy.y - (bullet.y-5) >= 0){
            enemy.health -= bullet.damage;
            bullet.pierce--;
            return true;
          } 
        } else {
          if(enemy.x - (bullet.x) <= 0 && enemy.y - (bullet.y) >= 0){
            enemy.health -= bullet.damage;
            bullet.pierce--;
            return true;
          } 
        }
      }
      return false;
    }
  
  
  
  void display(){
  
        background(0);
        tower.display();
        spawn(frameCount);
        
        for(int i = 0; i < enemySize; i++){
            enemy = enemys.get(i);
            enemy.display();
            if(tower.collison(enemy)){
                enemys.remove(i);
                dead++;
                enemyIndex--;
                enemySize--;
           }
        }
        
        for(int i = 0; i < guns.size(); i++){
          fire(guns.get(i));
        }
        
        for(int i = 0; i < bullets.size(); i++){
            bullet = bullets.get(i);
            enemy = bullet.enemy;
            if(collison(bullet, enemy)){
                if(bullet.pierce <= 0){
                  bullets.remove(i);
                  i--;
                }
                if(bullet.enemy.health <= 0){
                  bullet.enemy.deathAnimation(dp);
                  enemys.remove(bullet.enemy);
                  dead++;
                  //System.out.println(dead);
                  enemyIndex--;
                  enemySize--;
                } else{
                  bullet.enemy.hitAnimation(dp);
                }
           }
           bullet.display();
        }
        dp.run(); 
        
        if(dead == enemyAmount && dp.particles.size() == 0){
            //dp.run();
            enemyAmount = -1;
        }
  }
}