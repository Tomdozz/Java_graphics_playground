
class DNA{
//gene
//1. speed
//2. wanderchange
//3. wanderdist
//4. wander radiusm
//keeping the genetic sequence  
//PVector[] genes;
float[] genes;

//maximal values
float maxForce;
float maxSpeed;

  //the first constructor is only called when we first initilize a DNA
  //RandomValues
  DNA()
  {
    
  }
  
  //Second constructor to maka DNA based on existing array
  DNA(float[] newgene)
  {
    genes = newgene;
  }
  
  //cross my genes with another indivitual and return a DNA
  DNA Crossover(DNA partner)
  {
    float[] child = new float[genes.length];
    
    //Select a midpoint
    //Consider taking a random point instead of just taking the middle
    int midPoint = genes.length/2;
    
    for(int i = 0; i<genes.length;i++)
    {
      if(i>midPoint)
      {
        child[i] = genes[i];
      }
      else
      {
        child[i] = partner.genes[i];
      }
    }
    
    DNA newgene = new DNA(child);
    return newgene;
  }
  
  //m is mutationprobability, pics a new random vector
//  void Mutate(float m)
//  {
//    for(int i = 0; i<genes.length;i++)
//    {
//      if(random(1)<m)
//      {
//        float angle = random(TWO_PI);
//        genes[i] = new PVector(cos(angle), sin(angle));
//        genes[i].mult(random(0, maxForce));
//        //        float angle = random(-0.1,0.1);
//        //        genes[i].rotate(angle);
//        //        float factor = random(0.9,1.1);
//        //        genes[i].mult(factor);
//        if (i ==0) genes[i].normalize();
//      }
//    }
//  }
}