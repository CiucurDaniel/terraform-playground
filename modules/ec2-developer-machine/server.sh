#!/bin/bash

sudo su
yum -y install httpd
yum install httpd -y
systemctl start httpd
systemctl enable httpd

# check terraform behaviour
port = 7
echo "this is confusing: $port vs ${port}"


# use terraform vars in ALL-CAPS

# TODO: Update me

echo "<h1>Hello terraform-playground </h1>" >index.html
echo "<p> The current environment is: ${environment} </p>" >>index.html
echo "<p> My port is ${port} </p>" >>index.html
nohup busybox httpd -f -p "${port}" &

# python -m SimpleHTTPServer ${port}
