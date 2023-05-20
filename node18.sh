#!/bin/bash
# 下载node-v18.16.0-linux-x64.tar.xz到/tmp目录
wget -P /tmp https://npmmirror.com/mirrors/node/v18.16.0/node-v18.16.0-linux-x64.tar.xz
# 解压到/opt/node-v18.16.0/目录
tar -xvf /tmp/node-v18.16.0-linux-x64.tar.xz -C /opt/
# 询问用户是否要向~内的所有以点开头的rc文件写入path /opt/node-v18.16.0-linux-x64/bin/

read -r -p "Do you want to append path /opt/node-v18.16.0-linux-x64/bin/ to all rc files starting with a dot in your home directory? (y/n)" input

case $input in
    [yY][eE][sS]|[yY])
		for file in $(find ~ -maxdepth 1 -name ".*rc"); do
            echo "Append to $file"
            echo "export PATH=/opt/node-v18.16.0-linux-x64/bin/:\$PATH" >> $file
        done
        echo "Restarting Shell"
        exec $SHELL -l
    ;;

    [nN][oO]|[nN])
        echo "Ok, see you next time"
    ;;

    *)
        echo "Invalid input... Good bye."
        exit 1
    ;;
esac