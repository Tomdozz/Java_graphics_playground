class Vehicle{
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector futureLocation;
  
  //for fitnesscal-------------
  float fitness;
  float spawnTime;
  float timeSinceSpawn;
  //---------------------------
  float r;
  float maxForce;
  float maxSpeed;
  float health = 100;
  float hunger = 0;
  
  float wanderRadius = 25;
  float wanderDistance = 80;
  float wanderChange = 0.3;
  float wanderTheta;
  
  //for collisions-----
  float dx,dy;
  float pillDist;
  //-------------------
  
  DNA1 dna;
  
  float getFitness(){  return fitness; }
  float getHealth(){  return health;  }
  boolean returnDead(){  return health<=0;  }
  DNA1 getDNA(){  return dna;  }
  
  Vehicle(PVector pos, DNA1 d)
  {
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    location = pos;    
    r=3.0f;
    //maxSpeed = 2f;
    //maxForce = 0.1f;
    //wanderTheta = 0;
    dna = d;
    wanderRadius = dna.ReturnGeneValue(0); 
    wanderDistance = dna.ReturnGeneValue(1); 
    wanderChange = dna.ReturnGeneValue(2); 
    maxSpeed = dna.ReturnGeneValue(3);
    maxForce = dna.ReturnGeneValue(4);
    
    spawnTime = millis();
  }
  
  //Just a mothod to "run" a "boid"
  void Run()
  {
    if(health>=0)
    {
     Update();
     Borders();
     Render();
     UpdateFitness();
     UpdateHungerHealth();
    }
  }
  
  void Update()
  {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void UpdateHungerHealth()
  {
     hunger +=0.1f;
     health = (health-(hunger*0.03));
  }
  
  //Check collision with pill
  boolean Collision(ArrayList<Pill> other)
  {
    for(int i = 0; i<other.size(); i++)
    {
      //calculate distance to this pill
      dx= other.get(i).pos.x - location.x;
      dy= other.get(i).pos.y - location.y;
      
      //Dist formula
      pillDist = sqrt(dx*dx+dy*dy);
      if(pillDist<15)
      {
        if(other.get(i).poison == false){  health -= 10;  }
        if(other.get(i).poison == true)
        {  
          if(hunger > 2){  hunger -= 2; }
        }
        return true;
      }
    }
    return false;
  }
  
  void UpdateFitness()
  {
    timeSinceSpawn = millis();
    fitness = timeSinceSpawn-spawnTime;
  }
  
  //apply a force to a vector--------------------------------------------
  void applyForce(PVector force)
  {
    acceleration.add(force);
  }
  //---------------------------------------------------------------------
  
  //Wander behaviour-----------------------------------------------------
  void Wander()
  {
    //choose where to wander to
    wanderTheta += random(-wanderChange,wanderChange);
    PVector circlePos = velocity.get();//start with velocity
    
    circlePos.normalize();                   // Normalize to get heading
    circlePos.mult(wanderDistance);          // Multiply by distance
    circlePos.add(location);                 // Make it relative to boid's position
    
    //float h = velocity.heading2D();         // We need to know the heading to offset wandertheta
    //PVector circleOffSet = new PVector(wanderRadius*cos(wanderTheta+h),wanderRadius*sin(wanderTheta+h));
    PVector circleOffSet = new PVector(wanderRadius*cos(wanderTheta),wanderRadius*sin(wanderTheta));
    PVector target = PVector.add(circlePos, circleOffSet);
    Seek(target);
  }
  
  //arrive behaviour-----------------------------------------------------
  void Arrive(PVector target)
  {
    PVector des = PVector.sub(target,location);
    float d = des.mag(); //distance from location to target
    des.normalize();
    
    //we only want to change it if we are closer than 100 pixels
    //a circle with 100 pixel radius
    if(d<100)
    {
      float m = map(d,0,100,0,maxSpeed); //set magnitude based on how close we are
      des.mult(m);
    }
    else
    {
       des.mult(maxSpeed);
    }
    
    PVector steer = PVector.sub(des, velocity);
    steer.limit(maxForce);
    applyForce(steer); 
  }
  //-----------------------------------------------------------------------
  
  //sseking behavior, finding a des----------------------------------------
  void Seek(PVector target)
  {
    //point minus point = vector
    PVector des = PVector.sub(target, location);
    des.normalize();
    des.mult(maxSpeed);
    PVector steer = PVector.sub(des,velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }
  //------------------------------------------------------------------------
  
  //We need to have border to stop it from going out------------------------
  void Borders()
  {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }
  //------------------------------------------------------------------------
  
  void Render()
  {
    float theta = velocity.heading() + PI/2;
    fill(175);
    stroke(0);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
  
}