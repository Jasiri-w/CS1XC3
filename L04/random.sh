#!/bin/bash

Q1=0
Q2=0
Q3=0
Q4=0
Q5=0

mkdir -p "/tmp/$USER"
WDIR="/tmp/$USER"
script="$1"

echo "$WDIR"
echo "$script"

# check objective 1
bash $script "$WDIR" 1
if [ -f "${WDIR}/file1.txt" ]; then
    if grep -q "$USER" "${WDIR}/file1.txt"; then
        Q1=1
    fi
fi

# check objective 2
bash $script "$WDIR" 2
if [ -f "${WDIR}/backup/file1.txt" ]; then
    if cmp -s "${WDIR}/file1.txt" "${WDIR}/backup/file1.txt"; then
        Q2=1
    fi
fi

# check objective 3
rm "$WDIR/file1.txt"
bash $script "$WDIR" 3
if [ -f "${WDIR}/file1.txt" ]; then
    if grep -q "$USER" "${WDIR}/file1.txt"; then
        Q3=1
    fi
fi

# check objective 4
bash $script "$WDIR" 1 "test.txt"
bash $script "$WDIR" 2 "test.txt"
if [ -f "${WDIR}/backup/test.txt" ]; then
    if cmp -s "${WDIR}/test.txt" "${WDIR}/backup/test.txt"; then
        Q4=1
    fi
fi

# check objective 5
bash $script "$WDIR" 1 "test.txt" something extra
if [ -f "${WDIR}/excess.txt" ]; then
    if grep -q something "${WDIR}/excess.txt" && grep -q extra "${WDIR}/excess.txt"; then
        Q5=1
    fi
fi

echo "Objective 1 Mark: $Q1"
echo "Objective 2 Mark: $Q2"
echo "Objective 3 Mark: $Q3"
echo "Objective 4 Mark: $Q4"
echo "Objective 5 Mark: $Q5"
TOTAL=$(($Q1 + $Q2 + $Q3 + $Q4 + $Q5))
echo "Total: $TOTAL"
