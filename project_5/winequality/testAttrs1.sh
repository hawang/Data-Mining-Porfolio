for((a=1; a<=12; a++)); do
 
ARGSTR="$a"
 
# Create training and test arff files
perl selectAttrs.pl winequality-both-fourqual-training.arff $ARGSTR > tmp1.train.arff
perl selectAttrs.pl winequality-both-fourqual-test.arff $ARGSTR > tmp1.test.arff
 
# Run the weka program
./runModels.sh "$ARGSTR" tmp1.train.arff tmp1.test.arff
 
# Clean up
rm tmp1.*
 
done
