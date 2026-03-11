set title "Caminantes aleatorios"
set xlabel "Numero de paso"
set ylabel "Distancia recorrida"

plot "caminantes.dat" using 1:2 with lines lc rgb "gray" title "Caminantes", \
    for [i=3:31] "caminantes.dat" using 1:i with lines lc rgb "gray" notitle, \
    "caminantes.dat" using 1:32 with lines lw 3 lc rgb "red" title "Desplazamiento Cuadratico Medio"
pause -1