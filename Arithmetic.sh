read -p "Enter first input:" a
read -p "Enter second input:" b
read -p "Enter third input:" c

declare -A computation

function computation1(){
echo $(($1+($2*$3)))
}
output1="$(computation1 $a $b $c)"

function computation2(){
echo $((($1*$2)+$3))
}
output2="$(computation2 $a $b $c)"

function computation3(){
echo $(($3+($1/$2)))
}
output3="$(computation3 $a $b $c)"

function computation4(){
echo $((($1%$2)+$3))
}
output4="$(computation4 $a $b $c)"

echo "Result of a+b*c expression is" $output1
echo "Result of a*b+c expression is" $output2
echo "Result of c+a/b expression is" $output3
echo "Result of a%b+c expression is" $output4





computation[1]=$output1
computation[2]=$output2
computation[3]=$output3
computation[4]=$output4

echo "Values are in dictionary " ${computation[@]}

declare -a ComputationArray

for i in "${computation[@]}"
do
    ComputationArray+=($i)
done
 echo "The values are read from the dictionary to array" ${ComputationArray[@]}

for (( i = 0; i <= 3 ; i++ ))
do
   for (( j = $i; j <= 3; j++ ))
   do
      if [ ${ComputationArray[$i]} -gt ${ComputationArray[$j]}  ]; then
           t=${ComputationArray[$i]}
           ComputationArray[$i]=${ComputationArray[$j]}
           ComputationArray[$j]=$t
      fi
   done
done


echo  "Sorted Numbers in Ascending Order:"
for (( i=0; i <= 3; i++ )) 
do
  echo ${ComputationArray[$i]}
done

echo  "Sorted Numbers in Descending Order:"
for (( i=3; i >= 0; i-- )) 
do
  echo ${ComputationArray[$i]}
done


