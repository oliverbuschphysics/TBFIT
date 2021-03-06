set term post portrait  enhanced color "Helvetica,18"
set output 'BAND.eps'
#set title "Energy band MoTe2" font "Curier Bold,18,"
#generated from BAND-VASP.sh 

kinit=0.00000;kend=4.25466;
 k2=1.48065
 k3=2.33551
 k4=4.04522
 kname_2="M"
 kname_3="K"
 kname_4="G"
 set xtics ( "{/Symbol \G}" kinit,  kname_2 k2, kname_3 k3, kname_4 k4, "A" kend) nomirror
 set size nosquare 1,0.55 ;
 set xrange[kinit:kend]
 set yrange[-20 :10 ]
set ytics -20,5,10 nomirror
set ylabel "Energy (eV)" font "Helvetica,24" offset 1,0
set arrow from 0,0 to kend,0 nohead lt 3 lw .1 lc rgb 'black'
cup1='#1e90ff'    ##dogger blue
cup2='#5f9ea0'    ##Cadet Blue
cup3='#b22222'    ##Firebrick
cup4='#e6e6fa'    ##Lavender
cup5='#2e8b57'    ##Sea Green
cup6='#f4a460'    ##Sandy Brown
cdn1='#ff4500'    ##Orange Red
cdn2='#bdb76b'    ##dark khaki
cdn3='#ffc0cb'    ##Pink
cdn4='#8a2be2'    ##Blue Violet
cdn5='#ffd700'    ##Gold
cdn6='#cdc9c9'    ##Snow 3
zecolor='#00ced1'
set key at kend,-10 samplen 1  spacing 1  font "Helvetica, 15"

a_in=0.0;a_fi=6.55
b_in=5.0;b_fi=0.6  
f_in(x) = a_in * x + b_in
f_fi(x) = a_fi * x + b_fi

set multiplot
set origin 0,0
set size nosquare 0.8,0.55

#for noncollinear
 plot "DFT_BAND.dat"           u 1:2 w lp pt 6 lw 1    ps .3   lc rgb 'gray'  ti "DFT",\
      "band_structure_DFT.dat"    u 1:2:($3)     w  p pt 7 lw 1.5  ps vari lc rgb 'black' ti "WEIGHT",\
      "band_structure_TBA.dat"    u 1:2          w lp pt 7 lw 1.5  ps  1   lc rgb cup1    ti "TBA",\
      "band_structure_TBA.dat"    u 1:2          w l       lw 1.5          lc rgb cdn1    noti

#for non-mag or collinear
#plot "DOS_atom_projected_up.dat" u 1:2 w lp pt 6 lw 1    ps .3   lc rgb 'gray'  ti "DFT",\
#     "band_structure_DFT.dat"    u 1:2:($3)     w  p pt 7 lw 1.5  ps vari lc rgb 'black' ti "TARGET",\
#     "band_structure_TBA_up.dat"    u 1:2          w lp pt 7 lw  .5  ps  1   lc rgb cup1    ti "TBA-up",\
#     "band_structure_TBA_dn.dat"    u 1:2          w lp pt 6 lw  .5  ps  1   lc rgb cdn1    ti "TBA-dn",\


#set origin 0.7,0
#set size nosquare 0.35,0.55
#set xtics ("DOS (a.u.)" 1.5)
#unset ytics
#unset ylabel
#plot "DOS_TB_projected.dat"   u 2:1 w lp pt 6 lw 1    ps .1   lc rgb cup1  ti "DOS-TB",\
