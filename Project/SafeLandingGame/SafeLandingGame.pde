/*Final Project - Safe Landing 
WEIWEI HUANG
Prof: Jay Laird
Concept: The player can use "a" and "d" key to control the windmill speed,
in order to control the balloon house speed. Mouse click to pop the balloons. 
the player needs to control the wind speed and balloon house gravity to land it on the right safe ground 
while avoiding the hill and the storm.*/

//global variable for public using. 
//set up array list for balloons and storm that I would draw a bunch of them in a certain random area that I restrained. 
ArrayList<Balloon> balloons = new ArrayList<Balloon>();
ArrayList<Storm> storm = new ArrayList<Storm>();
//set up the class for house, windmill and hill
House floatHouse;
WindMill mill;
Hill hill;

//initialized the global variables
int speed;
int speedMax=10;
int millHeight=100;
int bladeLength = 40; 
float angle;

float stormX;
float stormY;
int  ballX;
int  ballY;
int houseTopX;
int houseTopY;

PFont f;
boolean hillHit=false;
boolean stormHit=false;

//import sound liberary
import ddf.minim.*;
AudioPlayer player;
Minim minim;

void setup(){
  //set up the canvas 1400*800 pixels
 size(1400,800); 

  // Load a soundfile from the data folder of the sketch and play it
  minim =new Minim(this);
  player = minim.loadFile("PacificTheme.mp3",2048);
  player.play(); 

 //passing the parameter to the house class
 floatHouse= new House(120,180,50,50);
 
 //draw 30 balloons in width random position 100 to 200, height position 20 to 120. 
 //give them a range to draw the balloons that allow them overlapped each other
 for (int i=0; i<30; i++){//initialized the array for balloon
   balloons.add(new Balloon((int)random(100,200), (int)random(20,120), 30, floatHouse.topX, floatHouse.topY));
 }

 //draw 60 pieces of cloud in width random postion 500 to 1400, height postion 0 to 120. 
 //I want them to be right top corner with random postion that they could be overlapped. 
 for (int j=0; j<60; j++){//initialized the array for storm
   storm.add(new Storm(random(500,1400), random(0,120), random(50,180)));
} 
 
  //passing the parameter to the hill class
  hill= new Hill(0,800);

  //set the frame rate 60 per second
  frameRate(60);
  //passing the parameter to the windmill class
  mill = new WindMill(0,0,100,40);
 
}
void draw(){
  background(88,200,242);//draw background color of sky blue
  
  for(int j=0; j<60; j++){//draw storm loop 
    storm.get(j).display();
  }
    
    hill.display();//draw hill loop
    
  //only remove one balloon when you click
  boolean balloonRemoved = false;
  
  // check for balloon clicks
  for(int i=0; i<balloons.size(); i++){ //when one balloon removed, balloon array get
    if(!balloonRemoved && balloons.get(i) != null && mousePressed && balloons.get(i).ballX <= mouseX && mouseX <= balloons.get(i).ballX + balloons.get(i).d
                    && balloons.get(i).ballY <= mouseY && mouseY <= balloons.get(i).ballY + balloons.get(i).d) {
                      balloons.remove(i);
      balloonRemoved = true;
    }
  }
  
  //check if any balloon hit the storm 
  for(int i=0; i<balloons.size(); i++){
   for(int j=0; j<storm.size();j++){ 
     Balloon b = balloons.get(i);
     Storm s = storm.get(j);
      if(b.ballX <= s.stormX && s.stormX <= b.ballX + b.d
        && b.ballY <= s.stormY && s.stormY <= b.ballY + b.d) {
        println("STORM");
          //set up the new font and size of my text
        f = createFont("Georgia",30);
        textSize(40);
        text("You hit the storm!", 450,250);
        balloons.get(i).ballY--;
        stormHit = true;
      }
      
   }
 }
 
 // check if you hit any of the hills 

 if(hillHit){
      textSize(40);
    text("You hit the hill!", 650,400);
 }
 
 if(hill.xpos - 150 <= floatHouse.xpos && floatHouse.xpos <= hill.xpos + 150 && hill.ypos - 450 <= floatHouse.ypos){
   println("HIT 1");
   hillHit=true;
 }
 else if(hill.xpos <= floatHouse.xpos && floatHouse.xpos <= hill.xpos + 400 && hill.ypos - 250 <= floatHouse.ypos){
   println("HIT 2");
   hillHit=true;
 }
 else if(hill.xpos + 150 <= floatHouse.xpos && floatHouse.xpos <= hill.xpos + 550 && hill.ypos - 180 <= floatHouse.ypos){
    println("HIT 3");
    hillHit=true;
}
 else if(hill.xpos + 350 <= floatHouse.xpos && floatHouse.xpos <= hill.xpos + 750  && hill.ypos - 80 <= floatHouse.ypos){
    println("HIT 4");
    hillHit=true;  
 }
 else if(hill.xpos + 580 <= floatHouse.xpos && floatHouse.xpos <= hill.xpos + 850 && hill.ypos - 20 <= floatHouse.ypos){
    println("HIT 5");
    hillHit=true;
}
 else if(hill.xpos + 740 <= floatHouse.xpos && floatHouse.xpos <= hill.xpos + 930 && hill.ypos - 10 <= floatHouse.ypos){
    println("HIT 6");
    hillHit=true;
 }
 
 
  //looping display function and passing the speed parameter of x postion and its y position (30-balloons.size())/8. so, if you have 30 balloons (30-30)/8 = 0
  //if you have popped one balloons its (30-29)/8 = 1/8. so the more balloons you pop, the bigger the number gets, and the faster it falls
  for(int i=0; i<balloons.size(); i++){
    balloons.get(i).move(speed/2,(30 - balloons.size())/8);
    balloons.get(i).display();
  }

    //draw loop for floathouse display and move function. Since balloon and house are tied together so that the moving speed are same. 
    floatHouse.move(speed/2,(30 - balloons.size())/8);
    if(hillHit){
      floatHouse.crush();
    } else{
    floatHouse.display();
      }
   
   if(floatHouse.xpos>hill.xpos+930&&houseTopY<120&&houseTopY<120&&!hillHit&&!stormHit){
    textSize(40);
    fill(255,0,0);
    text("YOU WIN!:D", 1000,600);
   }
   
   //in main loop, i need to draw these so that I can call this function with specific demand later
    updateText();
    mill.display();
    blades();       
}

//set up blades as independent event with empty arguement because I will fill up the paramater in windmill class
void blades(){
}

//set up the instructor text on screen
void updateText(){
  textSize(20);
  fill(255);
  textAlign(LEFT, TOP); //below text content align on the top left screen
  text(speed+" knot", 10, 10); //number of speed and knot word will display on the screen with x postion 10 and y position 10
  textAlign(LEFT, BOTTOM);//below text content align on the bottom left screen
  text("the windmill: press 'a' or 'd' to control the speed of the mill", 10, height-10); // display the instruction text on x position 10 and x postion with 10 pixels distant from the bottom of the screen
  textAlign(RIGHT,TOP);//below text content align on the right top screen
  text("click left mouse key to pop the balloon to make the house safe landed on the right of the hills",1300,10);
}

//set up the key press as an independent event 
void keyPressed(){
  if (key == 'd'||key =='D'){ // press key d or D increase the windmill speed in order to move the balloon house toward right faster
    if (speed<speedMax){
      speed++;
  }
}
   else if(key == 'a'|| key =='A'){// press key a or A decrease the windmill speed in order to move the balloon house toward right slower
     if(speed>0){
       speed --;
     
   }
 }
}