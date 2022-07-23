#!/bin/sh
TR=273.15
PR=1000
CP=1005
R=287.05

cdfmath "temp $TR + $TR / log $CP * pres $PR / log $R * - dryent ="
