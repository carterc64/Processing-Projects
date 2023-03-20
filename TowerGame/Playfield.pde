

Tower tower = new Tower();
Enemy enemy = new Enemy();
Bullet bullet = new Bullet(enemy);
int count =  0;
int reloadCd = 30;
int enemyIndex = 0;
int enemySize = 0;
int shot = 0;
int enemyCd = 15;
int maxEnemys = 10;

ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemys = new ArrayList<Enemy>();
ArrayList<Gun> guns = new ArrayList<Gun>();

void setup() {
  size(500,500);
  noStroke();
  fill(255);
  rectMode(CENTER);
  frameRate(30);
  guns.add(new Gun());
  guns.add(new Gun());
}

void spawn(int frames){
  if(enemySize < maxEnemys){
    if(frames >= count + enemyCd){
        enemys.add(new Enemy());
        enemySize++;
        count = frames;
    }
  }
}

void target(){
  if(enemyIndex < enemySize){
    enemy = enemys.get(enemyIndex);
    //if(enemy.targeted == false){
      enemy.targeted = true;
      bullet = new Bullet(enemy);
      bullets.add(bullet);
      shot++;
     // if(enemy.health <= bullet.damage){
        //enemy.health -= bullet.damage;
      enemyIndex++;
      //} else{
        //enemy.health -= bullet.damage;
      }
     // enemyIndex++;
     // enemy.targeted = true;
    //} else {
    //  enemyIndex++;
    //}
 // } else{
     //enemyIndex = 0;
  //}
}

void fire(Gun gun){
  if(gun.frameShot  <= frameCount){
      gun.frameShot = frameCount + gun.cd;
     // System.out.println(gun.frameShot);
      if(gun.magazine == 0){
          gun.frameShot += gun.reload;
          gun.magazine = 10;
      }
      gun.magazine--;
     // System.out.println("Shot" + gun.magazine);
      target();
  }
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
   //   bullet.display();
      if(bullet.collison()){
          bullet.enemy.targeted = false;
          if(bullet.pierce <= 0){
            bullets.remove(i);
            i--;
          }
          if(bullet.enemy.health <= 0){
            enemys.remove(bullet.enemy);
            enemyIndex--;
            enemySize--;
          } 
     }
     bullet.display();
  }
}
