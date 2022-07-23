#!/bin/sh
vxs=$1
vys=$2
name=$3
NAME=$4
slim1=$5
slim2=$6
sdlim=$7
mlim1=$8
mlim2=$9
mdlim=${10}
HEIGHT=${11}

lon1=${12}
lon2=${13}
lat1=${14}
lat2=${15}
vx1=-3.8; vy1=1.8;
box="$lon1,$lat1,$lon2,$lat1,r,2,dl/$lon2,$lat1,$lon2,$lat2,r,2,dl/$lon2,$lat2,$lon1,$lat2,r,2,dl/$lon1,$lat2,$lon1,$lat1,r,2,dl"

vx2=-2.3; vy2=1.2;
lon1=-86; lon2=-85; lat1=27.5; lat2=28.5;
box2t="$lon1,$lat1,$lon2,$lat1,r,2,dl/$lon2,$lat1,$lon2,$lat2,r,2,dl/$lon2,$lat2,$lon1,$lat2,r,2,dl/$lon1,$lat2,$lon1,$lat1,r,2,dl"

vx3=-2.1; vy3=0.9;
lon1=-86; lon2=-85; lat1=27.5; lat2=28.5;
box3t="$lon1,$lat1,$lon2,$lat1,r,2,dl/$lon2,$lat1,$lon2,$lat2,r,2,dl/$lon2,$lat2,$lon1,$lat2,r,2,dl/$lon1,$lat2,$lon1,$lat1,r,2,dl"



echo sfrac
cdfrdim z 4 < sally1.cdf | \
    cdfmath "u $vx1 - u =" | \
    cdfmath "v $vy1 - v =" > tmp1
cdfrdim z 4 < sally2.cdf | \
    cdfmath "u $vx2 - u =" | \
    cdfmath "v $vy2 - v =" > tmp2
cdfrdim z 4 < sally3.cdf | \
    cdfmath "u $vx3 - u =" | \
    cdfmath "v $vy3 - v =" > tmp3

#cat tmp1 |\
#    goplot "16,fs/11,10,6,6,fg/longitude (deg),lx/latitude (deg),ly/-91,-82,1,24,31,1,ax/lon,lat,sfrac,2,$slim1,$slim2,$sdlim,300,f/lon,lat,sfrac,k,1,0,$slim1,$slim2,$sdlim,c/t,fp/lon,lat,u,v,0.02,0.02,2,2,v/$box/$NAME aturation fraction 4 km~, rel wind 50 m~/s~/deg,tl/\
#11,10,20,6,fg/longitude (deg),lx/latitude (deg),ly/-91,-82,1,24,31,1,ax/lon,lat,ii,2,0,30,5,300,f/lon,lat,ii,k,1,0,0,30,5,c/t,fp/lon,lat,u,v,0.02,0.02,2,2,v/$box/4 km instability index,tl/\
#11,10,34,6,fg/longitude (deg),lx/latitude (deg),ly/-91,-82,1,24,31,1,ax/lon,lat,dcin,2,-20,12,4,300,f/lon,lat,dcin,k,1,0,-20,12,4,c/t,fp/lon,lat,u,v,0.02,0.02,2,2,v/$box/4 km DCIN,tl" figure1 






