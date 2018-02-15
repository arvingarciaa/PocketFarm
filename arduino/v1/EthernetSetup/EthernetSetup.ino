#include <SPI.h>

#include <Dhcp.h>
#include <Dns.h>
#include <Ethernet.h>
#include <EthernetClient.h>
#include <EthernetServer.h>
#include <EthernetUdp.h>

#include <Base64.h>
#include <global.h>
#include <sha1.h>
#include <WebSocketClient.h>

// Here we define a maximum framelength to 64 bytes. Default is 256.
//#define MAX_FRAME_LENGTH 64

// Define how many callback functions you have. Default is 1.
#define CALLBACK_FUNCTIONS 1

#define MESSAGE_INTERVAL 30000
#define HEARTBEAT_INTERVAL 25000


byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED }; // Set MAC address if necessary
char server[] = "www.google.com";                    // Set destination URL
IPAddress ip(192, 168, 2, 177);                      // Set static IP if DHCP fails

EthernetClient client;

WebSocketClient webSocketClient;

uint64_t messageTimestamp = 0;
uint64_t heartbeatTimestamp = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(19200);
  Serial.println("Good day!");
  while(!Serial);

  if (Ethernet.begin(mac) == 0) {
    Serial.println("DHCP failed. Retrying with static IP.");
    Ethernet.begin(mac, ip);
  }

  delay(1000);
  Serial.println(Ethernet.localIP());

  // Connect to the websocket server
  if (client.connect("192.168.1.11", 5000)) {
    Serial.println("Connected");
  } else {
    Serial.println("Connection failed.");
    while(1) {
      // Hang on failure
    }
  }

  // Handshake with the server
  webSocketClient.path = "/";
  webSocketClient.host = "192.168.1.11:5000";

  if (webSocketClient.handshake(client, true)) {
    Serial.println("Handshake successful");
    // socket.io upgrade confirmation message (required)
    webSocketClient.sendData("5");
  } else {
    Serial.println("Handshake failed.");
    while(1) {
      // Hang on failure
    }
  }
}

void loop() {
  String data;

  if (client.connected()) {

    webSocketClient.getData(data);

    if (data.length() > 0) {
      Serial.print("Received data: ");
      Serial.println(data);
    }

    uint64_t now = millis();

    if(now - messageTimestamp > MESSAGE_INTERVAL) {
        messageTimestamp = now;
        // capture the value of analog 1, send it along
        pinMode(1, INPUT);
        data = String(analogRead(1));

        // example socket.io message with type "messageType" and JSON payload
        char message[128];
        sprintf(message, "42[\"messageType\",{\"data\":\"%s\"}]", data.c_str());
        webSocketClient.sendData(message);
    }
    if((now - heartbeatTimestamp) > HEARTBEAT_INTERVAL) {
        heartbeatTimestamp = now;
        // socket.io heartbeat message
        webSocketClient.sendData("2");
    }

  } else {

    Serial.println("Client disconnected.");
    while (1) {
      // Hang on disconnect.
    }
  }

  // wait to fully let the client disconnect
  delay(3000);
}
