#include "Arduino.h"
#include <Ethernet.h>
#include <SPI.h>
#include <WebSocketClient.h>

byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
//char server[] = "echo.websocket.org";
char server[] = "192.168.2.1";
int port = 5000;
WebSocketClient client;

void setup () {
  Serial.begin(9600);
  Serial.println("Hello!");
  Ethernet.begin(mac);
  Serial.println(Ethernet.localIP());
  delay(1000);
//  if (client.connect(server)) {
  if (client.connect("192.168.2.1", 5000)) {
    Serial.println("Connected");
  } else {
    Serial.println("Connection failed.");
    while(1) {
      // Hang on failure
    }
  }
  client.setDataArrivedDelegate(dataArrived);
  client.send("Hello World!");
  Serial.println("Sent hello.");
}

void loop () {
  client.monitor();
//  if (Serial.available()) {
//    client.send(Serial.readString());
//  }
}

void dataArrived(WebSocketClient client, String data) {
  Serial.println("Data Arrived: " + data);
}
