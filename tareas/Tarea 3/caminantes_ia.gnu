set title "Desplazamiento Cuadratico Medio"
set xlabel "Tiempo (pasos)"
set ylabel "<x^2>"
set grid

plot "msd.dat" using 1:2 with lines lw 2 title "MSD"
pause -1