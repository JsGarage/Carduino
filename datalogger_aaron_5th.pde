import grafica.*;
import processing.serial.*;
import processing.serial.Serial;

GPointsArray myArray = new GPointsArray(0);
Serial myPort;                                                   // The serial port
//float inByte = 0;                                              // defines starting value for the serial input(doesnt seem to be needed)
int count;
int[] sensors;                                                   // declare 'sensors' as an array (just incase I need it)
// int value;
int xPos = 20;                                                   // horizontal position of the graph
int yPos = 300;                                                  // current vertical position of the graph
int sensorNum;
int lastxPos = xPos;                                             // previous horizontal position of the graph
int lastyPos0= 0;                                                // last vertical position of the 1st graph and.......
int lastyPos1= 0;     
int lastyPos2= 0;   
int lastyPos3= 0;   
int lastyPos4= 0;    
int lastyPos5= 0;                                                // ........last vertical position of the 6th graph
String startvals = "'0','0','0','0','0','0'";
int vals[]; 
 
void setup () {
  size(1024, 300);                                               // set the window size
  println(Serial.list ());                                       // List all the available serial ports
  myPort = new Serial(this, Serial.list()[1], 9600);             //open  second COMport on PC
  myPort.bufferUntil(000);                                       // don't generate a serialEvent() unless you get a 000 (which im not convinced will work)
  background(0);                                                 // set inital background:
//  vals = new int[6];
//  println(vals);
//  String[] vals = (splitTokens(startvals));
                 }
void draw () {
  // draw the line:
  println(vals[0]);                                              // (debug)  visually check the first sensor value
  stroke(300,205, 0);
  line (lastxPos, lastyPos0, xPos,250- vals[0]);                 // draw for sensor one and...
  stroke(30,205, 0);
  line (lastxPos, lastyPos1, xPos,250- vals[1]);
  stroke(300,205, 60);
  line (lastxPos, lastyPos2, xPos,250- vals[2]);
  stroke(300,05, 200);
  line (lastxPos, lastyPos3, xPos,250- vals[3]);
  stroke(300,205, 30);
  line (lastxPos, lastyPos4, xPos,250- vals[4]);
  stroke(300,205, 300);
  line (lastxPos, lastyPos5, xPos,250- vals[5]);                 // .......draw for sensor 6
  
  lastxPos = xPos;                                               // 
  lastyPos0 = vals[0];   
  lastyPos1 = vals[1];
  lastyPos2 = vals[2];
  lastyPos3 = vals[3];
  lastyPos4 = vals[4];
  lastyPos5 = vals[5];
  
  if (xPos >= width) {                                           // at the edge of the screen, go back to the beginning:
    xPos = 0;                                                    // reset to start of window 
    lastxPos = 0;                                                // reset to start of window
    background(50);          
  } else {     
    xPos =xPos + 20;                                             // increment the horizontal position:
          }
}


void serialEvent(Serial s) {                                    //*******************************************************
 vals = int(splitTokens(s.readString()));                       //***  Divide incoming string to seperate variables   ***
// startvals = splitTokens(",");                                //*** These two lines are previous attempts that      ***
// vals[] = splitTokens(s, ", ");                               //*** didn't seem to work.                            ***
                                                                //***   ***   ***  ***   ***   ***   ***   ***   ***  ***
  lastyPos0 = (vals[0]);                                        //***    This cant be right, surely                   ***
  lastyPos1 = (vals[1]);                                        //***                                                 ***
  lastyPos2 = (vals[2]);                                        //***  THIS is where I am lost! I am certain this is  ***
  lastyPos3 = (vals[3]);                                        //***  NOT how to do this but I cant find another way ***
  lastyPos4 = (vals[4]);                                        //***  online to do it.                               ***
  lastyPos5 = (vals[5]);                                        //*******************************************************

  redraw = true;
}