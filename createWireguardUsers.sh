#How to use
# chmod +x ./createWireguardUsers.sh
# sudo ./createWireguardUsers.sh --country us --start 10 -e 2
# Created by Harsh H. Rajpurohit

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -c|--country) country="$2"; shift ;;
        -s|--start) start="$2"; shift ;;
        -e|--end) end="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

if [ -z "$start" ] || [ -z "$country" ] || [ -z "$end" ]; then
    echo ""
    echo "### Sample usage: sudo ./createWireguardUsers.sh --country us --start 10 -end 2"v
    echo "### Short usage: sudo ./createWireguardUsers.sh --c us --s 10 -e 2"
    echo ""
    exit 1
fi


echo "Country Code: $country"
echo "Client Start No.: $start"
echo "Client End No.: $end"
echo "eg. File will look like --> test_$country_$start.conf"


read -p "Press any key to continue... " -n1 -s

echo ""
echo ""
echo "*** Creating Clients ***"
echo ""
for((i=start; i<=end; i++));
do
   echo -ne  "1\ntest$i" | sudo ./wireguardScript.sh
#    echo "test_$country_$i.conf"
done


echo ""