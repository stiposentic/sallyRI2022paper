#!/bin/sh

file=sally1.cdf
lon1=-84.5; lon2=-83.5; lat1=27; lat2=28; #earlier
lon1=-85; lon2=-84; lat1=27; lat2=28; #Dave
vx=-3.8; vy=1.8;
cat $file  | avapsvtend.sh $vx $vy | cdfextr mflux vorttend |\
cdfmath "mflux 0 * zero =" |\
cdfrdim lon $lon1 $lon2 | cdfrdim lat $lat1 $lat2 > tmp1
file=sally1r.cdf
cat $file  | avapsvtend.sh $vx $vy | cdfextr mflux vorttend |\
cdfrdim lon $lon1 $lon2 | cdfrdim lat $lat1 $lat2 > tmp1r

file=sally2.cdf
lon1=-86; lon2=-85; lat1=27.5; lat2=28.5; # Dave
vx=-2.3; vy=1.2;
cat $file  | avapsvtend.sh $vx $vy | cdfextr mflux vorttend |\
	cdfrdim lon $lon1 $lon2 | cdfrdim lat $lat1 $lat2 > tmp2
file=sally2r.cdf
cat $file  | avapsvtend.sh $vx $vy | cdfextr mflux vorttend |\
cdfrdim lon $lon1 $lon2 | cdfrdim lat $lat1 $lat2 > tmp2r


file=sally3.cdf
lon1=-87; lon2=-86; lat1=28; lat2=29; # Dave -87.00    -86.00     28.00     29.00
vx=-2.1; vy=0.9;
cat $file  | avapsvtend.sh $vx $vy | cdfextr mflux vorttend |\
cdfrdim lon $lon1 $lon2 | cdfrdim lat $lat1 $lat2 > tmp3

cdfmerge tmp1 '1' tmp2 '2' tmp3 '3' |\
goplot "12,fs/7,6,6,6,fg/-0.05,0.35,0.1,0,16,2,ax/mass flux (kg~/m$^2$~/s),lx/height (km),ly/mflux1,z1,k,2,0,Sally 1,0.17,15,p/mflux2,z2,r,2,0,Sally 2,0.17,13.8,p/mflux3,z3,b,2,0,Sally 3,0.17,12.6,p" figure3

epstopdf figure3.ps
ps2eps -f -B --size=20x40 figure3.ps

cdfmerge tmp1 '1' tmp2 '2' tmp3 '3' |\
goplot "12,fs/7,6,6,6,fg/-0.05,0.03,0.015,0,16,2,ax/vort. tend. (1~/ks$^2$),lx/height (km),ly/vorttend1,z1,k,2,0,p/vorttend2,z2,r,2,0,p/vorttend3,z3,b,2,0,p/zero1,z1,k,1,0,p" figure5

epstopdf figure5.ps
ps2eps -f -B --size=20x40 figure5.ps


cdfmerge tmp1 '1' tmp1r '1r' tmp2 '2' tmp2r '2r' tmp3 '3' |\
goplot "12,fs/7,6,6,6,fg/-0.05,0.35,0.1,0,16,2,ax/mass flux (kg~/m$^2$~/s),lx/height (km),ly/mflux1,z1,k,2,0,Sally 1,0.17,15,p/mflux1r,z1r,k,2,1,Sally 1r,0.17,13.8,p/mflux2,z2,r,2,0,Sally 2,0.17,12.6,p/mflux2r,z2r,r,2,1,Sally 2r,0.17,11.4,p/mflux3,z3,b,2,0,Sally 3,0.17,10.2,p" figure3rad

epstopdf figure3rad.ps
ps2eps -f -B --size=20x40 figure3rad.ps


