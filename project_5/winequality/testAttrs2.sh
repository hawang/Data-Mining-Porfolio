for((a=1; a<=12; a++)); do
for((b=`expr $a + 1`; b<=12; b++)); do

ARGSTR="$a $b"
 
# Create training and test arff files
perl selectAttrs.pl winequality-both-fourqual-training.arff $ARGSTR > tmp2.train.arff
perl selectAttrs.pl winequality-both-fourqual-test.arff $ARGSTR > tmp2.test.arff
 
# Run the weka program
./runModels.sh "$ARGSTR" tmp2.train.arff tmp2.test.arff
 
# Clean up
rm tmp2.*
 
done
done
