#!/bin/sh
vxs=$1
vys=$2
name=$3
NAME=$4
lim1=$5
lim2=$6
dlim=$7
mlim1=$8
mlim2=$9
mdlim=${10}
HEIGHT=${11}
echo $1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11}
cdfrdim z $HEIGHT < main.cdf | \
    cdfmath "u $vxs - u =" | \
    cdfmath "v $vys - v =" | \
    goplot "16,fs/11,10,6,6,fg/longitude (deg),lx/latitude (deg),ly/lon,lat,absvort,2,$lim1,$lim2,$dlim,300,f/lon,lat,absvort,k,1,0,$lim1,$lim2,$dlim,c/t,fp/lon,lat,u,v,0.02,0.02,2,2,v/$NAME ABSVORT ${HEIGHT}km rel wind 50 m~/s~/deg,tl/11,10,20,6,fg/longitude (deg),lx/latitude (deg),ly/lon,lat,mflux,2,$mlim1,$mlim2,$mdlim,300,f/lon,lat,mflux,k,1,0,$mlim1,$mlim2,$mdlim,c/t,fp/lon,lat,u,v,0.02,0.02,2,2,v/${HEIGHT}km MFLUX,tl" absvort_${HEIGHT}km

epstopdf absvort_${HEIGHT}km.ps
#pdftopng absvort_${HEIGHT}km.pdf absvort_${HEIGHT}km
#rm absvort_${HEIGHT}km.ps


 
