#!/bin/bash


function plotN1 {

cdfrdim z 2 < $file | \
    cdfmath "u $vx - u =" | \
    cdfmath "v $vy - v =" > tmp1
cdfrdim z 4 < $file | \
    cdfmath "u $vx - u =" | \
    cdfmath "v $vy - v =" > tmp2
cdfrdim z 6 < $file | \
    cdfmath "u $vx - u =" | \
    cdfmath "v $vy - v =" > tmp3



cdfmerge tmp1 '' tmp2 '2t' tmp3 '3t' |\
	goplot "12,fs/7,6,6,20.5,fg/latitude (deg),ly/,lx/-91,-82,2,24,31,2,ax/lon,lat,mflux,2,-0.05,0.25,0.05,300,f/lon,lat,mflux,k,0.2,0,-0.05,0.25,0.05,c/t,fp/lon,lat,u,v,0.02,0.02,2,2,v/Mass flux~, rel wind 50 m~/s~/deg,tl/2 km,-84,30,ll/a),-90,30,ll/\
7,6,14.5,20.5,fg/,ly/,lx/-91,-82,2,24,31,2,ax/lon,lat,absvort,2,0,0.4,0.1,300,f/lon,lat,absvort,k,.5,5,0,0.4,0.1,c/t,fp/lon,lat,u,v,0.02,0.02,2,2,v/Absolute vorticity (1~/ks),tl/2 km,-84,30,ll/b),-90,30,ll/\
\
12,fs/7,6,6,13.25,fg/,lx/latitude (deg),ly/-91,-82,2,24,31,2,ax/lon2t,lat2t,mflux2t,2,-0.05,0.25,0.05,300,f/lon2t,lat2t,mflux2t,k,.1,0,-0.05,0.25,0.05,c/lon2t,lat2t,u2t,v2t,0.02,0.02,2,2,v/4 km,-84,30,ll/c),-90,30,ll/\
7,6,14.5,13.25,fg/,lx/,ly/-91,-82,2,24,31,2,ax/lon2t,lat2t,absvort2t,2,0,0.4,0.1,300,f/lon2t,lat2t,absvort2t,k,.1,0,0,0.4,0.1,c/lon2t,lat2t,u2t,v2t,0.02,0.02,2,2,v/4 km,-84,30,ll/d),-90,30,ll/\
\
12,fs/7,6,6,6,fg/longitude (deg),lx/latitude (deg),ly/-91,-82,2,24,31,2,ax/lon3t,lat3t,mflux3t,2,-0.05,0.25,0.05,300,f/lon3t,lat3t,mflux3t,k,.1,0,-0.05,0.25,0.05,c/lon3t,lat3t,u3t,v3t,0.02,0.02,2,2,v/6 km,-84,30,ll/e),-90,30,ll/\
7,6,14.5,6,fg/longitude (deg),lx/,ly/-91,-82,2,24,31,2,ax/lon3t,lat3t,absvort3t,2,0,0.4,0.1,300,f/lon3t,lat3t,absvort3t,k,.1,0,0,0.4,0.1,c/lon3t,lat3t,u3t,v3t,0.02,0.02,2,2,v/6 km,-84,30,ll/f),-90,30,ll/\
" figure2b_$fileN

cdfmerge tmp1 '' tmp2 '2t' tmp3 '3t' |\
       goplot "12,fs/7,6,6,20.5,fg/$label,ly/,lx/$Alon1,$Alon2,2,$Alat1,$Alat2,2,ax/lon,lat,absvort,2,0,0.4,0.1,300,f/lon,lat,absvort,k,.5,5,0,0.4,0.1,c/t,fp/lon,lat,mflux,c,1,0,0.1,0.2,0.1,c/lon,lat,mflux,c,2,0,0.2,0.4,0.1,c/lon,lat,mflux,c,3,0,0.3,0.6,0.1,c/lon,lat,u,v,0.02,0.02,2,2,v/$box/$case~, absolute vorticity (1~/ks),tl/2 km,$Tpos,30,ll/$l1,$Lpos,30,ll/\
\
12,fs/7,6,6,13.25,fg/$label,ly/,lx/$Alon1,$Alon2,2,$Alat1,$Alat2,2,ax/lon2t,lat2t,absvort2t,2,0,0.4,0.1,300,f/lon2t,lat2t,absvort2t,k,.5,0,0,0.4,0.1,c/lon2t,lat2t,mflux2t,c,1,0,0.1,0.2,0.1,c/lon2t,lat2t,mflux2t,c,2,0,0.2,0.4,0.1,c/lon2t,lat2t,mflux2t,c,3,0,0.3,0.6,0.1,c/lon2t,lat2t,u2t,v2t,0.02,0.02,2,2,v/$box/4 km,$Tpos,30,ll/$l2,$Lpos,30,ll/\
\
12,fs/7,6,6,6,fg/longitude (deg),lx/$label,ly/$Alon1,$Alon2,2,$Alat1,$Alat2,2,ax/lon3t,lat3t,absvort3t,2,0,0.4,0.1,300,f/lon3t,lat3t,absvort3t,k,.5,0,0,0.4,0.1,c/lon3t,lat3t,mflux3t,c,1,0,0.1,0.2,0.1,c/lon3t,lat3t,mflux3t,c,2,0,0.2,0.4,0.1,c/lon3t,lat3t,mflux3t,c,3,0,0.3,0.6,0.1,c/lon3t,lat3t,u3t,v3t,0.02,0.02,2,2,v/$box/6 km,$Tpos,30,ll/$l3,$Lpos,30,ll/\
" figure2_$fileN

cdfmerge tmp1 '' tmp2 '2t' tmp3 '3t' |\
       goplot "12,fs/7,6,6,20.5,fg/$label,ly/,lx/$Alon1,$Alon2,2,$Alat1,$Alat2,2,ax/lon,lat,absvort,2,0,0.4,0.1,300,f/lon,lat,absvort,k,.5,5,0,0.4,0.1,c/t,fp/lon,lat,mflux,c,1,0,0.1,0.2,0.1,c/lon,lat,mflux,c,2,0,0.2,0.4,0.1,c/lon,lat,mflux,c,3,0,0.3,0.6,0.1,c/lon,lat,u,v,0.02,0.02,2,2,v/$case~, absolute vorticity (1~/ks),tl/2 km,$Tpos,30,ll/\
\
12,fs/7,6,6,13.25,fg/$label,ly/,lx/$Alon1,$Alon2,2,$Alat1,$Alat2,2,ax/lon2t,lat2t,absvort2t,2,0,0.4,0.1,300,f/lon2t,lat2t,absvort2t,k,.5,0,0,0.4,0.1,c/lon2t,lat2t,mflux2t,c,1,0,0.1,0.2,0.1,c/lon2t,lat2t,mflux2t,c,2,0,0.2,0.4,0.1,c/lon2t,lat2t,mflux2t,c,3,0,0.3,0.6,0.1,c/lon2t,lat2t,u2t,v2t,0.02,0.02,2,2,v/$box/4 km,$Tpos,30,ll/\
\
12,fs/7,6,6,6,fg/longitude (deg),lx/$label,ly/$Alon1,$Alon2,2,$Alat1,$Alat2,2,ax/lon3t,lat3t,absvort3t,2,0,0.4,0.1,300,f/lon3t,lat3t,absvort3t,k,.5,0,0,0.4,0.1,c/lon3t,lat3t,mflux3t,c,1,0,0.1,0.2,0.1,c/lon3t,lat3t,mflux3t,c,2,0,0.2,0.4,0.1,c/lon3t,lat3t,mflux3t,c,3,0,0.3,0.6,0.1,c/lon3t,lat3t,u3t,v3t,0.02,0.02,2,2,v/6 km,$Tpos,30,ll/\
" figure2c_$fileN

epstopdf figure2_$fileN.ps
ps2eps -f -B --size=20x40 figure2_$fileN.ps
epstopdf figure2c_$fileN.ps
ps2eps -f -B --size=20x40 figure2c_$fileN.ps
} # plotN1 end

