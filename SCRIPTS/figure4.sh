#!/bin/sh

file=sally1.cdf
lon1=-84.5; lon2=-83.5; lat1=27; lat2=28; #earlier
lon1=-85; lon2=-84; lat1=27; lat2=28; #Dave
cat $file  | cdfextr absvort mflux mr |\
cdfrdim lon $lon1 $lon2 | cdfrdim lat $lat1 $lat2 > tmp1
cat $file  | cdfextr absvort mflux mr |\
cdfrdim lon -100 -20 | cdfrdim lat 0  50 > tmp1a
lon1=-86.5; lon2=-85.5; lat1=27.5; lat2=28.5; #Center of rotation
cat $file  | cdfextr absvort mflux mr |\
cdfrdim lon $lon1 $lon2 | cdfrdim lat $lat1 $lat2 > tmp1b

file=sally2.cdf
lon1=-86; lon2=-85; lat1=27.5; lat2=28.5; # Dave
cat $file  | cdfextr absvort mflux mr |\
cdfrdim lon $lon1 $lon2 | cdfrdim lat $lat1 $lat2 > tmp2
cat $file  | cdfextr absvort mflux mr |\
cdfrdim lon -100 -20 | cdfrdim lat 0  50 > tmp2a
lon1=-87.5; lon2=-86.5; lat1=27.5; lat2=28.5; #Center of roatation
cat $file  | cdfextr absvort mflux mr |\
cdfrdim lon $lon1 $lon2 | cdfrdim lat $lat1 $lat2 > tmp2b

file=sally3.cdf
lon1=-87; lon2=-86; lat1=28; lat2=29; # Dave -87.00    -86.00     28.00     29.00
cat $file  | cdfextr absvort mflux mr |\
cdfrdim lon $lon1 $lon2 | cdfrdim lat $lat1 $lat2 > tmp3
cat $file  | cdfextr absvort mflux mr |\
cdfrdim lon -100 -20 | cdfrdim lat 0  50 > tmp3a
lon1=-88; lon2=-87; lat1=28; lat2=29; #Center of roatation
cat $file  | cdfextr absvort mflux mr |\
cdfrdim lon $lon1 $lon2 | cdfrdim lat $lat1 $lat2 > tmp3b

cdfmerge tmp1 '1' tmp1a '1a' tmp1b '1b' \
	 tmp2 '2' tmp2a '2a' tmp2b '2b' \
	 tmp3 '3' tmp3a '3a' tmp3b '3b' |\
goplot "12,fs/7,6,6,6,fg/-0.05,0.45,0.1,0,16,2,ax/abs. vort. (1~/ks),lx/height (km),ly/absvort1a,z1a,b,2,p/absvort1b,z1b,g,2,p/absvort1,z1,r,2,p/a),0.4,14,ll/\
12,fs/7,6,14.3,6,fg/-0.05,0.45,0.1,0,16,2,ax/abs. vort. (1~/ks),lx/,ly/absvort2a,z2a,b,2,p/absvort2b,z2b,g,2,p/absvort2,z2,r,2,p/b),0.4,14,ll/\
12,fs/7,6,22.6,6,fg/-0.05,0.45,0.1,0,16,2,ax/abs. vort. (1~/ks),lx/,ly/absvort3a,z3a,b,2,p/absvort3b,z3b,g,2,p/absvort3,z3,r,2,p/c),0.4,14,ll/\
" figure4

cdfmerge tmp1 '1' tmp1a '1a' tmp1b '1b' \
         tmp2 '2' tmp2a '2a' tmp2b '2b' \
         tmp3 '3' tmp3a '3a' tmp3b '3b' |\
goplot "12,fs/7,6,6,6,fg/-0.05,0.45,0.1,0,16,2,ax/abs. vort. (1~/ks),lx/height (km),ly/absvort1b,z1b,b,2,p/absvort1,z1,r,2,p/a),0.4,14,ll/\
12,fs/7,6,14.3,6,fg/-0.05,0.45,0.1,0,16,2,ax/abs. vort. (1~/ks),lx/,ly/absvort2b,z2b,b,2,p/absvort2,z2,r,2,p/b),0.4,14,ll/\
12,fs/7,6,22.6,6,fg/-0.05,0.45,0.1,0,16,2,ax/abs. vort. (1~/ks),lx/,ly/absvort3b,z3b,b,2,p/absvort3,z3,r,2,p/c),0.4,14,ll/\
" figure4fff


cdfmerge tmp1 '1' tmp1a '1a' tmp1b '1b' \
         tmp2 '2' tmp2a '2a' tmp2b '2b' \
         tmp3 '3' tmp3a '3a' tmp3b '3b' |\
