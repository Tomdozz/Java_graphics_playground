class Terrain{
  int tSize;
  int tMax;
  float[] map;
  float tRoughness;
  
  Terrain(int LOD)
  {
    tSize = int(pow(2,LOD)+1);
    tMax = tSize -1;
    map = new float[tSize*tSize];
  }
  
  float getP(int x, int y)
  {
    if(x<0||x>tMax||y<0||y>tMax) return -1;
    return map[x+tSize*y];
  }
  
  private void step(int x, int y, float val)
  {
    map[x+tSize*y] = val;
  }
  
  void Generate(float roughness)
  {
    tRoughness=roughness;
    
  }
}