cdfmerge tmp1 '' tmp2 '2t' tmp3 '3t' |\
	goplot "12,fs/7,6,6,20.5,fg/latitude (deg),ly/,lx/-91,-82,2,24,31,2,ax/lon,lat,sfrac,2,$slim1,$slim2,$sdlim,300,f/lon,lat,sfrac,k,0.5,0,$slim1,$slim2,$sdlim,c/t,fp/lon,lat,u,v,0.02,0.02,2,2,v/$box/Saturation fraction~, 4 km rel wind 50 m~/s~/deg,tl/Sally 1,-84,30,ll/a),-90,30,ll/\
7,6,14.5,20.5,fg/,ly/,lx/-91,-82,2,24,31,2,ax/lon,lat,ii,2,0,30,5,300,f/lon,lat,ii,k,.5,0,0,30,5,c/t,fp/lon,lat,u,v,0.02,0.02,2,2,v/$box/Instability index,tl/Sally 1,-84,30,ll/b),-90,30,ll/\
7,6,23.1,20.5,fg/,ly/,lx/-91,-82,2,24,31,2,ax/lon,lat,dcin,2,-20,12,4,300,f/lon,lat,dcin,k,.5,0,-20,12,4,c/t,fp/lon,lat,u,v,0.02,0.02,2,2,v/$box/DCIN,tl/Sally 1,-84,30,ll/c),-90,30,ll/\
\
12,fs/7,6,6,13.25,fg/,lx/latitude (deg),ly/-91,-82,2,24,31,2,ax/lon2t,lat2t,sfrac2t,2,$slim1,$slim2,$sdlim,300,f/lon2t,lat2t,sfrac2t,k,.5,0,$slim1,$slim2,$sdlim,c/lon2t,lat2t,u2t,v2t,0.02,0.02,2,2,v/$box2t/Sally 2,-84,30,ll/d),-90,30,ll/\
7,6,14.5,13.25,fg/,lx/,ly/-91,-82,2,24,31,2,ax/lon2t,lat2t,ii2t,2,0,30,5,300,f/lon2t,lat2t,ii2t,k,.5,0,0,30,5,c/lon2t,lat2t,u2t,v2t,0.02,0.02,2,2,v/$box2t/Sally 2,-84,30,ll/e),-90,30,ll/\
7,6,23.1,13.25,fg/,lx/,ly/-91,-82,2,24,31,2,ax/lon2t,lat2t,dcin2t,2,-20,12,4,300,f/lon2t,lat2t,dcin2t,k,.5,0,-20,12,4,c/lon2t,lat2t,u2t,v2t,0.02,0.02,2,2,v/$box2t/Sally 2,-84,30,ll/f),-90,30,ll/\
\
12,fs/7,6,6,6,fg/longitude (deg),lx/latitude (deg),ly/-91,-82,2,24,31,2,ax/lon3t,lat3t,sfrac3t,2,$slim1,$slim2,$sdlim,300,f/lon3t,lat3t,sfrac3t,k,.5,0,$slim1,$slim2,$sdlim,c/lon3t,lat3t,u3t,v3t,0.02,0.02,2,2,v/$box3t/Sally 3,-84,30,ll/g),-90,30,ll/\
7,6,14.5,6,fg/longitude (deg),lx/,ly/-91,-82,2,24,31,2,ax/lon3t,lat3t,ii3t,2,0,30,5,300,f/lon3t,lat3t,ii3t,k,.5,0,0,30,5,c/lon3t,lat3t,u3t,v3t,0.02,0.02,2,2,v/$box3t/Sally 3,-84,30,ll/h),-90,30,ll/\
7,6,23.1,6,fg/longitude (deg),lx/,ly/-91,-82,2,24,31,2,ax/lon3t,lat3t,dcin3t,2,-20,12,4,300,f/lon3t,lat3t,dcin3t,k,.5,0,-20,12,4,c/lon3t,lat3t,u3t,v3t,0.02,0.02,2,2,v/$box3t/Sally 3,-84,30,ll/i),-90,30,ll/\
" figure1
ps2eps -f -B --size=40x40 figure1.ps


epstopdf figure1.ps
#pdftopng sfrac.pdf sfrac
#rm sfrac.ps

