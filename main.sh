#!/bin/bash

# Author: Johan de Vries 

set -e

main()
{  
   # Setup groups
   groupadd webdesign --gid 1050
   groupadd engineering --gid 1051
   groupadd legal --gid 1052

   # Setup users
	jasperj_pass="strato_NL"
	useradd jasperj --home-dir /usr/share/nginx --gid 1050 --shell /bin/bash 2>/dev/null 
	echo "jasperj:$jasperj_pass" | chpasswd

   borish_pass="icarus123!@!" 
   useradd borish --create-home --gid 1051 --shell /bin/sh 2>/dev/null
	echo "borish:$borish_pass" | chpasswd

   # Application
   apt update && apt install -y zip figlet nginx 
 
   # ---> Target 1 <---
   # Mission 1-3
   mv html/ /usr/share/nginx/ 

}
main
