x=0.100
r=1.00
for i in {1..400}
do
r=`echo "$r + 0.01" | bc -l`

for num in {1..300}
do
 x=`echo "$r*$x*(1-$x)"| bc -l`
 if [ $num -gt 200 ]
 then
     echo $r $x
 fi
done
done
