for((a=1; a<=12; a++)); do
for((b=`expr $a + 1`; b<=12; b++)); do
for((c=`expr $b + 1`; c<=12; c++)); do
for((d=`expr $c + 1`; d<=12; d++)); do
 
ARGSTR="$a $b $c $d"
 
# Create training and test arff files
perl selectAttrs.pl winequality-both-fourqual-training.arff $ARGSTR > tmp4.train.arff
perl selectAttrs.pl winequality-both-fourqual-test.arff $ARGSTR > tmp4.test.arff
 
# Run the weka program
./runModels.sh "$ARGSTR" tmp4.train.arff tmp4.test.arff
 
# Clean up
rm tmp4.*
 
done
done
done
done
