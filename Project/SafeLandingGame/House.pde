
class House {

  //this is instance variable that stores arguments in constructor
  int xpos;
  int ypos;
  int w;
  int h;
  int topX, topY;
  color houseColor=color(124, 61, 21);

  //constructor for the house, rewritten to incorporate these arguments 
  House(int x, int y, int Width, int Height) {
    xpos=x;
    ypos=y;
    w=Width;
    h=Height;
    topX=xpos+w/2;
    topY=ypos-h/2;
  }

  //move the house 
  void move(int x, int y) {
    xpos = xpos + x;
    ypos = ypos + y;
  }

  void crush() {
    fill(houseColor);
    stroke(77, 56, 11);//outline of the house
    strokeWeight(2);//thickness of the outline
    triangle(xpos, ypos, xpos+w/2, ypos-h/2, xpos+w, ypos);//draw the top of the house
    rect(xpos, ypos, w, h/2);//draw the body of the house
  }

  void display() {//draw the house attached with balloons
    fill(houseColor);
    stroke(77, 56, 11);//outline of the house
    strokeWeight(2);//thickness of the outline
    triangle(xpos, ypos, xpos+w/2, ypos-h/2, xpos+w, ypos);//draw the top of the house
    rect(xpos, ypos, w, h);//draw the body of the house
    ypos= constrain(ypos, 0, 750);// set up the constrain for the house not fall off the screen
    h= constrain(h, 0, 800);// set up the constrain for the house not fall off the screen
  }
}