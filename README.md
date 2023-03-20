# linux-ctf-01

Test
Provisioner script:

```sh
#!/bin/bash

set -e 

main()
{
   apt update && apt install -y git;
   cd /root
      git clone https://github.com/jbi-az/linux-ctf-01.git;
   cd linux-ctf-01;
   chmod +x main.sh;
   bash main.sh;
}

main
