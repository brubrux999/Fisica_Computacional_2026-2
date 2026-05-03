x=0.001
r=4.0  #1.1,2.1,3.1,3.5,4.0
for num in {1..200}
do
 x=`echo "$r*$x*(1-$x)"| bc -l`
 echo $x
done