#Dave's limits
#Case               VXG       VYG     VXSYS     VYSYS      lon1      lon2      lat1      lat2
#sally1           -3.00      0.00     -2.00     14.10    -85.00    -84.00     27.00     28.00
#sally2           -1.00      0.00     -5.60     17.00    -86.00    -85.00     27.50     28.50
#sally3           -5.00      6.00     -7.50     10.80    -87.00    -86.00     28.00     29.00
#grace1aSSTA     -10.00      2.00      2.20      3.40    -61.00    -59.00     13.00     14.00
#grace2SSTA       -6.00      2.00    -11.60      7.00    -66.00    -65.00     18.00     19.00
#grace4SST        -5.00      2.00    -14.10     15.80    -83.00    -82.00     18.50     20.00

file=sally1.cdf
fileN=sally1
case='Sally 1'
label='latitude (deg)'
vx=-3.8; vy=1.8;
lon1=-84.5; lon2=-83.5; lat1=27; lat2=28; #earlier
lon1=-85; lon2=-84; lat1=27; lat2=28; #Dave
Alon1=-90; Alon2=-82; Alat1=24; Alat2=31; # limits
Tpos=-84
Lpos=-89
box="$lon1,$lat1,$lon2,$lat1,w,2,dl/$lon2,$lat1,$lon2,$lat2,w,2,dl/$lon2,$lat2,$lon1,$lat2,w,2,dl/$lon1,$lat2,$lon1,$lat1,w,2,dl"
l1='a)'; l2='d)'; l3='g)'
plotN1

file=sally2.cdf
fileN=sally2
case='Sally 2'
label=''
vx=-2.3; vy=1.2;
lon1=-86; lon2=-85; lat1=27.5; lat2=28.5;
lon1=-86; lon2=-85; lat1=27.5; lat2=28.5; # Dave
Alon1=-91; Alon2=-84; Alat1=25; Alat2=31; # limits
Tpos=-86
Lpos=-90
box="$lon1,$lat1,$lon2,$lat1,w,2,dl/$lon2,$lat1,$lon2,$lat2,w,2,dl/$lon2,$lat2,$lon1,$lat2,w,2,dl/$lon1,$lat2,$lon1,$lat1,w,2,dl"
l1='b)'; l2='e)'; l3='h)'
plotN1

file=sally3.cdf
fileN=sally3
case='Sally 3'
label=''
vx=-2.1; vy=0.9;
lon1=-86; lon2=-85; lat1=27.5; lat2=28.5;
lon1=-87; lon2=-86; lat1=28; lat2=29; # Dave -87.00    -86.00     28.00     29.00
Alon1=-91; Alon2=-84; Alat1=25; Alat2=31; # limits
Tpos=-86
Lpos=-90
box="$lon1,$lat1,$lon2,$lat1,w,2,dl/$lon2,$lat1,$lon2,$lat2,w,2,dl/$lon2,$lat2,$lon1,$lat2,w,2,dl/$lon1,$lat2,$lon1,$lat1,w,2,dl"
l1='c)'; l2='f)'; l3='i)'
plotN1



