#!/bin/sh
T=86.4
fourpi=12.57
TF=273.15
pref=1000
kappa=0.286
R=287.05

cdfmath "$fourpi $T / lat sin * f =" | \
    cdfmath "temp $TF + $pref pres / $kappa pow * theta =" | \
    cdfderiv dvdz v z | \
    cdfderiv dudz u z | \
    cdfmath "dvdz vortx =" | \
    cdfmath "dudz -1 * vorty =" | \
    cdfderiv dthetadz theta z | \
    lonlatgrad.sh lon lat theta thetax thetay | \
    cdfmath "thetax vortx * thetay vorty * + pv =" | \
    cdfmath "pres 100 * temp $TF + $R * / rho3 =" | \
    cdfextr -r vortx vorty |\
    cdfmath "pv dthetadz relvort f + * + rho3 / pv ="