cdfmerge tmp1 '' tmp2 '2t' tmp3 '3t' |\
        goplot "12,fs/7,6,6,20.5,fg/latitude (deg),ly/,lx/-91,-82,2,24,31,2,ax/lon,lat,sfrac,2,$slim1,$slim2,$sdlim,300,f/lon,lat,sfrac,k,0.5,0,$slim1,$slim2,$sdlim,c/t,fp/lon,lat,u,v,0.02,0.02,2,2,v/Saturation fraction~, 4 km rel wind 50 m~/s~/deg,tl/Sally 1,-84,30,ll/a),-90,30,ll/\
7,6,14.5,20.5,fg/,ly/,lx/-91,-82,2,24,31,2,ax/lon,lat,ii,2,0,30,5,300,f/lon,lat,ii,k,.5,0,0,30,5,c/t,fp/lon,lat,u,v,0.02,0.02,2,2,v/Instability index,tl/Sally 1,-84,30,ll/b),-90,30,ll/\
7,6,23.1,20.5,fg/,ly/,lx/-91,-82,2,24,31,2,ax/lon,lat,dcin,2,-20,12,4,300,f/lon,lat,dcin,k,.5,0,-20,12,4,c/t,fp/lon,lat,u,v,0.02,0.02,2,2,v/DCIN,tl/Sally 1,-84,30,ll/c),-90,30,ll/\
\
12,fs/7,6,6,13.25,fg/,lx/latitude (deg),ly/-91,-82,2,24,31,2,ax/lon2t,lat2t,sfrac2t,2,$slim1,$slim2,$sdlim,300,f/lon2t,lat2t,sfrac2t,k,.5,0,$slim1,$slim2,$sdlim,c/lon2t,lat2t,u2t,v2t,0.02,0.02,2,2,v/Sally 2,-84,30,ll/d),-90,30,ll/\
7,6,14.5,13.25,fg/,lx/,ly/-91,-82,2,24,31,2,ax/lon2t,lat2t,ii2t,2,0,30,5,300,f/lon2t,lat2t,ii2t,k,.5,0,0,30,5,c/lon2t,lat2t,u2t,v2t,0.02,0.02,2,2,v/Sally 2,-84,30,ll/e),-90,30,ll/\
7,6,23.1,13.25,fg/,lx/,ly/-91,-82,2,24,31,2,ax/lon2t,lat2t,dcin2t,2,-20,12,4,300,f/lon2t,lat2t,dcin2t,k,.5,0,-20,12,4,c/lon2t,lat2t,u2t,v2t,0.02,0.02,2,2,v/Sally 2,-84,30,ll/f),-90,30,ll/\
\
12,fs/7,6,6,6,fg/longitude (deg),lx/latitude (deg),ly/-91,-82,2,24,31,2,ax/lon3t,lat3t,sfrac3t,2,$slim1,$slim2,$sdlim,300,f/lon3t,lat3t,sfrac3t,k,.5,0,$slim1,$slim2,$sdlim,c/lon3t,lat3t,u3t,v3t,0.02,0.02,2,2,v/Sally 3,-84,30,ll/g),-90,30,ll/\
7,6,14.5,6,fg/longitude (deg),lx/,ly/-91,-82,2,24,31,2,ax/lon3t,lat3t,ii3t,2,0,30,5,300,f/lon3t,lat3t,ii3t,k,.5,0,0,30,5,c/lon3t,lat3t,u3t,v3t,0.02,0.02,2,2,v/Sally 3,-84,30,ll/h),-90,30,ll/\
7,6,23.1,6,fg/longitude (deg),lx/,ly/-91,-82,2,24,31,2,ax/lon3t,lat3t,dcin3t,2,-20,12,4,300,f/lon3t,lat3t,dcin3t,k,.5,0,-20,12,4,c/lon3t,lat3t,u3t,v3t,0.02,0.02,2,2,v/Sally 3,-84,30,ll/i),-90,30,ll/\
" figure1b

