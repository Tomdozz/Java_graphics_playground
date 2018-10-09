int colums,rows;
int scale = 20;
int heightGrid = 1900;
int widthGrid = 1900;
float fly = 0;
float[][] points;
boolean flying = false;
float yoff;
  
void setup()
{
  size(1100,1200,P3D);
  //setup the grid with scale as "tilesize"
  colums = heightGrid/scale;
  rows = widthGrid/scale;
  points = new float[colums][rows];
}

void mouseClicked()
{
  if (flying ==false)
  {
    flying = true;
  }
  else
  {
    flying = false;
  }
} //<>//

void draw()
{
  if(flying)
  {
    fly -= 0.04;
    yoff = fly;
  }
  else
  {
    yoff = 0;
  } 
  
  //float yoff = fly;
  for(int y =0; y < rows; y++)
  {
    float xoff =0;
    for(int x = 0; x < colums; x++)
    {
      points[x][y]= map(noise(xoff,yoff),0,1,-80,80);
      xoff+=0.1;
    }
    yoff+= 0.1;
  } 
  
  stroke(255);
  noFill();
  
  translate(width/2,height/2);
  rotateX(20);
  translate(-widthGrid/2,-heightGrid/2);
  background(0);
  for(int y =0; y < rows-1; y++)
  {
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < colums; x++)
    {
      vertex(x*scale,y*scale,points[x][y]);
      vertex(x*scale,(y+1)*scale,points[x][y+1]);
    }
    endShape();
  }
}