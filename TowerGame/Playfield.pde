int reloadCd = 30;
int enemyCd = 15;
int maxEnemys = 10;
int screenHeight = 600;
int screenWidth = 600;
int gap = 0;
int gunAmount = 5;
int enemyAmount = 10;
int gunCd = 20;
int gunReload = 50;
int gunMagazine = 10;

float enemySpeed = 0.00007;
float bulletSpeed = 0.0003;

int level = 1;

boolean setter = false;
boolean shopDone = false;
boolean ending = false;

//int[][] levels = new int[10][];

int[] level1 = new int[]{reloadCd, enemyCd, maxEnemys, screenHeight, screenWidth, gap, gunAmount, enemyAmount, gunCd, gunReload, gunMagazine}; 
int[] level2 = new int[]{reloadCd, enemyCd, maxEnemys, screenHeight, screenWidth, gap, gunAmount, enemyAmount+5, gunCd, gunReload, gunMagazine};

//levels[0] = level1;

void setup() {
  size(600, 600);
  background(0);
  noStroke();
  fill(255);
  rectMode(CENTER);
  frameRate(40);
}

Battlefield battlefield = new Battlefield(level1, enemySpeed, bulletSpeed);
LevelEndAnimation levelEndAnimation = new LevelEndAnimation(battlefield.tower.x, battlefield.tower.y, battlefield.tower.radius, screenWidth, screenHeight);

void draw(){
    if(!ending){
        if(!setter){
              //if(level <= levels.length){
                battlefield = new Battlefield(level1, enemySpeed, bulletSpeed);
                level++;
                setter = true;
             // } else {
             //   ending = true;
             // }
        } else {
              if(battlefield.enemyAmount > -1){
                 battlefield.display();
              } else {
                  battlefield.tower.display();
                  if(!levelEndAnimation.complete){
                    levelEndAnimation.display();
                  } else {
                      if(shopDone){
                        setter = false;
                        shopDone = false;
                        levelEndAnimation.complete = false;
                      } else {
                        levelEndAnimation.complete = false;
                        shopDone = true;
                      }
                     //dislay shop 
                     //if shop is done 
                        
                 }
            }
      }
  } else {
      //display ending
  }
}