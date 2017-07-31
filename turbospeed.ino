const uint8_t turboSpdPin = 5; //TurboSpeed Input Digital Pin
const uint8_t map1Pin = A0; // Map Sensor 1 Input Analog pin
const uint8_t map2Pin = A1; // Map Sensor 2 Input Analog pin
const uint32_t oneSecond = 1000000; //Meassured time
uint32_t timer = 0;
uint32_t sts = 0;
const uint32_t c = 1; // wait for 3000 pulses
uint32_t ets = 0;
int turboSpdPinState = LOW;
int turboSpd = 0;
int prevturboSpdPinState = LOW;
int map1inputValue = 0;  //set sensor value to 0 
int map2inputValue = 0;  //set sensor value to 0
int aux1Value = 0; // set start value to 0
int aux2Value = 0; // set start value to 0
int Digitalaux1Value = 0;
const int Aux1 = A2; //Define Aux Input Pin number as Analog 2
const int Aux2 = A3; //Define Aux Input Pin number as Analog 3
const int extPwr = 5;
const int turbineActivity = 6;
const int map1connected = 7;
const int map2connected = 8;
const int pwrOn = 9;
 
 
 
void setup()
{
 Serial.begin(9600);
 pinMode(turboSpdPin, INPUT); //Declared Digital Pin 5 as Input
 digitalWrite(turboSpdPin,LOW); 
 pinMode(10,INPUT);
}
 void loop() {
 
  map1inputValue = analogRead(map1Pin);   //read map sensor input
  map2inputValue = analogRead(map2Pin);   //     " "
  aux1Value = analogRead(Aux1);
  aux2Value = analogRead(Aux2);
  Digitalaux1Value = digitalRead (10);
  pulseIn(turboSpdPin,HIGH);
  sts = micros(); // start time stamp
   for (uint32_t i=c; i>0; i--)
    pulseIn(turboSpdPin,LOW);
 
 ets = micros(); // end time stamp
 //Serial.print("$");
 Serial.print("100"); //((c*1e6/(ets-sts))); // output Hz
 Serial.print(",");
 Serial.print("110"); //map1inputValue);
 Serial.print(",");
 Serial.print("120"); //map2inputValue);
 Serial.print(",");
 Serial.print("130"); //aux1Value);
 Serial.print(",");
 Serial.print("140"); //aux2Value);
 Serial.print(",");
 Serial.print("10"); // replace (1) with (Digitalaux1Value);
 Serial.print(",");
 Serial.println ("000");
 
 
}
