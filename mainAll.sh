
function plotN {
  echo $name $vx $vy

  P="/home/pi/Desktop/onrPLOTS/SCRIPTS"
  mkdir $name
  cat CDF/${name}.cdf | $P/avapsdryent.sh |\
	  $P/avapspv.sh | avapsvtend.sh -3.8 1.8 > ${name}/${name}.cdf
  cat CDF/sally2.cdf | $P/avapsdryent.sh |\
          $P/avapspv.sh | avapsvtend.sh -2.3 1.2 > sally1/sally2.cdf
  cat CDF/sally3.cdf | $P/avapsdryent.sh |\
          $P/avapspv.sh | avapsvtend.sh -2.1 0.9 > sally1/sally3.cdf

 cd $name 
  $P/figure1.sh $vx $vy $name $NAME $slim1 $slim2 $sdlim  \
         $mlim1 $mlim2 $mdlim 4 $lon1 $lon2 $lat1 $lat2 
   $P/figure2.sh $vx $vy $name $NAME $slim1 $slim2 $sdlim  \
         $mlim1 $mlim2 $mdlim 4 $lon1 $lon2 $lat1 $lat2
   $P/figure3.sh
   $P/figure4.sh
  cd ..
} # end function plotN

# LIMITS for contour plots
# absvort
lim1=0.0; lim2=0.35; dlim=0.05
# mflux
mlim1=-0.05; mlim2=0.25; mdlim=0.05
# dcin
dlim1=-20; dlim2=12; ddlim=4
# pv
pvlim1=0.0; pvlim2=2.5; pvdlim=0.5
#ii
ilim1=0; ilim2=30; idlim=5
#sfrac
slim1=0.7; slim2=0.95; sdlim=0.05
# delta pv
dvlim1=-1; dvlim2=2.5; dvdlim=0.5
# cape
clim1=0; clim2=3000; cdlim=500



name='sally1'; NAME='Sally1'; vx=-3.8; vy=1.8; lon1=-84.5; lon2=-83.5; lat1=27; lat2=28; plotN
name="sally2"; NAME='Sally2'; vx=-2.3; vy=1.2; lon1=-86; lon2=-85; lat1=27.5; lat2=28.5; plotN
name="sally3"; NAME='Sally3'; vx=-2.1; vy=0.9; lon1=-87; lon2=-86; lat1=28; lat2=29; plotN

