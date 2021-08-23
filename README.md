# Astra-Rocket3-STP27AD1-kOS-Scripts-23082021

Craft files for the rocket, and a version without the parts needed for kOS, are included.

Link to Youtube video:


This is the Kerbal Operating System code for a Astra rocket 3 launch, carrying the STP-27AD1 mission to polar LEO.

The code launches the satellite into LEO, but doestn't deploy the solay panels and antennae of the satellite, due to the kOS processor being on the rocket and not the satellite.

The boot.ks file opens the kOS Terminal of the kOS processor directly after launching the vessel. This only works if you right-click the kOS processor attached to the launcher's faring base, and select boot file "boot.ks". This file has to be placed inside a "Boot" foder in the KSP/Ships/Script directory.

///NOTES///

-> Tested in Kerbal Space Program Version 1.12.2.

-> The payload is a dummy satellite because of the classified nature of the mission.
