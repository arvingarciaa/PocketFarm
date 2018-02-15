# PocketFarm

## Abstract

PocketFarm aims to implement precision agriculture on a farm using a network of sensors and data from online weather sources. Low cost and efﬁcient sensors and microcontroller will be used to make an effective farm monitoring system to help the farmer monitor the irrigation. An efﬁcient irrigation system correlates to low cost farming and high yield of crops.

The project is based on a Philippine setting and may include Asia/Philippine-based stores and references.

## Use Case

Since this project is centered around ease of use and convenience, PocketFarm enables a semi-automatic irrigation system through text messaging, weather forecasts, and on-farm sensors. The farmer will have an electronic system integrated directly to their preferred mode of irrigation. Currently, we assume a [gravity irrigation system](https://www.youtube.com/watch?v=6-emq0cxhtU). 

![2]

---

## Project Components

### The Farm

To describe some the electronic components, a modified architectural diagram is presented as follows.

![1]

To clarify, the electronic system's brain is an [Arduino Uno (clone)](https://www.lazada.com.ph/arduino-uno-r3-arduino-compatible-board-with-usb-13329964.html?spm=a2o4l.searchlist.list.2.64ed7741O4s0hg), where two sensors--[Capacitive Soil Moisture Sensor](https://www.dfrobot.com/wiki/index.php/Capacitive_Soil_Moisture_Sensor_SKU:SEN0193), and a [DHT22 Temperature and Humidity Module](https://www.dfrobot.com/wiki/index.php/DHT22_Temperature_and_humidity_module_SKU:SEN0137)-- are connected, along with a [solenoid valve](https://www.makerlab-electronics.com/product/plastic-water-solenoid-valve-12v-1-2-nps/) which will control the irrigation system. In addition, a [GSM module](https://www.elecrow.com/sim800c-gprs-gsm-shield-for-arduino.html) serves as the communications link to the central remote server, which does all the processing and decisions.

### The Central Server

The central server is powered by a [Raspberry Pi](https://www.adafruit.com/product/998) hooked to the same [GSM module](https://www.elecrow.com/sim800c-gprs-gsm-shield-for-arduino.html) used in the farm setup. Additionally, the code is written in JavaScript, through Node.js to easily facilitate a front-end solution in the near future.

The server takes in all sensor data from all farm setups (soil moisture, temperature, and humidity), and their corresponding weather forecast data from [WeatherUnderground](https://www.wunderground.com). The server also facilitates scheduled farm irrigation, by sending commands to the farm setups.

---

## What's Inside

The repository contains the following directories.
```bash
./
|-- arduino/  
    # Contains all Arduino-related code, including previous revisions.
|-- server/  
    # Contains all server-related code, including previous revisions. They're meant to be run via Node.js.
|-- schematics/     
    # Contains all PCB schematics and layouts created for both the Raspberry Pi server setup and Arduino setup for the farm.
```

[1]: https://i.imgur.com/4u4o8eJ.png
[2]: https://i.imgur.com/9hq7tE3.png
