# PocketFarm version 1 (Server)

## Setup

The setup for the first revision were as follows.

## The Farm

The farm setup was assigned a GSM number which serves as the main communication point of the farmer. It will react to messages with a specific code/format--get sensor data, get weather forecast, or get irrigation suggestions. To facilitate requests for weather forecasts or irrigiation suggestions, the farm unit will forward the request to the central server, in which it will reply back with the requested resource.

A [GSM shield](https://www.elecrow.com/sim800c-gprs-gsm-shield-for-arduino.html) is attached to the Arduino, with the [Capacitive Soil Moisture Sensor](https://www.dfrobot.com/wiki/index.php/Capacitive_Soil_Moisture_Sensor_SKU:SEN0193) connected to `A5`, and the [DHT22 Temperature and Humidity Module](https://www.dfrobot.com/wiki/index.php/DHT22_Temperature_and_humidity_module_SKU:SEN0137) connected to `A0`.

The code is available at `/arduino/v1/final_working/final_working.ino`.

## The Central Server
The central server relied on an Arduino with a GSM shield to receive texts from the farm units, and a Node.js server to facilitate processing. They are both communicating via WebSockets, and so requires the Arduino connected to both a [GSM shield](https://www.elecrow.com/sim800c-gprs-gsm-shield-for-arduino.html) and an [Ethernet shield](http://www.elecrow.com/w5100-ethernet-shield-for-arduino-p-670.html). 

While this setup offers flexibility (i.e., the Arduino setup can be running 24/7 somewhere connected to a router, and the server can be hosted offshore to ensure reliability), it poses issues on cost, redundancy, and speed.

The Arduino code is available at `/arduino/v1/WebSocketGSMBridge`.
The server code is available at `/server/v1`. It can be run using `npm start`. Make sure to duplicate `/server/v1/example.env` to `/server/v1/.env` and add your keys before running.