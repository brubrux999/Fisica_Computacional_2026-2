fit m*x+z 'imports85' using 1:2 via m,z
fit a*x**2 +b*x +c 'imports85' using 1:2 via a,b,c
set title 'Peso vs Precio del archivo imports-85.data'
set xlabel 'Peso'
set ylabel 'Precio'
set grid x y
plot 'imports85' title 'Puntos de datos', m*x+z title "Recta de minimos cuadrados", a*x**2 +b*x +c title "Parabola de minimos cuadrados"
pause -1