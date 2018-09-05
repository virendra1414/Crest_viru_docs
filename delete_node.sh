#!/bin/bash -e
# pass Parameter as Argument
while getopts :f: option
do
    case "${option}"
    in
        f) HOST_FILE_PATH=${OPTARG};;
    esac
done
cat $HOST_FILE_PATH | while read host
    do {
        echo "Bootstrapping $host"
        knife search node "ipaddress:$host" | grep Node | tee -a nodename
    }< /dev/null; done
sed -i 's/Node Name://g' nodename
sed 's/\s//g' nodename | tr -d '\n'
cat nodename | while read node_name
    do {
        echo "deleting $node_name"
        knife node delete $node_name | tee -a deleted_node
    }< /dev/null; done
rm -rf nodename