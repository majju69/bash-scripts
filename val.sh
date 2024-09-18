for ((i=1;;i++))
do
	echo $i
    ./gen $i > in1
    ./a < in1 > out
    cat in1 out > data
    ./validator < data > res
    result=$(cat res)
    if [ "${result:0:2}" != "OK" ];
    then
        echo "Error found!"
        echo "Input:"
        cat in1
        echo "Output:"
        cat out
        echo "Validator Result:"
        cat res 
        exit
    fi
done
