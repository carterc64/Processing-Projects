Tower tower = new Tower();
Enemy enemy = new Enemy();
Bullet bullet = new Bullet(enemy);
int count =  0;
int reloadCd = 30;
int enemyIndex = 0;
int enemySize = 0;
int shot = 0;

ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Enemy> enemys = new ArrayList<Enemy>();

void setup() {
  size(500,500);
  noStroke();
  fill(255);
  rectMode(CENTER);
  frameRate(30);
}

void spawn(int frames){
  if(frames >= count + 15){
      enemys.add(new Enemy());
      enemySize++;
      count = frames;
  }
}

void target(){
  if(enemyIndex < enemys.size()){
      bullets.add(new Bullet(enemys.get(enemyIndex)));
      shot++;
      enemyIndex++;
  } 
}

void draw(){
  background(0);
  tower.display();
  spawn(frameCount);
  for(int i = 0; i < enemys.size(); i++){
     if(enemys.get(i).health > 0){
       enemys.get(i).display();
     } else{
       enemys.remove(i);
       enemyIndex--;
       enemySize--;
     }
  }
  target();
  for(int i = 0; i < bullets.size(); i++){
    if(bullets.get(i).pierce > 0){
      bullets.get(i).display();
    } else {
      bullets.remove(i);
    }
  }
}