class EvilVehicle extends Vehicle{
  
  EvilVehicle(PVector pos, DNA1 d){
    super(pos, d);
    dna = d;
    r = 10.0f;
    maxSpeed = 2f;
    maxForce = 0.1f;
    wanderRadius = 25;
    wanderDistance = 80;
    wanderChange = 0.3; 
  }
  
  void PlacePill(ArrayList<Pill> other)
  {
    if(CheckSurroundings(other))
    {
      PVector pillPos = new PVector(location.x,location.y);
      other.add(new Pill(pillPos,false));
    }
  }
  
  boolean CheckSurroundings(ArrayList<Pill> other)
  {
    for(int i = 0; i<other.size(); i++)
    {
      //calculate distance to this pill
      dx= other.get(i).pos.x - location.x;
      dy= other.get(i).pos.y - location.y;
      
      //Dist formula
      pillDist = sqrt((dx*dx)+(dy*dy));
      if(pillDist < 70)
      {
        return false;
      }
    }
    return true;
  }
  
  //Render vehicle
  void Render()
  {
    float theta = velocity.heading() + PI/2;
    fill(#F70505);
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