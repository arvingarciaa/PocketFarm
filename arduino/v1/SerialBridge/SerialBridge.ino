#include <Arduino.h>
void setup()
{
    // Open serial communications and wait for port to open:
    Serial.begin(115200);
    Serial1.begin(115200);
    while (!Serial) {}
    while (!Serial1) {}
}


void loop()
{
    if (Serial1.available())
        Serial.write(Serial1.read());
    if (Serial.available()) {
        char x = Serial.read();
        if (x == '^') {
          Serial1.write(0x1a);
        } else {
          Serial1.write(x);           
        }
    }
}
