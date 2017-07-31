import grafica.*;
import processing.serial.*;
import processing.serial.Serial;
//GPlot plot;

GPointsArray myArray = new GPointsArray(0);
Serial myPort;        // The serial port
float inByte = 0;     // defines starting value for the serial input
int count;
int[] sensors;  // declare 'sensors' as an array
// int value;
int xPos = 20;         // horizontal position of the graph
int yPos = 300;         // current vertical position of the graph
int lastxPos = xPos;     // previous horizontal position of the graph
int lastyPos1 = 0;     // last vertical position of the 1stgraph
int lastyPos2= 0;     // last vertical position of the 2ndgraph
int lastyPos3= 0;     // last vertical position of the 3rdgraph
int lastyPos4= 0;     // last vertical position of the 4thgraph
int lastyPos5= 0;     // last vertical position of the 5thgraph
int lastyPos6= 0;     // last vertical position of the 6thgraph
String startvals = "'0','0','0','0','0','0'";
int vals[]; 
// String[] vals = (splitTokens(startvals));
void setup () {
  size(1024, 300);                                               // set the window size
  println(Serial.list ()[1]);                                       // List all the available serial ports
  myPort = new Serial(this, Serial.list()[1], 115200);            //open COMport(3) on PC
  myPort.bufferUntil('\r');                                       // don't generate a serialEvent() unless you get a carriage return
    
    background(0);  
   //  print(vals[1]);
   // set inital background:
  vals = new int[6];
  
                 }
void draw () {    // draw the lines:
  stroke(300,205, 0);
  line (lastxPos, 250-lastyPos1, xPos,250- vals[1]);
  stroke(30,205, 0);
  line (lastxPos, 250-lastyPos2, xPos,250- vals[2]);
  stroke(300,205, 0);
  line (lastxPos, 250-lastyPos3, xPos,250- vals[3]);
  stroke(300,05, 0);
  line (lastxPos, 250-lastyPos4, xPos,250- vals[4]);
  stroke(300,205, 30);
  line (lastxPos, 250-lastyPos5, xPos,250- vals[5]);
  stroke(300,205, 300);
  line (lastxPos, 250-lastyPos6, xPos,250- vals[6]);
  
  lastxPos = xPos;
  lastyPos1 = vals[1];                                            //(int)vals;
  lastyPos2 = vals[2];
  lastyPos3 = vals[3];
  lastyPos4 = vals[4];
  lastyPos5 = vals[5];
  lastyPos6 = vals[6];
  
  if (xPos >= width) {                                      // at the edge of the screen, go back to the beginning:
 //  inByte=0;                                                //drop x/y to bottom of window
    line(lastxPos, height-lastyPos1+20, xPos, height-20);    // bring x/y back to start of window
   
    xPos = 20;               //reset to start of window(+20)
    lastxPos = 20;           //reset to start of window(+20)
     background(0);          
  } else {     
    xPos =xPos + 20;   // increment the horizontal position:
          }
}


void serialEvent(Serial s) { 
 for (int i = 1; i < 6; i = i+1) {
 // vals = int(splitTokens(s.readString(),","));
  int[] vals = int(split(s.readString(),","));
  println(vals,",");
  lastyPos1 = (vals[1]);
  lastyPos2 = (vals[2]);
  lastyPos3 = (vals[3]);
  lastyPos4 = (vals[4]);
  lastyPos5 = (vals[5]);
  lastyPos6 = (vals[6]);
  println(vals[i],",");
  redraw = true;                       }
}