#!/bin/bash

#game da nave

inimigo2=('                     H' '                   H' '                  H' '                 H' '                H' '               H' '              H' '             H' '            H' '           H' '          H' '         H' '        H' '       H' '      H' '     H' '    H' '   H' '  H' ' H' 'H')
uno(){
  clear
  echo "========-========-========-========-========-========"
  printf " }O>$1\n"
  echo "    "
  echo "    "
  echo "========-========-========-========-========-========"
}
duo(){
  clear
  echo "========-========-========-========-========-========"
  printf "    $1\n"
  echo " }O>"
  echo "    "
  echo "========-========-========-========-========-========"
}
tri(){
  clear
  echo "========-========-========-========-========-========"
  printf "    $1\n"
  echo "    "
  echo " }O>"
  echo "========-========-========-========-========-========"
}
cl=0
while [ 1 ]
do
  sleep 0.09
  linha1=`printf "${inimigo2[cl]}"`
  opcao=`cat game.txt`
  case $opcao in
     j) uno "$linha1" ;;
     k) duo "$linha1" ;;
     l) tri "$linha1" ;;
     *)  ;;
     Q | q) break ;;
  esac
  cl=$[ $cl+1 ]
  if [ $cl -gt 21 ]
  then
     cl=0
  fi
done &
while [ 1 ]
do
   read -n1 -p "" opcao
   echo $opcao > game.txt
   if [ $opcao -eq 0 1> /dev/null 2>&1 ]
   then
     ps | grep bash | cut -c1-6 > processos.txt
     ps | grep game | cut -c1-6 > processos.txt
     cat processos.txt | while read linha
     do
        kill $linha 1> /dev/null 2>&1
     done
     break
   fi
done
