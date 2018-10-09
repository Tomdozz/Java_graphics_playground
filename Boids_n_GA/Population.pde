
class Population{
  float mutateRate;                   //how often to we mutate
  Vehicle[] population;               //the population we keep
  ArrayList<Vehicle> matingPool;      //The solution pool
  int generation;                     //conter for generation
  int deathCount = 0;
  int populationSize;
  int nrOfPills = 200;
  //Pill[] pills;
  ArrayList<Pill> pills = new ArrayList<Pill>();
  //ArrayList<int> dead = new ArrayList<int>();
  float maxFitness = 0;
  float highest = 0;
  int maxpills = 30;
  EvilVehicle evil;

  Population(float mRate,int popSize)
  {
    populationSize = popSize;
    generation = 0;
    mutateRate =mRate;
    population = new Vehicle[popSize];
    matingPool = new ArrayList<Vehicle>();
    
    //make new set of vehicles, initilize each vehicleu
    for(int i = 0; i < population.length; i++)
    {
      PVector pos = new PVector(width/2,height/2);//new PVector(random(width),random(height));
      population[i] = new Vehicle(pos,new DNA1());
    }
    
    //Agent------------------------------
    evil = new EvilVehicle(new PVector(50,50),new DNA1());
    //-------------------------------------------
    //Make pillls------------------------------
    //pills = new Pill[nrOfPills];  
    for(int i = 0; i < nrOfPills; i++)
    {
      if(i>nrOfPills/2)
      {
        Pill temp = new Pill(true);
        //pills[i] = temp;
        pills.add(temp);
      }
      else
      {
        Pill temp = new Pill(false);
        //pills[i] = temp;
        pills.add(temp);
      }
    }
    //------------------------------------------
    
  }
  int getGenerations(){  return generation; }
  float getFittest(){  return highest; }
  
  void UpdatePopulation()
  {
    //Update evil-----------------
    evil.Run();
    evil.Wander();
    evil.PlacePill(pills);
    //----------------------------
    
    for(int j = 0; j<pills.size();j++)
    {
      pills.get(j).Render();
    }
    deathCount = 0;
    for(int i = 0; i < population.length; i++)
    {
      if(population[i].returnDead() != true)
      {
        population[i].Run();
        population[i].Wander();
        population[i].Collision(pills);
      }
      else 
        deathCount++;
      
      
//      for(int j = 0; j < population.length; j++) //<>//
//      {
//        if(population[j].returnDead() ==true){
//          break;
//        }
//        if(population[j].returnDead()!=true){
//          deathCount++;
//        }
//        if(deathCount>=population.length){
//          NewGeneration();
//        }
//      }
    }
    if(deathCount >= population.length)
    {
      NewGeneration();
    }
  }
  
  void NewGeneration()
  {
     Selection();
     Reproduce();
     print("current generation "+generation);
  }
  
  void Selection()
  {
    matingPool.clear();                //empty the pool
    maxFitness = GetFittest();   //Used as this pops fitness
    
    for(int i = 0; i <population.length;i++)
    {
      float fitnessN = map(population[i].getFitness(),0,maxFitness,0,1); //remaps the value of the vehicle to %
      int n = (int)(fitnessN*100);                                       //its easier to handle actual %
      for(int j = 0; j<n;j++)                                            //how many % of this individual shall we add?
      {
        matingPool.add(population[i]);
      }
    }
    maxFitness = 0;
  }
  
  float GetFittest()
  {
    highest = 0;
    for(int i = 0; i < population.length; i++)
    {
      if(population[i].getFitness()>highest)
      {
        highest= population[i].getFitness();      
      }
    }
    
    return highest;
  }
  
  //Making the next generation
  void Reproduce()
  {
    for(int i = 0; i<populationSize;i++)
    {
      Vehicle mom = matingPool.get(int(random(matingPool.size())));
      Vehicle dad = matingPool.get(int(random(matingPool.size())));
      
      DNA1 momDNA = mom.getDNA();
      DNA1 dadDNA = dad.getDNA();
      
      DNA1 child = momDNA.Crossover(dadDNA);
      PVector pos = new PVector(width/2,height/2);//new PVector(random(width),random(height));
      population[i] = new Vehicle(pos,child);
    }
    generation++;
  }
  
  void CalculateFitness()
  {

  }
}