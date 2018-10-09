class DNA1{

  float[] genes;
  
  //Constructor to create a random dna array
  DNA1()
  { 
    genes = new float[5];
    float wanderRadius = random(50);
    float wanderDist = random(100);
    float wanderChange = random(1);
    float maxSpeed = random(3);
    float maxForce = random(1);
    genes[0] =wanderRadius;
    genes[1] =wanderDist;
    genes[2] =wanderChange;
    genes[3] =maxSpeed;
    genes[4] =maxForce;
  }
  
  //New constructor to create a new gene with a given gene array
  DNA1(float[] newgene)
  {
    genes = newgene;
  }
  
  float ReturnGeneValue(int index)
  {
    return genes[index];
  }
  
  //mothod to preform a crossover between this gene and another gene
  DNA1 Crossover(DNA1 partner)
  {
     float[] child = new float[genes.length];
     
     //Choose a reandow way of selecting how to cross
     int midPoint = (int)random(4); 
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
     DNA1 newgene = new DNA1(child);
     return newgene;
  }
  
  //mutate the gene
  void Mutate(float rate)
  {
    for(int i = 0; i<genes.length;i++)
    {
      if(random(1)<rate)
      {
        switch(i)
        {
          case 0: genes[0] = random(50);
                  break;
          case 1: genes[1] = random(100);
                  break;
          case 2: genes[2] = random(1);
                  break;
          case 3: genes[3] = random(3);
                  break;
          case 4: genes[4] = random(1);
                  break;
        }
      }
   }
  }
}