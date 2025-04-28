while read server
do
    ping -c1 $server
done < servers.txt
echo "$(date +%x)" # output current date