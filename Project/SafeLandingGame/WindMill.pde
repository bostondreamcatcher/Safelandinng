
class WindMill{
  
  //this is instance variable that stores arguments in constructor
  int xpos;
  int ypos;
  int millHeight;
  int bladeLength;
  
  //constructor for the windmill, rewritten to incorporate these arguments 
  WindMill(int x, int y, int m, int b){
    xpos=x;
    ypos=y;
    millHeight=m;
    bladeLength=b;
  }
  
  //draw this windmill
  void display(){
    translate(50, 150);//set up the center of the windmill
    strokeWeight(2);
    float rotateSpeed = speed*0.01;//set up the speed of windmill blade rotate
    
    angle = angle +rotateSpeed;//draw the angle of the blade
   
   //draw the center of the axis and bottom of the windmill
    pushMatrix();
    stroke(200);
    line(xpos, ypos+millHeight, xpos, ypos);
    ellipse(xpos,ypos,5,5);
    
    rotate(angle);//spin by the angle that I set up early
    
    //draw the three blades
    for(int j=0; j<3; j++){
      pushMatrix();
      rotate(radians(120*j));
      stroke(255-50*j);
      line(0,0,0,-50);
      popMatrix();
    }
    popMatrix();
  }
  
  //draw the blade of the windmill
  void blade(){
    line(xpos, ypos-millHeight, xpos, ypos);
  }
}