#!/bin/bash

# Author: Johan de Vries 

set -e

main()
{  
   # Setup users
	jasperj_pass="cyber123!"
	useradd tutor -m -s /bin/bash 2>/dev/null 
	echo "jasperj:$jasperj_pass" | chpasswd

   # Application
   apt update && apt install -y zip figlet nginx 
 
   # ---> Target 1 <---
   # Mission 1-3

}
main
