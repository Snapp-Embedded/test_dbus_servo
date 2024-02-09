# SPDX-FileCopyrightText: 2021 ladyada for Adafruit Industries
# SPDX-License-Identifier: MIT

import time

from board import SCL, SDA
import busio

# Import the PCA9685 module. Available in the bundle and here:
#   https://github.com/adafruit/Adafruit_CircuitPython_PCA9685
from adafruit_motor import servo
from adafruit_pca9685 import PCA9685

i2c = busio.I2C(SCL, SDA)

pca = PCA9685(i2c)
# You can optionally provide a finer tuned reference clock speed to improve the accuracy of the
# timing pulses. This calibration will be specific to each board and its environment. See the
# calibration.py example in the PCA9685 driver.
# pca = PCA9685(i2c, reference_clock_speed=25630710)
pca.frequency = 50

servo0 = servo.ContinuousServo(pca.channels[0])
servo1 = servo.ContinuousServo(pca.channels[1])
servo2 = servo.ContinuousServo(pca.channels[2])
servo3 = servo.ContinuousServo(pca.channels[3])

print(servo0.throttle)
print(servo0.fraction)
print(servo1.throttle)
print(servo1.fraction)
print(servo2.throttle)
print(servo2.fraction)
print(servo3.throttle)
print(servo3.fraction)


servo0.throttle = 0.0
servo1.throttle = 0.0
servo2.throttle = 0.0
servo3.throttle = 0.0

pca.deinit()