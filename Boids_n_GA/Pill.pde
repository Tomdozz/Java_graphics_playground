class Pill{
  PVector pos;
  boolean poison=false;
  
  Pill(boolean p)
  {
    poison = p;
    pos = new PVector(random(width), random(height));
  }
  
  Pill(PVector pos, boolean p)
  {
    poison = p;
    this.pos = pos;
  }
  
  void Render()
  {
    if(poison){ fill(255); }
    else
      fill(3);
    //if poison = true->red
    ellipse(pos.x,pos.y,10,10);
  }
  
}