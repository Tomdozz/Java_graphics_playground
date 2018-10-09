class ruleset{
  String current;
  String rules;
  char axinom;

  ruleset(char axinom, String rules){
    this.axinom = axinom;
    current = str(axinom); //makes char to sting, because you know... java
    this.rules = rules;
    
    println("Generation "+generation +"string:"+ axinom);
  }
  
  void applyRules(){
   StringBuffer buff = new StringBuffer();

  for(int i= 0; i<current.length();i++){
    char c= current.charAt(i);  
    //println(c);
    //if(c == axinom){
    //  buff.append(rules);      
    //}
    if(c == 'A'){
      buff.append("ABA");
    }
    else if(c == 'B'){
      buff.append("BBB");
    }
  }
  //println(buff);
  current = buff.toString();
  //println(current);
  generation++;

  println("Generation "+generation +"string:"+ current);
   
  }

   char getA() {
    return axinom;
  }

  String getB() {
    return rules;
  }
}