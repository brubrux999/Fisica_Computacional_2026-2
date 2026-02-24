# plot_imports85.gp
set datafile separator " "
set xlabel "Peso"
set ylabel "Precio"
set title "Precio vs Peso con ajuste lineal y cuadrático"
set key outside

# Definiciones de modelos
f(x) = a*x + b
g(x) = c*x**2 + d*x + e

# Ajustes por mínimos cuadrados (fit)
fit f(x) 'imports85_ia' using 1:2 via a,b
fit g(x) 'imports85_ia' using 1:2 via c,d,e

# Dibujar datos y ajustes
plot 'imports85_ia' using 1:2 with points pt 7 ps 1.2 title 'Datos', \
     f(x) with lines lw 2 title sprintf("Recta: y=%.3f x + %.3f", a, b), \
     g(x) with lines lw 2 title sprintf("Parábola: y=%.3f x^2 + %.3f x + %.3f", c, d, e)

pause -1