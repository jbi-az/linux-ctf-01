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
	useradd jasperj --create-home --gid 1050 --shell /bin/bash --comment "Jasper Jolles,Web Design,+31 71 223 3777,,jasperj@ql-robotics.com" 2>/dev/null 
	echo "jasperj:$jasperj_pass" | chpasswd

   borish_pass="icarus123!@#" 
   useradd borish --create-home --gid 1051 --shell /bin/sh 2>/dev/null
	echo "borish:$borish_pass" | chpasswd
   useradd laurensm --create-home --gid 1051 --shell /bin/sh --comment "Laurens Martha,Engineering,+49 30 175944864,,laurensm@ql-robotics.com" 2>/dev/null
   useradd dannym --create-home --gid 1051 --shell /bin/sh --comment "Danny Moskov,Engineering,+49 30 093197904,,dannym@ql-robotics.com" 2>/dev/null
   useradd antong --create-home --gid 1051 --shell /bin/sh --comment "Anton Goertov,Engineering,+49 30 638718869,,antong@ql-robotics.com" 2>/dev/null
   useradd nicolass --create-home --gid 1051 --shell /bin/sh --comment "Anton Goertov,Engineering,+49 30 638718869,,nicolass@ql-robotics.com" 2>/dev/null
   useradd maryl --create-home --gid 1052 --shell /bin/sh --comment "Mary Lim-Lee,Legal,+49 30 050979754,,maryl@ql-robotics.com" 2>/dev/null
   useradd lisag --create-home --gid 1050 --shell /bin/bash  --comment "Lisa Grande,Web Design,+49 30 759635389,,lisag@ql-robotics.com" 2>/dev/null
   useradd sergoz  --create-home --gid 1050 --shell /bin/bash --comment "Sergo Zanson,SysAdmin,+49 17 717817048,,antong@ql-robotics.com" 2>/dev/null
   usermod -a -G legal laurensm 2>/dev/null
   usermod -a -G sudo sergoz 2>/dev/null
   
   # Application
   apt update && apt install -y zip figlet nginx 
 
   # ---> Target 1 <--- 
   mv html/* /var/www/html/ 
   sed -i 's/80/8880/g' /etc/nginx/sites-enabled/default 
   service nginx reload 

   # ---> Target 2 <--- 
   figlet -c "project icarus" > /etc/motd 
   figlet -c "development" >> /etc/motd 
   figlet -c "===" >> /etc/motd 
   cat warning-message >> /etc/motd 

   ln -s /home/jasperj /var/www/html/
   
   # Add noise 
   mkdir -p /home/jasperj/photos    
   cp /var/www/html/assets/img/team/* /home/jasperj/photos

   chown -R jasperj:webdesign /home/jasperj

   #--> Target 3 <---
   mkdir -p /usr/share/icarus   
   cp icarus/icarus.pdf /usr/share/icarus/ 
   chown -R laurensm:engineering /usr/share/icarus
   chmod -R 770 /usr/share/icarus
}
main
