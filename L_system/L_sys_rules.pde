class L_sys_rules{
  String sentence;
  ruleset[] rules;
  int generation;
  
  L_sys_rules(String axinom,ruleset[] rules){
     this.rules = rules;
     sentence = axinom;
     generation = 0;
  }
  
  void Generate(){
    StringBuffer nextgen = new StringBuffer();
    // For every character in the sentence
    for (int i = 0; i < sentence.length(); i++) {
      // What is the character
      char curr = sentence.charAt(i);
      // We will replace it with itself unless it matches one of our rules
      String replace = "" + curr;
      // Check every rule
      for (int j = 0; j < rules.length; j++) {
        char a = rules[j].getA();
        // if we match the Rule, get the replacement String out of the Rule
        if (a == curr) {
          replace = rules[j].getB();
          break; 
        }
      }
      // Append replacement String
      nextgen.append(replace);
    }
    sentence = nextgen.toString();
    generation++;
  }
  
  String getSentence() {
    return sentence; 
  }

  int getGeneration() {
    return generation; 
  }
}