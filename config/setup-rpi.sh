#!/usr/bin/env bash

# Install pre-reqs
sudo apt install git python3 pip3 -y

# Ensure i2c is active
sudo raspi-config nonint do_i2c 0

# Ensure we're in home and make a directory to hold all the repos
cd ~
mkdir pimoroni
cd pimoroni

## Setup BME680 breakout
git clone https://github.com/pimoroni/bme680
pushd bme680/library
sudo python setup.py install
popd

## Setup MICS6814 breakout
git clone https://github.com/pimoroni/mics6814-python
pushd mics6814-python
sudo ./install.sh
popd

## Setup 1.12" OLED breakout
sudo pip3 install git+git://github.com/rm-hull/luma.oled.git#egg=luma.oled
git clone https://github.com/rm-hull/luma.examples
popd
