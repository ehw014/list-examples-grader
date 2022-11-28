# Create your grading script here

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

SCORE="0"

cd student-submission

if [[ -f "ListExamples.java" ]]
then
    echo "ListExamples.java exists"
else
    echo "ListExamples.java not found, Score = "$SCORE
    exit
fi 

cp ../TestListExamples.java ./
cp ../lib/hamcrest-core-1.3.jar student-submission
cp ../lib/junit-4.13.2.jar student-submission

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
#javac -cp *.java

if [[ $? -eq 0]]
then
    echo "Successsfully Compiled"
else
    echo "Unsuccessful Compilation, Score = "$SCORE
fi
#java -cp TestListExamples > testresults.txt
java -cp .:lib/hamcrest-core-1.3.jar:lib/Junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > TestResults.txt

if [[] $? -eq 0]]
then
    echo "Successfully Run"
else
    echo "Runtime Error, Score = "$SCORE