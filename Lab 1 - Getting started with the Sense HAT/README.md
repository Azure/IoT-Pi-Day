# Lab 1 - Getting started with the Sense HAT

## What is a Sense HAT?

### The Sense HAT is an add-on board for the Raspberry Pi, made especially for the Astro Pi competition. The board allows you to make measurements of temperature, humidity, pressure, and orientation, and to output information using its built-in LED matrix.

![Image of Sense HAT](/images/sense-hat.png)

### The Sense HAT has an 8 × 8 RGB LED matrix, a five – button joystick and includes the following sensors:
- Gyroscope
- Accelerometer
- Magnetometer
- Temperature
- Barometric pressure
- Humidity

First, let’s start with pressure, temperature and humidity sensors! These sensors are located on the right side of the Sense HAT. The humidity sensor is labeled “HUMIDITY” and below it is the atmospheric pressure sensor, labeled “PRESSURE”. The temperature seems to be read from the humidity sensor.

There’s a function for each sensor so the values can be acquired very easily!

**Get_temperature**
- Gets the current temperature in Millibars from the pressure sensor. 
**Get_temperature_from_humidity**
- Gets the current temperature in degrees Celsius from the humidity sensor.
 
**Get_pressure**
- Gets the current pressure in Millibars from the pressure sensor.
 
**Get_humidity**
- Gets the percentage of relative humidity from the humidity sensor.

## To be continued...
