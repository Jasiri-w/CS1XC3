# keep track of overall mark
let mark=0
token=$(openssl rand -hex 4)

# check question 1
if [[ -d bin && -d dev && -d etc && -d home && -d lib && -d mnt && -d proc && -d root && -d sbin && -d usr && -d usr/bin && -d usr/include && -d usr/lib && -d usr/local && -d usr/share/man && -d var/cache && -d var/lib && -d var/lock && -d var/log && -d var/opt && -d var/spool/cron && -d var/spool/cups && -d var/spool/mail && -d var/tmp ]]; then
    echo "Step 1 Success"
    let mark++
else
    echo "Step 1 Fail"
fi

# check question 2
if [[ $(bin/pwd) == $(pwd) ]]; then
    bin/touch "$token.txt"
    if [[ -f $token.txt ]]; then
        echo "Test passed"
        let mark++
        rm $token.txt
    else
        echo "Test 2 failed"
    fi
else
    echo "Test 2 failed"
fi

# check question 3
touch "$token.txt" && echo "I'm gonna be zipped" >"$token.txt" && zip -r "$token.zip" "$token.txt" && rm "$token.txt"
if [[ $(usr/bin/unzip -x $token.zip) && $(cat $token.txt) == "I'm gonna be zipped" ]]; then
    echo "Test 3 suceeded"
    let mark++
    rm $token.txt
else
    echo "Test 3 failed"
fi
rm "$token.zip"

#check question 4
#There's not that many ways to check this question, I named each students folder as their MacID from avenue but if you don't wanna do that this step just comment out the code
current_path=$(pwd)
fomat_path=(${current_path//// })
length=$((${#fomat_path[@]} - 1))
macid=${length[$length - 2]}
if [[ -d "home/$macid" ]]; then
    echo "Test 4 passed"
    let mark++
else
    echo "Test 4 failed"
fi

#check question 5
#Marking this question as of now is impossible, I'm going to only check if the first line is at least a command and if it is they get the point
#TODO: Find a better solution
# zsh_path=$(find home -iname '.zsh_history')
# first_line=$(head -n 1 $zsh_path | cut -d ";" -f2)
# first_element=$(echo $first_line | awk '{print $1}')
# if [[ $(man $first_element) ]]; then
#     echo "Test 5 passed"
#     let mark++
# else
#     echo "Test 5 failed"
# fi

#check question 6
if [[ -f "boot/linux-1" && -f "boot/config-1" ]]; then
    if grep CONFIG boot/config-1 >/dev/null 2>&1; then
        echo "Step 6 Success"
        let mark++
    else
        echo "Step 6 Fail"
    fi
else
    echo "Step 6 Fail"
fi

#check question 7
if [[ -f "etc/default/grub" && -f "etc/default/useradd" ]]; then
    if [[ $(find etc -iname "*.d") ]]; then
        echo "Step 7 Fail"
    else
        echo "Step 7 Success"
        let mark++
    fi
else
    echo "Test 7 failed"
fi

#check question 8
if [[ -f "lib/systemlib.so" && -f "usr/lib/userlib.so" ]]; then
    echo "Step 8 Success"
    let mark++
else
    echo "Step 8 Fail"
fi

#check question 9
string=$(cat "usr/include/stdfake.h" | tr -d '[:space:]')
if [[ $string == "externintfake_print(void);" ]]; then
    echo "Step 9 Success"
    let mark++
else
    echo "Step 9 Fail"
fi

#check question 10
if [[ $(cat "var/log/syslog") == "DONE!" ]]; then
    echo "Step 10 Success"
    let mark++
else
    echo "Step 10 Fail"
fi

echo "Your mark is $mark"
