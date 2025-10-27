#!/bin/sh

/home/user/steam/steamcmd.sh +force_install_dir /home/user/satisfactory +login anonymous +app_update 1690800 validate +quit

exec ./Engine/Binaries/Linux/FactoryServer-Linux-Shipping FactoryGame
