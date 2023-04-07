#!/bin/bash
col1="\e[35m"
col2="\e[32m"
res="\e[0m"
function legacy(){
ssh-keygen -t rsa -b 4096 -C ${EMAIL}<<EE



EE
}

function nonlegacy(){
ssh-keygen -t ed25519 -C ${EMAIL}<<EE



EE
}

printf "%s [y,N]\n" "using a legacy system ? : "
read LEGACY
if [[ "$LEGACY" = "Y" || "$LEGACY" = "y"  ]];then 
  printf "%s\n" "LEGACY system set";
  LEGACY=1;
else
  LEGACY=0
fi

loopb=0
while [ $loopb -eq 0 ];do
    printf "%s\n" "Enter your email : " 
    read EMAIL
    printf "Email read : %s\nDo you want to continue? [Y,n] >> " "${EMAIL}"
    read ans 
    if [[ "$ans" = "n" || "$ans" = "N" ]];then 
        loopb=0 
    else 
        loopb=1
    fi
done

[ -d "$HOME/.ssh" ] && { printf "${col2}[ERR]  ${res}~/.ssh already exits\n"; exit 1; }


printf "LEGACY = ${LEGACY}\n"
if [[ $LEGACY -eq 1 ]];then 
    printf "${col1}[R] ${res}Running legacy\n"
    legacy && printf "${col1}[R] ${res}Done..\n"  || printf "${col2}[ERR] ${res}generating key failed...\n";
else 
    printf "${col1}[R] ${res}Running non legacy\n"
    nonlegacy && printf "${col1}[R] ${res}Done..\n" || printf "${col2}[ERR] ${res}generating key failed...\n"
fi

[ -d "$HOME/.ssh" ] && printf "" || { printf "${col2}[ERR] ${res}Could not find ssh folder\n"; exit 1; }

printf "${col1}[R] ${res}final Setting up...\n";
eval "$(ssh-agent -s)"
ssh-add "$HOME/.ssh/id_ed25519"

printf "${col1}[R] ${res}Done..\n${col1}Public key:${res}\n%s\n" "$(cat ~/.ssh/id_ed25519.pub)"
exit 

