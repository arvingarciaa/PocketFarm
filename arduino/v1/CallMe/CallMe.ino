#include <SoftwareSerial.h>

SoftwareSerial gsm(7, 8);

void setup() {
  gsm.begin(19200);
  gsm.print("\r");
  delay(1000);
  gsm.println("ATD+639062875909;");
  delay(10000);
  gsm.println("ATH");
  delay(1000);
  gsm.write(0x1A);
}

void loop() {
  // put your main code here, to run repeatedly:

}
