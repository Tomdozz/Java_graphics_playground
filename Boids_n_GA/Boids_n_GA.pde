Vehicle boid;
Vehicle boid1;
Pill[] pills;

float bestFitness = 0;
int bestGeneration;
int nrOfPills = 50;
Population pop;
PFont f;

void setup()
{
  size(900,600);
  pop = new Population(10,50);
  f = createFont("Arial",16,true);
}

void draw()
{
  background(250);  
  fill(0);
  pop.UpdatePopulation();
  
  textFont(f,20);                  
  fill(0);                          
  text("Generation: "+pop.getGenerations(),10,100);
  text("Fittest: "+pop.getFittest(),10,120);
  if(bestFitness<pop.GetFittest())
  {
    bestGeneration = pop.getGenerations();
    bestFitness = pop.GetFittest();
  }
  text("Best overall score is: "+bestGeneration +" With a score of "+bestFitness,10,height-20);

}
void update()
{
}

void mousePressed()
{}