cdfmerge tmp1 '' tmp2 '2t' tmp3 '3t' |\
        goplot "12,fs/\
7,6,6,20.5,fg/latitude (deg),ly/,lx/-91,-82,2,24,31,2,ax/lon,lat,sfrac,2,$slim1,$slim2,$sdlim,300,f/lon,lat,sfrac,k,0.5,0,$slim1,$slim2,$sdlim,c/lon,lat,u,v,0.02,0.02,2,2,v/4 km rel wind 50 m~/s~/deg,tl/Sally 1,-84,30,ll/a),-90,30,ll/\
7,6,14.5,20.5,fg/,lx/,ly/-91,-82,2,24,31,2,ax/lon2t,lat2t,sfrac2t,2,$slim1,$slim2,$sdlim,300,f/lon2t,lat2t,sfrac2t,k,.5,0,$slim1,$slim2,$sdlim,c/lon2t,lat2t,u2t,v2t,0.02,0.02,2,2,v/Sally 2,-84,30,ll/b),-90,30,ll/\
7,6,23.1,20.5,fg/,lx/,ly/-91,-82,2,24,31,2,ax/lon3t,lat3t,sfrac3t,2,$slim1,$slim2,$sdlim,300,f/r,fp/lon3t,lat3t,sfrac3t,k,.5,0,$slim1,$slim2,$sdlim,c/lon3t,lat3t,u3t,v3t,0.02,0.02,2,2,v/Sally 3,-84,30,ll/c),-90,30,ll/\
\
7,6,6,13.25,fg/latitude (deg),ly/,lx/-91,-82,2,24,31,2,ax/lon,lat,ii,2,0,30,5,300,f/lon,lat,ii,k,.5,0,0,30,5,c/lon,lat,u,v,0.02,0.02,2,2,v/,tl/Sally 1,-84,30,ll/d),-90,30,ll/\
7,6,14.5,13.25,fg/,lx/,ly/-91,-82,2,24,31,2,ax/lon2t,lat2t,ii2t,2,0,30,5,300,f/lon2t,lat2t,ii2t,k,.5,0,0,30,5,c/lon2t,lat2t,u2t,v2t,0.02,0.02,2,2,v/Sally 2,-84,30,ll/e),-90,30,ll/\
7,6,23.1,13.25,fg/,lx/,ly/-91,-82,2,24,31,2,ax/lon3t,lat3t,ii3t,2,0,30,5,300,f/r,fp/lon3t,lat3t,ii3t,k,.5,0,0,30,5,c/lon3t,lat3t,u3t,v3t,0.02,0.02,2,2,v/Sally 3,-84,30,ll/f),-90,30,ll/\
\
7,6,6,6,fg/latitude (deg),ly/longitude (deg),lx/-91,-82,2,24,31,2,ax/lon,lat,dcin,2,-20,12,4,300,f/lon,lat,dcin,k,.5,0,-20,12,4,c/lon,lat,u,v,0.02,0.02,2,2,v/Sally 1,-84,30,ll/h),-90,30,ll/\
7,6,14.5,6,fg/longitude (deg),lx/,ly/-91,-82,2,24,31,2,ax/lon2t,lat2t,dcin2t,2,-20,12,4,300,f/lon2t,lat2t,dcin2t,k,.5,0,-20,12,4,c/lon2t,lat2t,u2t,v2t,0.02,0.02,2,2,v/Sally 2,-84,30,ll/i),-90,30,ll/\
7,6,23.1,6,fg/longitude (deg),lx/,ly/-91,-82,2,24,31,2,ax/lon3t,lat3t,dcin3t,2,-20,12,4,300,f/r,fp/lon3t,lat3t,dcin3t,k,.5,0,-20,12,4,c/lon3t,lat3t,u3t,v3t,0.02,0.02,2,2,v/Sally 3,-84,30,ll/j),-90,30,ll/\
" figure1c

