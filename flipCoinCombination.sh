r=$((RANDOM%2))

if [ ${r} -eq 0 ] ; then 
    echo "Head"
else 
    echo "Tail"
fi

maxlimit=1000

declare -A count
count['H']=0
count['T']=0
combination()
{
    r0=$((RANDOM%2))

    if [ ${r0} -eq 0 ] ; then 
        ((count['H']++))
    else 
        ((count['T']++))
    fi 

}

for i in $(seq 1 ${maxlimit})
do
   combination 
done
echo "'H' and 'T' value are in dictionary " ${count[@]}
echo "Result: Percentage"
echo "H:$((count['H']*100/maxlimit))%"
echo "T:$((count['T']*100/maxlimit))%"

maxlimit2=1000

declare -A countDoublet
countDoublet['HH']=0
countDoublet['HT']=0
countDoublet['TH']=0
countDoublet['TT']=0
combination()
{
    r0=$((RANDOM%2))
    r1=$((RANDOM%2))

    if [ ${r0} -eq 0 ] ; then 
        if [ ${r1} -eq 0 ] ; then 
            ((countDoublet['HH']++))
        else 
            ((countDoublet['HT']++))
        fi 
    else 
        if [ ${r1} -eq 0 ] ; then 
            ((countDoublet['TH']++))
        else 
            ((countDoublet['TT']++))
        fi 
    fi 

}


for i in $(seq 1 ${maxlimit2})
do
   combination 
done
echo "'HH','HT','TH' and 'TT' value are in dictionary " ${countDoublet[@]}
echo "Result: Percentage"
echo "HH:$((countDoublet['HH']*100/maxlimit2))%"
echo "HT:$((countDoublet['HT']*100/maxlimit2))%"
echo "TH:$((countDoublet['TH']*100/maxlimit2))%"
echo "TT:$((countDoublet['TT']*100/maxlimit2))%"

maxlimit3=1000

declare -A countTriplet
countTriplet['HHH']=0
countTriplet['HHT']=0

countTriplet['HTH']=0
countTriplet['HTT']=0

countTriplet['THH']=0
countTriplet['THT']=0

countTriplet['TTH']=0
countTriplet['TTT']=0

combination()
{
    r0=$((RANDOM%2))
    r1=$((RANDOM%2))
    r2=$((RANDOM%2))

    if [ ${r0} -eq 0 ] ; then 
        if [ ${r1} -eq 0 ] ; then 
            if [ ${r2} -eq 0 ] ; then 
                ((countTriplet['HHH']++))
            else 
                ((countTriplet['HHT']++))
            fi 
        else
            if [ ${r2} -eq 0 ] ; then 
                ((countTriplet['HTH']++))
            else 
                ((countTriplet['HTT']++))
            fi 
        fi 
    else 
        if [ ${r1} -eq 0 ] ; then 
            if [ ${r2} -eq 0 ] ; then 
                ((countTriplet['THH']++))
            else 
                ((countTriplet['THT']++))
            fi 
        else
            if [ ${r2} -eq 0 ] ; then 
                ((countTriplet['TTH']++))
            else 
                ((countTriplet['TTT']++))
            fi 
        fi
    fi 
}


for i in $(seq 1 ${maxlimit3})
do
   combination 
done

echo "Result: Percentage"
echo "HHH:$((countTriplet['HHH']*100/maxlimit3))%"
echo "HHT:$((countTriplet['HHT']*100/maxlimit3))%"
echo "HTH:$((countTriplet['HTH']*100/maxlimit3))%"
echo "HTT:$((countTriplet['HTT']*100/maxlimit3))%"
echo "THH:$((countTriplet['THH']*100/maxlimit3))%"
echo "THT:$((countTriplet['THT']*100/maxlimit3))%"
echo "TTH:$((countTriplet['TTH']*100/maxlimit3))%"
echo "TTT:$((countTriplet['TTT']*100/maxlimit3))%"