goplot "12,fs/7,6,6,6,fg/-0.05,0.45,0.1,0,16,2,ax/abs. vort. (1~/ks),lx/height (km),ly/absvort1a,z1a,b,2,p/absvort1,z1,r,2,p/a),0.4,14,ll/\
12,fs/7,6,14.3,6,fg/-0.05,0.45,0.1,0,16,2,ax/abs. vort. (1~/ks),lx/,ly/absvort2a,z2a,b,2,p/absvort2,z2,r,2,p/b),0.4,14,ll/\
12,fs/7,6,22.6,6,fg/-0.05,0.45,0.1,0,16,2,ax/abs. vort. (1~/ks),lx/,ly/absvort3a,z3a,b,2,p/absvort3,z3,r,2,p/c),0.4,14,ll/\
" figure4c


cdfmerge tmp1 '1' tmp1a '1a' tmp1b '1b' \
         tmp2 '2' tmp2a '2a' tmp2b '2b' \
         tmp3 '3' tmp3a '3a' tmp3b '3b' |\
goplot "12,fs/7,6,6,6,fg/-0.05,0.45,0.1,0,16,2,ax/mass flux (kg~/m^2~/s),lx/height (km),ly/mflux1a,z1a,b,2,p/mflux1b,z1b,g,2,p/mflux1,z1,r,2,p/a),0.4,14,ll/\
12,fs/7,6,14.3,6,fg/-0.05,0.45,0.1,0,16,2,ax/mass flux (kg~/m^2~/s),lx/,ly/mflux2a,z2a,b,2,p/mflux2b,z2b,g,2,p/mflux2,z2,r,2,p/b),0.4,14,ll/\
12,fs/7,6,22.6,6,fg/-0.05,0.45,0.1,0,16,2,ax/mass flux(kg~/m^2~/s),lx/,ly/mflux3a,z3a,b,2,p/mflux3b,z3b,g,2,p/mflux3,z3,r,2,p/c),0.4,14,ll/\
" figure4a

cdfmerge tmp1 '1' tmp1a '1a' tmp1b '1b' \
         tmp2 '2' tmp2a '2a' tmp2b '2b' \
         tmp3 '3' tmp3a '3a' tmp3b '3b' |\
goplot "12,fs/7,6,6,6,fg/0.0,20,4,0,16,2,ax/mixing ratio (g~/kg),lx/height (km),ly/mr1a,z1a,b,2,p/mr1b,z1b,g,2,p/mr1,z1,r,2,p/a),0.4,14,ll/\
12,fs/7,6,14.3,6,fg/0,20,4,0,16,2,ax/mixing ratio (g~/kg),lx/,ly/mr2a,z2a,b,2,p/mr2b,z2b,g,2,p/mr2,z2,r,2,p/b),0.4,14,ll/\
12,fs/7,6,22.6,6,fg/0.0,20,4,0,16,2,ax/mixing ratio (g~/kg),lx/,ly/mr3a,z3a,b,2,p/mr3b,z3b,g,2,p/mr3,z3,r,2,p/c),0.4,14,ll/\
" figure4aM


cdfmerge tmp1 '1' tmp1a '1a' tmp1b '1b' \
         tmp2 '2' tmp2a '2a' tmp2b '2b' \
         tmp3 '3' tmp3a '3a' tmp3b '3b' |\
goplot "12,fs/7,6,6,6,fg/-0.05,0.45,0.1,0,16,2,ax/mass flux (kg~/m^2~/s),lx/height (km),ly/mflux1a,z1a,b,2,p/mflux1,z1,r,2,p/a),0.4,14,ll/\
12,fs/7,6,14.3,6,fg/-0.05,0.45,0.1,0,16,2,ax/mass flux (kg~/m^2~/s),lx/,ly/mflux2a,z2a,b,2,p/mflux2,z2,r,2,p/b),0.4,14,ll/\
12,fs/7,6,22.6,6,fg/-0.05,0.45,0.1,0,16,2,ax/mass flux(kg~/m^2~/s),lx/,ly/mflux3a,z3a,b,2,p/mflux3,z3,r,2,p/c),0.4,14,ll/\
" figure4d


epstopdf figure4.ps
ps2eps -f -B --size=40x40 figure4.ps

epstopdf figure4a.ps
ps2eps -f -B --size=40x40 figure4a.ps

epstopdf figure4aM.ps
ps2eps -f -B --size=40x40 figure4aM.ps


epstopdf figure4c.ps
ps2eps -f -B --size=40x40 figure4c.ps

epstopdf figure4d.ps
ps2eps -f -B --size=40x40 figure4d.ps 

epstopdf figure4fff.ps
ps2eps -f -B --size=40x40 figure4fff.ps

