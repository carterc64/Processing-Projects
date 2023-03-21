class DeathParticles{
  ArrayList<Particle> particles;
  int particleAmount;
  
  
  DeathParticles(){
    particles = new ArrayList<Particle>();
    particleAmount = 3;
  }
  
  void addParticles(PVector point){
    for(int i = 0; i < particleAmount; i++){
      particles.add(new Particle(point));
    }
  }
  
  void run(){
    for (int i = 0; i < particles.size(); i++){
      Particle p = particles.get(i);
      p.run();
      if(p.isDead()){
        particles.remove(i);
        i--;
      }
    }
  }
}