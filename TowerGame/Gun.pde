class Gun{
  int cd, frameShot, magazine, reload, shot;
  Enemy enemy;
  
  
  Gun(int cd, int reload, int magazine){
    this.cd = cd;
    frameShot = 0;
    this.magazine = magazine;
    this.reload = reload;
    shot = 0;
  }
 
}