x=$2
for num in {1..100}
do
 x0=$x
 x=`echo "c($x)+s($x)"| bc -l` 
 y=`echo "$x0-$x"| bc -l`  
 z=`echo "sqrt($y^2)" | bc -l`
 w=`echo " $z < $1" | bc -l`
 if [ $w -eq 1 ] 
 then
 break
 fi
done
echo $num $x

