
int reloadCd = 30;
int enemyCd = 15;
int maxEnemys = 10;
int screenHeight = 550;
int screenWidth = 550;
int gap = 50;
int gunAmount = 5;
int enemyAmount = -1;


void setup() {
  size(500, 500);
  background(0);
  noStroke();
  fill(255);
  rectMode(CENTER);
  frameRate(40);
}

Battlefield battlefield = new Battlefield(reloadCd, enemyCd, maxEnemys, screenHeight, screenWidth, gunAmount, enemyAmount, gap);
void draw(){
  battlefield.display();

}