cdfmerge tmp1 '' tmp2 '2t' tmp3 '3t' |\
        goplot "12,fs/\
7,6,6,20.5,fg/latitude (deg),ly/,lx/-90,-82,2,24,31,2,ax/lon,lat,sfrac,2,$slim1,$slim2,$sdlim,300,f/lon,lat,sfrac,k,0.5,0,$slim1,$slim2,$sdlim,c/lon,lat,mflux,c,1,0,0.1,0.2,0.1,c/lon,lat,mflux,c,2,0,0.2,0.4,0.1,c/lon,lat,mflux,c,3,0,0.3,0.6,0.1,c/lon,lat,u,v,0.02,0.02,2,2,v/lon.m,lat.m,r,0.2,m/Sally 1,-84,30,ll/a) saturation fraction,-89,30,ll/\
7,6,14.5,20.5,fg/,lx/,ly/-91,-84,2,25,31,2,ax/lon2t,lat2t,sfrac2t,2,$slim1,$slim2,$sdlim,300,f/lon2t,lat2t,sfrac2t,k,.5,0,$slim1,$slim2,$sdlim,c/lon2t,lat2t,mflux2t,c,1,0,0.1,0.2,0.1,c/lon2t,lat2t,mflux2t,c,2,0,0.2,0.4,0.1,c/lon2t,lat2t,mflux2t,c,3,0,0.3,0.6,0.1,c/lon2t,lat2t,u2t,v2t,0.02,0.02,2,2,v/lon.m2t,lat.m2t,r,0.2,m/Sally 2,-86,30,ll/b) saturation fraction,-90,30,ll/4 km storm relative wind~, scale: 50 m~/s~/deg,tl/\
7,6,23.1,20.5,fg/,lx/,ly/-91,-84,2,25,31,2,ax/lon3t,lat3t,sfrac3t,2,$slim1,$slim2,$sdlim,300,f/r,fp/lon3t,lat3t,sfrac3t,k,.5,0,$slim1,$slim2,$sdlim,c/lon3t,lat3t,mflux3t,c,1,0,0.1,0.2,0.1,c/lon3t,lat3t,mflux3t,c,2,0,0.2,0.4,0.1,c/lon3t,lat3t,mflux3t,c,3,0,0.3,0.6,0.1,c/lon3t,lat3t,u3t,v3t,0.02,0.02,2,2,v/lon.m3t,lat.m3t,r,0.2,m/Sally 3,-86,30,ll/c) saturation fraction,-90,30,ll/\
\
7,6,6,13.25,fg/latitude (deg),ly/,lx/-90,-82,2,24,31,2,ax/lon,lat,ii,2,0,30,5,300,f/lon,lat,ii,k,.5,0,0,30,5,c/lon,lat,mflux,c,1,0,0.1,0.2,0.1,c/lon,lat,mflux,c,2,0,0.2,0.4,0.1,c/lon,lat,mflux,c,3,0,0.3,0.6,0.1,c/lon,lat,u,v,0.02,0.02,2,2,v/,tl/Sally 1,-84,30,ll/d) instability index,-89,30,ll/\
7,6,14.5,13.25,fg/,lx/,ly/-91,-84,2,25,31,2,ax/lon2t,lat2t,ii2t,2,0,30,5,300,f/lon2t,lat2t,ii2t,k,.5,0,0,30,5,c/lon2t,lat2t,mflux2t,c,1,0,0.1,0.2,0.1,c/lon2t,lat2t,mflux2t,c,2,0,0.2,0.4,0.1,c/lon2t,lat2t,mflux2t,c,3,0,0.3,0.6,0.1,c/lon2t,lat2t,u2t,v2t,0.02,0.02,2,2,v/Sally 2,-86,30,ll/e) instability index,-90,30,ll/\
7,6,23.1,13.25,fg/,lx/,ly/-91,-84,2,25,31,2,ax/lon3t,lat3t,ii3t,2,0,30,5,300,f/r,fp/lon3t,lat3t,ii3t,k,.5,0,0,30,5,c/lon3t,lat3t,mflux3t,c,1,0,0.1,0.2,0.1,c/lon3t,lat3t,mflux3t,c,2,0,0.2,0.4,0.1,c/lon3t,lat3t,mflux3t,c,3,0,0.3,0.6,0.1,c/lon3t,lat3t,u3t,v3t,0.02,0.02,2,2,v/Sally 3,-86,30,ll/J~/K~/kg,-83,31.35,ll/f) instability index,-90,30,ll/\
\
7,6,6,6,fg/latitude (deg),ly/longitude (deg),lx/-90,-82,2,24,31,2,ax/lon,lat,dcin,2,-20,12,4,300,f/lon,lat,dcin,k,.5,0,-20,12,4,c/lon,lat,mflux,c,1,0,0.1,0.2,0.1,c/lon,lat,mflux,c,2,0,0.2,0.4,0.1,c/lon,lat,mflux,c,3,0,0.3,0.6,0.1,c/lon,lat,u,v,0.02,0.02,2,2,v/Sally 1,-84,30,ll/h) DCIN,-89,30,ll/\
7,6,14.5,6,fg/longitude (deg),lx/,ly/-91,-84,2,25,31,2,ax/lon2t,lat2t,dcin2t,2,-20,12,4,300,f/lon2t,lat2t,dcin2t,k,.5,0,-20,12,4,c/lon2t,lat2t,mflux2t,c,1,0,0.1,0.2,0.1,c/lon2t,lat2t,mflux2t,c,2,0,0.2,0.4,0.1,c/lon2t,lat2t,mflux2t,c,3,0,0.3,0.6,0.1,c/lon2t,lat2t,u2t,v2t,0.02,0.02,2,2,v/Sally 2,-86,30,ll/i) DCIN,-90,30,ll/\
7,6,23.1,6,fg/longitude (deg),lx/,ly/-91,-84,2,25,31,2,ax/lon3t,lat3t,dcin3t,2,-20,12,4,300,f/r,fp/lon3t,lat3t,dcin3t,k,.5,0,-20,12,4,c/lon3t,lat3t,mflux3t,c,1,0,0.1,0.2,0.1,c/lon3t,lat3t,mflux3t,c,2,0,0.2,0.4,0.1,c/lon3t,lat3t,mflux3t,c,3,0,0.3,0.6,0.1,c/lon3t,lat3t,u3t,v3t,0.02,0.02,2,2,v/Sally 3,-86,30,ll/J~/K~/kg,-83,31.35,ll/j) DCIN,-90,30,ll/\
" figure1d


