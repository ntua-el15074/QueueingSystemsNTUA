lambdas="1 5 10"

for lambda in $lambdas
do
    echo "Running lambda = $lambda"
    octave task1ask1.m $lambda
done
