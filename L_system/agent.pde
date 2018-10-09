class agent{
  String toDo;
  float len;
  float theta;
  
  agent(String s, float l, float t){
    toDo=s;
    len=l;
    theta=t;
  }
  void render(){
    stroke(0,175);
    for(int i = 0; i <toDo.length();i++){
      char c = toDo.charAt(i);
      if (c == 'F'){
        line(0,0,len,0);
        translate(len,0);
      }
      else if(c=='G'){
        translate(len,0);
      }
      else if(c=='+'){
        rotate(theta);
      }
      else if (c == '-') {
        rotate(-theta);
      } 
      else if (c == '[') {
        pushMatrix();
      } 
      else if (c == ']') {
        popMatrix();
      }
    }   
  }

  void setLen(float l) {
    len = l;
  } 

  void changeLen(float percent) {
    len *= percent;
  }

  void setToDo(String s) {
    toDo = s;
  }
}