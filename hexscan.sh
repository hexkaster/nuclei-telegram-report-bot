#! /usr/bin/bash
 
 echo "||PiratesBot v0.1||"
 echo "🏴☠️  @hexkaster at github & twitter! 🏴☠️ "
 echo -e ".\n.\n.\n"
 
 #checa se arquivo existe, se n existir cria ele
 touch hexresultsnovo.txt
 
 #passa os dados do ultimo scan pro backup
 cp hexresultsnovo.txt hexresultsvelho.txt
 
 #comando de scan do nuclei, usa a lista de dominios hexdomains.txt e passa o resultado pro hexresultsnovo.txt
 
 datahorario=$(date +"%d/%m/%Y %H:%M")
   ./pirates-send.sh "|| ♻️SCAN INICIADO!%0A|| ♻️$datahorario"
 
 #organiza os results pra sorted, e depois passa eles em comm pra retirar dados repetidos
 cat hexresultsvelho.txt | sort > hexresultsvelhosorted.txt
 cat hexresultsnovo.txt | sort > hexresultsnovosorted.txt
 comm -13 hexresultsvelhosorted.txt hexresultsnovosorted.txt > hexresultsfinal.txt
 
 #retorna os dados do hexresultsfinal, filtrando info & alguns alertas desnecessarios
 
 echo "_____________________________________________________________________________"
 echo "                                RESULTS NOVOS"
 echo "_____________________________________________________________________________"
 echo -e ".\n.\n.\n"
 
 grep -v 'untrusted-root-certificate\|weak-cipher-suites\|info' hexresultsfinal.txt > hexresultsfiltered.txt
 
 cat hexresultsfiltered.txt | cut -d " " -f 1-4 | tr -d   "[" | tr -d "]" | sed "s/low/%0ALOW 🟢%0A/g" | sed "s/   medium/%0AMEDIUM 🟡%0A/g" | sed "s/high/%0AHIGH 🟠%0A/   g" | sed "s/critical/%0ACRITICAL 🔴%A/g" > limpo.txt
 while read in; do
     ./pirates-send.sh "$in"
 done < limpo.txt
 datahorario=$(date +"%d/%m/%Y %H:%M")
   ./pirates-send.sh "|| ♻️SCAN FINALIZADO!%0A|| ♻️$datahorario"
