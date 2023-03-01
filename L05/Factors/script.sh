
FILE=memory_results.csv
touch $FILE
echo "Search Value,Linear Search,Binary Search,Fibonacci,Notes" > $FILE
# Now looking for Maximum Resident
for num in 1 4 22 37 22906 53757 112591 361940 475713 893766 996637 996639 996652 -996652; do
    result_string="$num"
    residents=()
    for algo in 0 1 2; do
        time_output=$( { /usr/bin/time -f "%M" ./search $algo $num >/dev/null; } 2>&1 )
	max_resident=$(echo "$time_output")
        residents+=("$max_resident")
        result_string="$result_string,$max_resident"
    done
    fastest_algos=()
    min_size=$(echo "${residents[@]}" | tr ' ' '\n' | sort -n | head -n 1)
    for i in "${!residents[@]}"; do
        if [[ "${residents[$i]}" == "$min_size" ]]; then
            fastest_algos+=("$i")
        fi
    done
    notes=$(echo "${fastest_algos[@]}" | tr ' ' ',')
    result_string="$result_string,$notes"
    echo $result_string >> $FILE
done
