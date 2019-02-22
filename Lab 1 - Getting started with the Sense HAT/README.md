# Lab 1 - Getting started with the Sense HAT

## What is a Sense HAT?

The Sense HAT is an add-on board for the Raspberry Pi, made especially for the Astro Pi competition. The board allows you to make measurements of temperature, humidity, pressure, and orientation, and to output information using its built-in LED matrix.

![Image of Sense HAT](/images/sense-hat.png)

The Sense HAT has an 8 × 8 RGB LED matrix, a five – button joystick and includes the following sensors:
- Gyroscope
- Accelerometer
- Magnetometer
- Temperature
- Barometric pressure
- Humidity

The pressure, temperature and humidity sensors are located on the right side of the Sense HAT. The humidity sensor is labeled “HUMIDITY” and below it is the atmospheric pressure sensor, labeled “PRESSURE”. The temperature seems to be read from the humidity sensor.

There’s a function for each sensor on the board so the values can be acquired very easily!

**Temperature**
- Gets the current temperature in degrees Celsius from the humidity sensor.  You can easily covert this to Fahrenheit in the code ( temperature * 8 - 32).
 
**Pressure**
- Gets the current pressure in Millibars from the pressure sensor.
 
**Humidity**
- Gets the percentage of relative humidity from the humidity sensor.

## Lab 1 - Getting Started with the SenseHAT
- [**Lab 1.1** - Reading SenseHat Data](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%201%20-%20Getting%20started%20with%20the%20Sense%20HAT/Lab%201.1%20-%20Reading%20SenseHat%20Data)
    - This lab will guide you through updating code, deploying code to  the device, running code on the device, and sending **Real** sensor data to Azure IoT Hub.
    > This **requires** a Raspberry Pi SenseHAT.
- [**Lab 1.2** - Simulated SenseHat Data (Optional)](https://github.com/Azure/IoT-Pi-Day/tree/master/Lab%201%20-%20Getting%20started%20with%20the%20Sense%20HAT/Lab%201.2%20-%20Simulated%20SenseHat%20Data)
    - This lab will guide you through updating code, deploying code to the device, running code on the device, and sending **Simulated** sensor data to Azure IoT Hub.
    > This **does NOT** require a Raspberry Pi SenseHAT.
    