cdfmerge tmp1 '' tmp2 '2t' tmp3 '3t' |\
        goplot "12,fs/\
7,6,6,20.5,fg/latitude (deg),ly/,lx/-90,-82,2,24,31,2,ax/lon,lat,sfrac,2,$slim1,$slim2,$sdlim,300,f/lon,lat,sfrac,k,0.5,0,$slim1,$slim2,$sdlim,c/lon,lat,mflux,c,1,0,0.1,0.2,0.1,c/lon,lat,mflux,c,2,0,0.2,0.4,0.1,c/lon,lat,mflux,c,3,0,0.3,0.6,0.1,c/lon,lat,u,v,0.02,0.02,2,2,v/lon.m,lat.m,r,0.2,m/\
7,6,14.5,20.5,fg/,lx/,ly/-91,-84,2,25,31,2,ax/lon2t,lat2t,sfrac2t,2,$slim1,$slim2,$sdlim,300,f/lon2t,lat2t,sfrac2t,k,.5,0,$slim1,$slim2,$sdlim,c/lon2t,lat2t,mflux2t,c,1,0,0.1,0.2,0.1,c/lon2t,lat2t,mflux2t,c,2,0,0.2,0.4,0.1,c/lon2t,lat2t,mflux2t,c,3,0,0.3,0.6,0.1,c/lon2t,lat2t,u2t,v2t,0.02,0.02,2,2,v/lon.m2t,lat.m2t,r,0.2,m/4 km storm relative wind~, scale: 50 m~/s~/deg,tl/\
7,6,23.1,20.5,fg/,lx/,ly/-91,-84,2,25,31,2,ax/lon3t,lat3t,sfrac3t,2,$slim1,$slim2,$sdlim,300,f/r,fp/lon3t,lat3t,sfrac3t,k,.5,0,$slim1,$slim2,$sdlim,c/lon3t,lat3t,mflux3t,c,1,0,0.1,0.2,0.1,c/lon3t,lat3t,mflux3t,c,2,0,0.2,0.4,0.1,c/lon3t,lat3t,mflux3t,c,3,0,0.3,0.6,0.1,c/lon3t,lat3t,u3t,v3t,0.02,0.02,2,2,v/lon.m3t,lat.m3t,r,0.2,m/\
\
7,6,6,13.25,fg/latitude (deg),ly/,lx/-90,-82,2,24,31,2,ax/lon,lat,ii,2,0,30,5,300,f/lon,lat,ii,k,.5,0,0,30,5,c/lon,lat,mflux,c,1,0,0.1,0.2,0.1,c/lon,lat,mflux,c,2,0,0.2,0.4,0.1,c/lon,lat,mflux,c,3,0,0.3,0.6,0.1,c/lon,lat,u,v,0.02,0.02,2,2,v/,tl/\
7,6,14.5,13.25,fg/,lx/,ly/-91,-84,2,25,31,2,ax/lon2t,lat2t,ii2t,2,0,30,5,300,f/lon2t,lat2t,ii2t,k,.5,0,0,30,5,c/lon2t,lat2t,mflux2t,c,1,0,0.1,0.2,0.1,c/lon2t,lat2t,mflux2t,c,2,0,0.2,0.4,0.1,c/lon2t,lat2t,mflux2t,c,3,0,0.3,0.6,0.1,c/lon2t,lat2t,u2t,v2t,0.02,0.02,2,2,v/\
7,6,23.1,13.25,fg/,lx/,ly/-91,-84,2,25,31,2,ax/lon3t,lat3t,ii3t,2,0,30,5,300,f/r,fp/lon3t,lat3t,ii3t,k,.5,0,0,30,5,c/lon3t,lat3t,mflux3t,c,1,0,0.1,0.2,0.1,c/lon3t,lat3t,mflux3t,c,2,0,0.2,0.4,0.1,c/lon3t,lat3t,mflux3t,c,3,0,0.3,0.6,0.1,c/lon3t,lat3t,u3t,v3t,0.02,0.02,2,2,v/\
\
7,6,6,6,fg/latitude (deg),ly/longitude (deg),lx/-90,-82,2,24,31,2,ax/lon,lat,dcin,2,-20,12,4,300,f/lon,lat,dcin,k,.5,0,-20,12,4,c/lon,lat,mflux,c,1,0,0.1,0.2,0.1,c/lon,lat,mflux,c,2,0,0.2,0.4,0.1,c/lon,lat,mflux,c,3,0,0.3,0.6,0.1,c/lon,lat,u,v,0.02,0.02,2,2,v/\
7,6,14.5,6,fg/longitude (deg),lx/,ly/-91,-84,2,25,31,2,ax/lon2t,lat2t,dcin2t,2,-20,12,4,300,f/lon2t,lat2t,dcin2t,k,.5,0,-20,12,4,c/lon2t,lat2t,mflux2t,c,1,0,0.1,0.2,0.1,c/lon2t,lat2t,mflux2t,c,2,0,0.2,0.4,0.1,c/lon2t,lat2t,mflux2t,c,3,0,0.3,0.6,0.1,c/lon2t,lat2t,u2t,v2t,0.02,0.02,2,2,v/\
7,6,23.1,6,fg/longitude (deg),lx/,ly/-91,-84,2,25,31,2,ax/lon3t,lat3t,dcin3t,2,-20,12,4,300,f/r,fp/lon3t,lat3t,dcin3t,k,.5,0,-20,12,4,c/lon3t,lat3t,mflux3t,c,1,0,0.1,0.2,0.1,c/lon3t,lat3t,mflux3t,c,2,0,0.2,0.4,0.1,c/lon3t,lat3t,mflux3t,c,3,0,0.3,0.6,0.1,c/lon3t,lat3t,u3t,v3t,0.02,0.02,2,2,v/\
" figure1e


epstopdf figure1b.ps
ps2eps -f -B --size=40x40 figure1b.ps

epstopdf figure1c.ps
ps2eps -f -B --size=40x40 figure1c.ps

epstopdf figure1d.ps
ps2eps -f -B --size=40x40 figure1d.ps

epstopdf figure1e.ps
ps2eps -f -B --size=40x40 figure1e.ps

