class Storm{
  
  //this is instance variable that stores arguments in constructor
  float stormX;
  float stormY;
  float stormDiameter;
  color stormColor = color(14, 28, 113);
    
  //constructor for the storm, rewritten to incorporate these arguments 
  Storm (float x, float y, float d){
    stormX=x;
    stormY=y;
    stormDiameter=d;
  } 
  
  //draw the storm
  void display(){
    fill(stormColor);//fill up the dark blue color
    noStroke();//no outline
    ellipse(stormX, stormY, stormDiameter, stormDiameter);//draw the storm with ellipse shape
  }
} 