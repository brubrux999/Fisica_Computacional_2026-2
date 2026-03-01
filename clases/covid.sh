# Descargar el archivo csv desde stokes con scp
scp grupo2026@stokes.fciencias.unam.mx:Casos_Diarios* .

# Con awk, imprimir en cada linea cada columna de la linea final del csv (ignorando las 4 primeras no numericas)
awk -F"," 'END {for(i=4; i<=NF; i++) print i-3, $i}' Casos_Diarios_Estado_Nacional_Confirmados_20220315.csv > nacional.dat

# Con awk, calcular la suma acumulada e imprimirla en columas
awk -F" " '{total+=$2; print $1, total}' nacional.dat > nacional_total.dat

# Graficar con gnuplot
gnuplot covid.gnu
