
int count =  0;
int reloadCd = 30;
int enemyIndex = 0;
int enemySize = 0;
int enemyCd = 15;
int maxEnemys = 10;
int screenHeight = 500;
int screenWidth = 500;
int gunAmount = 5;
int lastSector = 5;

PVector center = new PVector (screenWidth/2,screenHeight/2);

ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemys = new ArrayList<Enemy>();
ArrayList<Gun> guns = new ArrayList<Gun>();

Tower tower = new Tower(center);
Enemy enemy;
Bullet bullet;
DeathParticles dp = new DeathParticles();

void setup() {
  size(500,500);
  background(0);
  noStroke();
  fill(255);
  rectMode(CENTER);
  frameRate(40);
  for(int i = 0; i < gunAmount; i++){
    guns.add(new Gun());
  }

}

//Spawns based off of current frame
//enemyCd-frames between spawning
//maxEnemys-max enemys on screen
//enemySize-current amount of enemys
void spawn(int frames){
  if(enemySize < maxEnemys){
    if(frames >= count + enemyCd){
        enemy = new Enemy();
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
        bullet = new Bullet(gun.enemy);
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



void draw(){
  background(0);
  tower.display();
  spawn(frameCount);
  
  for(int i = 0; i < enemySize; i++){
      enemys.get(i).display();
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
            enemyIndex--;
            enemySize--;
          } else{
            bullet.enemy.hitAnimation(dp);
          }
     }
     bullet.display();
  }
  dp.run();
}