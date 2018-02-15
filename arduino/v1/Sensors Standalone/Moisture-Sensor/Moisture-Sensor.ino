/* How to use the DHT-22 sensor with Arduino uno
   Temperature and humidity sensor
   More info: http://www.ardumotive.com/how-to-use-dht-22-sensor-en.html
   Dev: Michalis Vasilakis // Date: 1/7/2015 // www.ardumotive.com */


//Variables
int val, val2;

void setup() {
  Serial.begin(9600); // open serial port, set the baud rate as 9600 bps
}
void loop() {
  val = analogRead(0); //connect sensor to Analog 0
  val2 = analogRead(1);
  Serial.print("Moisture Sensor #1: ");
  Serial.print(val);
  Serial.print("    Moisture Sensor #2: ");
  Serial.print(val2);
  Serial.print("    Moisture Sensor #3: ");
  Serial.println(val);
  delay(500);
}
   
