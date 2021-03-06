set term post portrait  enhanced color "Helvetica,18"
set output 'BAND.eps'
#set title "Energy band BiSi110 model" font "Curier Bold,18,"

pi2= 4*atan(1) * 2
    KINIT=       0.000000 ; KNAME_INIT="M"
       K2=       0.660352 ; KNAME_2   ="K"
       K3=       1.981056 ; KNAME_3   ="{/Symbol \G}"
       K4=       3.301760 ; KNAME_4   ="K'"
     KEND=       3.962112 ; KNAME_END ="M"
#set xtics (KNAME_INIT KINIT,  KNAME_2 K2, KNAME_3 K3, KNAME_4 K4, KNAME_END KEND) nomirror
#set xtics (KNAME_3 K3, KNAME_4 K4, KNAME_END KEND) nomirror
 set size nosquare 1,0.55 ;
#set xrange[KINIT:KEND]
#set yrange[-1.:2.]
set ytics -1,1,2 nomirror
set ylabel "Energy (eV)" font "Helvetica,24" offset 1,0
#set arrow from 0,0 to KEND,0 nohead lt 3 lw .1 lc rgb 'black'
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
set key right top samplen 1  spacing 1.5  font "Helvetica, 15"
set view 0,0
set palette defined (-10 cup1,0 'white', 10 cdn1 )
set cbrange [-10:10]
 set multiplot
 set origin 0,0
 set size nosquare 0.8,0.55
 s=.4

 result_dft='DOS_atom_projected.dat'
 result_tba='band_structure_TBA.dat'
 target_dft='band_structure_DFT.dat'

 result_brc='BERRYCURV.17-18.dat'

# plot result_dft          u 1:2        w l       lw  .1          lc rgb 'gray'  ti "DFT",\
#      target_dft          u 1:2:($3)*s w  p pt 7 lw  .1  ps vari lc rgb 'black' ti "TARGET",\
#      result_tba          u 1:2        w l       lw  .1          lc rgb 'green' ti "TBA",\
#      result_tba          u 1:2:($3)*s w p     pt 6     ps vari  lc rgb 'red'    ti "TBA-d_{z^2}",\
#      result_tba          u 1:2:($4+$5)*s w p  pt 7     ps vari  lc rgb 'blue'    ti "TBA-d_{xy+x2}"

 splot result_brc          u 1:2:($6)      w p ps 1.   pt 7 lc palette  ti "TBA_{BC}",\
