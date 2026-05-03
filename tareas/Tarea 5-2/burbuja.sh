# Encabezado del archivo de datos
# echo "#N bubble burbuja InsertSort" > datos.txt

# Compilar los archivos de cada método
gfortran ./tareas/Tarea\ 5-2/aleatorios.f90 -o aleatorios
gfortran ./clases/Método de la Burbuja/bubble.f90 -o bubble
gfortran ./clases/Método de la Burbuja/burbuja.f90 -o burbuja
gfortran ./tareas/Tarea\ 5-2/InsertSort.f90 -o InsertSort

for N in 1000 2500 5000 7500 10000 17500 25000 37500 50000 75000 87500 100000 125000
do
    echo "Generando y ordenando N=$N elementos"

    # Generamos los N numeros aleatorios y los guardamos
    echo $N | ./aleatorios $N > temporal.txt

    # Ordenamos con los 3 métodos los mismos numeros aleatorios
    t1=$(/usr/bin/time -f "%e" ./bubble < temporal.txt 2>&1 > /dev/null)
    t2=$(/usr/bin/time -f "%e" ./burbuja < temporal.txt 2>&1 > /dev/null)
    t3=$(/usr/bin/time -f "%e" ./InsertSort < temporal.txt 2>&1 > /dev/null)

    echo "$N $t1 $t2 $t3" >> datos.txt
done

# Graficar archivo de datos con gnuplot
gnuplot ./tareas/Tarea\ 5-2/burbuja.gnu