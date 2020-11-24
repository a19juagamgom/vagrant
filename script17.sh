#!/bin/bash

#Definim la funció que dona informació a l'usuari de la comanda.
usage(){
cat <<EOF	
	Com usar-ho: $0 -u Nom del usuari -h Dir de host [-p port] [-t]

EOF
}
#Iniciem el geotops i les opcions
while getopts ":u:h:p:t" o; do
	case "${o}" in
	u)
		#Agafem -u
		USUARI=$OPTARG
		;;
	h)
		#Agafem -h
		HOST=$OPTARG
		;;
	p)
		#Agafem -p
		PORT=$OPTARG
		
		#Printem si hi ha error de port i el redirigim
		if [ $PORT -lt 1024 ] || [ $PORT -gt 65535 ];then
			echo "ERROR: El port ha de ser mes gran de 1024 i menor o igual a 65535" 1>&2
			usage
		fi
		;;
	t)
		#ESi afegeix -t igualem Test a 1
		TEST=1
		;;
	:)
		#sino hi ha argument printem l'error
		echo "ERROR: Opció -$OPTARG necessita un argument" 1>&2
		usage
		;;
	\?)
		#Opcio no contemplada a les opcions.
		echo "ERROR: Opció no contemplada -$OPTARG" 1>&2
		usage
		;;
	esac
done

#Definim que -u es obligatori
if [ -z $USUARI ]; then
	echo "ERROR: L'opció -u és necessaria" 1>&2
	usage
fi
#Definim el mateix amb -h.
if [ -z $HOST ]; then
	echo "ERROR: L'opció -h és necessaria" 1>&2
	usage
fi
#En cas que hagi hagut algun error, es cridarà la funció usage.
echo "USUARI: "$USUARI
#Printem el host .
echo "HOST: "$HOST
#Si no hi ha port es printa el 3306.
if [ -z $PORT ];then
	echo "PORT: 3306"
#Si s'ha introduït, es printarà el adient
else
	echo "PORT: "$PORT
fi
if [ -z $TEST ];then
	echo "TEST: FALSE"
else
	echo "TEST: TRUE"
fi
