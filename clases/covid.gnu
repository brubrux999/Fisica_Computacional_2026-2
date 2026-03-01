set multiplot layout 1,2 title "Casos de covid en Mexico"

# Primer grafico
set title "Casos diarios confirmados"
set xlabel "Dia"
set ylabel "Casos"
plot "nacional.dat" using 1:2

# Segundo grafico
set title "Casos diarios acumulados"
set xlabel "Dia"
set ylabel "Casos"
plot "nacional_total.dat" using 1:2

unset multiplot
pause -1