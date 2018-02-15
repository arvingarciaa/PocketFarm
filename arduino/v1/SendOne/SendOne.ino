#include <SoftwareSerial.h>

SoftwareSerial gsm(7, 8);

void setup() {
  gsm.begin(19200);
  gsm.print("\r");
  delay(1000);
  gsm.print("AT+CMGF=1\r");
  delay(1000);
  gsm.print("AT+CMGS=\"+639062875909\"\r");
  delay(1000);
  gsm.print("Hello! I am PocketFarm.");
  delay(1000);
  gsm.write(0x1A);
}

void loop() {
  // put your main code here, to run repeatedly:

}
