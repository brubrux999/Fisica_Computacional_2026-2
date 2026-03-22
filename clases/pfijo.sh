x=100.0
for num in {1..100}
do
 x=`echo "c($x)+s($x)"| bc -l`
 echo $num $x
done

