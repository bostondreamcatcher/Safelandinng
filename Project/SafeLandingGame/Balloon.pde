
class Balloon{
  
  //this is instance variable that stores arguments in constructor
  int ballX;
  int ballY;
  int d;
  int houseTopX, houseTopY;
  color c = color(random(255),random(255), random(255));
  
  //constructor for the balloons, rewritten to incorporate these arguments 
  Balloon (int x, int y, int diameter, int houseTopX, int houseTopY){
    ballX=x;
    ballY=y;
    d=diameter;
    this.houseTopX=houseTopX;
    this.houseTopY=houseTopY;
  }

  void move(int x, int y){
    ballX = ballX + x;
    ballY = ballY + y;
    houseTopX = houseTopX + x;
    houseTopY = houseTopY + y;
  }
  
  //draw the balloons
    void display(){
    fill(c);//fill up the color of the balloon from the local variables
    line(ballX,ballY+20, houseTopX, houseTopY);//draw the string attached the balloons
    ellipse(ballX, ballY, d, d+10);//draw the shape of the balloons
    stroke(255); // outline color of the balloons
    ballY=constrain(ballY, 0, 700);// set up the constrain for the balloon not fall down the ground
    houseTopY=constrain(houseTopY, 0, 720);// set up the constrain for the balloon not fall down the ground
  }
  
}