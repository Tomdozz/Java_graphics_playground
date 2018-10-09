public class point{
  int x;
  int y;
  point(int inx, int iny)
  {
    x = inx;
    y = iny;
  }
  
}
class DSAlg{

  
  DSAlg(float[][] arr, int hGrid,int wGrid)
  {
    //setcorner
    point one = new point(0,0);
    point two = new point(wGrid,0);
    point three = new point(0,hGrid);
    point four = new point(wGrid,hGrid);
    Divide(one,two,three,four);
  }
  
  void Divide(point p1, point p2, point p3, point p4)
  {
    
  }
}