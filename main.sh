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
	useradd jasperj --create-home --gid 1050 --shell /bin/bash 2>/dev/null 
	echo "jasperj:$jasperj_pass" | chpasswd

   borish_pass="icarus123!@!" 
   useradd borish --create-home --gid 1051 --shell /bin/sh 2>/dev/null
	echo "borish:$borish_pass" | chpasswd
   useradd laurensm --create-home --gid 1051 --shell /bin/sh 2>/dev/null
   useradd dannym --create-home --gid 1051 --shell /bin/sh 2>/dev/null
   useradd antong --create-home --gid 1051 --shell /bin/sh 2>/dev/null
   useradd nicolass --create-home --gid 1051 --shell /bin/sh 2>/dev/null
   useradd maryl --create-home --gid 1052 --shell /bin/sh 2>/dev/null
   useradd lisag --create-home --gid 1050 --shell /bin/bash 2>/dev/null
   useradd sergoz  --create-home --gid 1050 --shell /bin/bash 2>/dev/null
   usermod -a -G legal laurensm 2>/dev/null
   usermod -a -G sudo sergoz 2>/dev/null
   
   # Application
   apt update && apt install -y zip figlet nginx 
 
   # ---> Target 1 <---
   # Mission 1-3
   mv html/* /var/www/html/ 
   
}
main
