class Hill{
  
  //this is instance variable that stores arguments in constructor
  int xpos;
  int ypos;
  color hillColor = color(random(255),random(255), random(255));
  
    //constructor for the hills, rewritten to incorporate these arguments 
  Hill (int x, int y){
    xpos=x;
    ypos=y; 
  }
  
  void display(){//draw the six hills with fixed position and fill up the color
    fill(hillColor);
    triangle(xpos-150, ypos, xpos+50, ypos-550, xpos+300,ypos);
    triangle(xpos, ypos, xpos+220, ypos-350, xpos+400,ypos);
    triangle(xpos+150,ypos, xpos+360,ypos-280, xpos+550,ypos);
    triangle(xpos+350,ypos,xpos+520,ypos-180, xpos+750,ypos);
    triangle(xpos+580,ypos, xpos+680,ypos-120, xpos+850,ypos);
    triangle(xpos+740,ypos, xpos+830,ypos-90, xpos+930,ypos);
  }
  
}