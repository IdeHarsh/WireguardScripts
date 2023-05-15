#How to use
# chmod +x ./removeWireguardUsers.sh
# sudo ./removeWireguardUsers.sh --count 10
# Created by Harsh H. Rajpurohit

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -c|--count) count="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

if [ -z "$count" ]; then
    echo ""
    echo "### Sample usage (Try sudo if not works): sudo ./removeWireguardUsers.sh --count 10"
    echo "### Short usage (Try sudo if not works): sudo ./removeWireguardUsers.sh -c 10"
    echo ""
    exit 1
fi

printf "Do you want to Remove Initial $count Wireguard Users (y/n)?"
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo ""
    echo ""
    echo "*** Removing Clients ***"
    echo ""

    for((i=1; i<=count; ++i));
    do
    echo -ne  "3\n1" | sudo ./wireguardScript.sh
    done

    echo ""
    echo "*** Clients Removed ***"

else
    echo No
fi
