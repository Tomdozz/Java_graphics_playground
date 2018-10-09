
L_sys_rules lSystem;
agent ag;
String current = "A";
int generation = 0;
ruleset rule = new ruleset('A',"ABC");
int counter = 0;
void setup(){

  size(1600,1600);
  ruleset[] rules = new ruleset[1];
  
  //'F'-> draw a line 
  //'G'-> move forward
  //'+'-> turn right
  //'-'-> turn left
  //'['-> save state
  //']'-> restore state
  
  rules[0] = new ruleset('F',"FF+[+F-F-F]-[-F+F+F]");
  //rules[0] = new ruleset('F', "F--F--F--G");
  //rules[1] = new ruleset('G',"GG");
  //"FF+[+F-F-F]-[-F+F+F]"
  lSystem = new L_sys_rules(/*"F--F--F"*/"F", rules);
  ag = new agent(lSystem.getSentence(),height/3,radians(25));
}
void draw(){
   background(250);  
  fill(0);
  //text("Click mouse to generate", 10, height-10);

  translate(width/2, height);
  rotate(-PI/2);
  ag.render();
  noLoop();
}
void mousePressed() {
  if (counter < 8) {
    pushMatrix();
    lSystem.Generate();
    //println(lsys.getSentence());
    ag.setToDo(lSystem.getSentence());
    ag.changeLen(0.5);
    popMatrix();
    redraw();
    counter++;
  }
}