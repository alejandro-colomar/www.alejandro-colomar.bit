#!/bin/bash -x
##	./bin/deploy/openshift/config.sh	"<namespace>"
################################################################################
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  GPL-2.0-only                                ##
################################################################################
##
## Generate the config maps
## ========================
##
################################################################################


################################################################################
##	source								      ##
################################################################################
source	lib/libalx/sh/sysexits.sh;


################################################################################
##	definitions							      ##
################################################################################
ARGC=1;


################################################################################
##	functions							      ##
################################################################################


################################################################################
##	main								      ##
################################################################################
function main()
{
	local	namespace="$1";

	oc create configmap "etc-nginx-confd-cm"			\
		--from-file "/run/configs/www/etc/nginx/conf.d/security-parameters.conf" \
		--from-file "/run/configs/www/etc/nginx/conf.d/server.conf" \
		-n "${namespace}";
}


################################################################################
##	run								      ##
################################################################################
argc=$#;
if [ ${argc} -ne ${ARGC} ]; then
	echo	"Illegal number of parameters (Requires ${ARGC})";
	exit	${EX_USAGE};
fi

main	"$1";


################################################################################
##	end of file							      ##
################################################################################