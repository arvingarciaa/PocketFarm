#include <SoftwareSerial.h>

SoftwareSerial gsm(7, 8);

void setup() {
  gsm.begin(19200);
  Serial.begin(19200);
  Serial.println("Hello!");
//  long prevTime = 0;
//  gsm.begin(19200);
//  Serial.begin(19200);
//  Serial.println("Hello!");
  gsm.print("\r");
  delay(1000);
  gsm.print("AT\r");
//  gsm.print("AT+CMGF=1\r");
//  delay(1000);
//  gsm.print("AT+CMGS=\"+639062875909\"\r");
//  delay(1000);
//  gsm.print("Hello! Test test.");
//  prevTime = millis();
//  while (millis() - prevTime < 5000) {
//    if (gsm.available())
//      Serial.print((char) gsm.read());  
//  }
//  Serial.println("Timeout");
//  gsm.write(0x1A);
//  delay(1000);
//  delay(1000);
//  gsm.print("AT+CMGF=1\r");
//  delay(1000);
//  gsm.print("AT+CMGS=\"+639062875909\"\r");
//  delay(1000);
//  gsm.print("Hello! I am PocketFarm.");
//  delay(1000);
  
}

void loop() {
  // put your main code here, to run repeatedly:
  if (Serial.available())
    gsm.print((char)Serial.read());
  else if (gsm.available())
    Serial.print((char)gsm.read());
}
