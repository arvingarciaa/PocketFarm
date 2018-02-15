#include <Arduino.h>

#include <SPI.h>
#include <Ethernet.h>
#include <WebSocketsClient.h>

// Enter a MAC address for your controller below.
// Newer Ethernet shields have a MAC address printed on a sticker on the shield
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };

// Set the static IP address to use if the DHCP fails to assign
IPAddress ip(192, 168, 137, 67);
WebSocketsClient webSocket;

char server[] = "192.168.137.1";
int port = 5000;

void webSocketEvent(WStype_t type, uint8_t * payload, size_t length) {
    switch(type) {
        case WStype_DISCONNECTED:
            Serial.println("[WSc] Disconnected!\n");
            break;
        case WStype_CONNECTED:
            {
                Serial.print("[WSc] Connected to url: ");
                Serial.println((char *)payload);
                // send message to server when Connected
                webSocket.sendTXT("Connected");
            }
            break;
        case WStype_TEXT:
            Serial.print("[WSc] get text: ");
            Serial.println((char *)payload);
            Serial1.println((char *)payload);
            // send message to server
            // webSocket.sendTXT("message here");
            break;
        case WStype_BIN:
            Serial.print("[WSc] get binary length: ");
            Serial.println(length);
            Serial1.write(0x1a);

            // send data to server
            // webSocket.sendBIN(payload, length);
            break;
    }

}

void power_on_off() {
    digitalWrite(9,LOW);
    delay(1000);
    digitalWrite(9,HIGH);
    delay(2000);
    digitalWrite(9,LOW);
    delay(3000);
}

void setup() {
    // Open serial communications and wait for port to open:
    Serial.begin(115200);
    Serial1.begin(115200);
    while (!Serial) {}
    while (!Serial1) {}
    pinMode(9, OUTPUT); 

    // start the Ethernet connection:
    if (Ethernet.begin(mac) == 0) {
      Serial.println("Failed to configure Ethernet using DHCP");
      // no point in carrying on, so do nothing forevermore:
      // try to congifure using IP address instead of DHCP:
      Ethernet.begin(mac, ip);
    }

    webSocket.begin(server, port);
    webSocket.onEvent(webSocketEvent);

}


void loop() {
    webSocket.loop();
    while (Serial1.available())
        webSocket.sendTXT(Serial1.readString());
}
