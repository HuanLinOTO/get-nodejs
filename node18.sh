#!/bin/bash
# 下载node-v18.16.0-linux-x64.tar.xz到/tmp目录

print("Downloading Node.js")
wget -P /tmp https://npmmirror.com/mirrors/node/v18.16.0/node-v18.16.0-linux-x64.tar.xz
# 解压到/opt/node-v18.16.0/目录
print("Unpacking Node.js to /opt/")
tar -xvf /tmp/node-v18.16.0-linux-x64.tar.xz -C /opt/
# 向~内的所有rc文件写入path /opt/node-v18.16.0/bin/
read -p "Do you want to append path /opt/node-v18.16.0/bin/ to all bash configuration in your home directory? (y/n) " answer
if [ "$answer" == "y" ]; then
  # 向~内的所有rc文件写入path /opt/node-v18.16.0/bin/
  print("OK")
  for file in $(find ~ -name "*rc"); do
    echo "export PATH=/opt/node-v18.16.0/bin/:\$PATH" >> $file
  done
fi