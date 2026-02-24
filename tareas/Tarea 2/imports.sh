# Cortar las columnas 14 (pesos) y 26 (precios) del archivo "imports-85.data" y mediante ">" mandar el output al archivo de texto "imports"
cut -d" " -f14,26 ../../clases/imports-85.data > imports85

# Ordenar numeraicamente la primer columna (pesos) del archivo "imports"
sort -n -k1 -o imports85 imports85