TTY="$1"
while true; do
    printf "Enter command> "
    read command
    echo -e "$command\r" > $TTY
done
