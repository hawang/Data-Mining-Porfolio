for((a=1; a<=12; a++)); do
for((b=`expr $a + 1`; b<=12; b++)); do
for((c=`expr $b + 1`; c<=12; c++)); do
for((d=`expr $c + 1`; d<=12; d++)); do
for((e=`expr $d + 1`; e<=12; e++)); do
for((f=`expr $e + 1`; f<=12; f++)); do
for((g=`expr $f + 1`; g<=12; g++)); do
for((h=`expr $g + 1`; h<=12; h++)); do
for((i=`expr $h + 1`; i<=12; i++)); do
 
ARGSTR="$a $b $c $d $e $f $g $h $i"
 
# Create training and test arff files
perl selectAttrs.pl winequality-both-fourqual-training.arff $ARGSTR > tmp9.train.arff
perl selectAttrs.pl winequality-both-fourqual-test.arff $ARGSTR > tmp9.test.arff
 
# Run the weka program
./runModels.sh "$ARGSTR" tmp9.train.arff tmp9.test.arff
 
# Clean up
rm tmp9.*
 
done
done
done
done
done
done
done
done
done
