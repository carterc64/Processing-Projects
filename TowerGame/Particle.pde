class Particle{
  PVector position;
  PVector velocity;
  PVector accleration;
  float lifespan;
  
  Particle(PVector i){
    accleration = new PVector(random(-0.01, 0.01), random(-0.01, 0.01));
    velocity = new PVector(random(-1,1), random(-2,0));
    position = i.copy();
    lifespan = 50;
  }
    
  void update(){
    velocity.add(accleration);
    position.add(velocity);
    lifespan--;
  }
  
  boolean isDead(){
    if (lifespan < 0){
      return true;
    } else {
      return false;
    }
  }
  
  void display(){
    stroke(255, lifespan);
    fill(255, lifespan+50);
    ellipse(position.x, position.y, 8, 8);
    noStroke();
    fill(255);
  }
  
  void run(){
    update();
    display();
  }
}