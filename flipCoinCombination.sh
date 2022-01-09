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


for i in $(seq 1 ${maxlimit})
do
   combination 
done
echo "'HH','HT','TH' and 'TT' value are in dictionary " ${countDoublet[@]}
echo "Result: Percentage"
echo "HH:$((countDoublet['HH']*100/maxlimit))%"
echo "HT:$((countDoublet['HT']*100/maxlimit))%"
echo "TH:$((countDoublet['TH']*100/maxlimit))%"
echo "TT:$((countDoublet['TT']*100/maxlimit))%"



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


for i in $(seq 1 ${maxlimit})
do
   combination 
done

echo "Result: Percentage"
echo "HHH:$((countTriplet['HHH']*100/maxlimit))%"
echo "HHT:$((countTriplet['HHT']*100/maxlimit))%"
echo "HTH:$((countTriplet['HTH']*100/maxlimit))%"
echo "HTT:$((countTriplet['HTT']*100/maxlimit))%"
echo "THH:$((countTriplet['THH']*100/maxlimit))%"
echo "THT:$((countTriplet['THT']*100/maxlimit))%"
echo "TTH:$((countTriplet['TTH']*100/maxlimit))%"
echo "TTT:$((countTriplet['TTT']*100/maxlimit))%"

max_name1=""
max_name2=""
max_name3=""

max=0
for key in ${!count[@]}; do
    value=${count[${key}]};
    if (( $value > $max )); then max=$value ; max_name1=${key} ; fi;
done

max=0
for key in ${!countDoublet[@]}; do
    value=${countDoublet[${key}]};
    if (( $value > $max )); then max=$value ; max_name2=${key} ; fi;
done

max=0
for key in ${!countTriplet[@]}; do
    value=${countTriplet[${key}]};
    if (( $value > $max )); then max=$value ; max_name3=${key} ; fi;
done

echo "Winner single, name :${max_name1}, percentage:$((count[${max_name1}]*100/maxlimit))"
echo "Winner double, name :${max_name2}, percentage:$((countDoublet[${max_name2}]*100/maxlimit))"
echo "Winner tripple, name:${max_name3}, percentage:$((countTriplet[${max_name3}]*100/maxlimit))"


