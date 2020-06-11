#!/bin/bash

handler="/home/borisshapa/Yandex.Disk/labs_os/lab5/handler.sh"
while true; do
	nc -lp 24344 -e $handler
done

