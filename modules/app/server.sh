#!/bin/bash
echo "<h1>Hello terraform-playground </h1>" > index.html
echo "<p> The current environment is: ${environment} </p>" >> index.html
echo "<p> My port is ${server_port} </p>" >> index.html
nohup busybox httpd -f -p "${server_port}" &