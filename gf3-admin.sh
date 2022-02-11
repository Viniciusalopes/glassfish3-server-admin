#!/usr/bin/env bash
# Template proudly created by Shell-Base

#-----------HEADER-------------------------------------------------------------|
# AUTHOR            : Vovolinux <suporte@vovolinux.com.br>
# HOMEPAGE          : https://vovolinux.com.br 
# CREATED           : 2021-10-28 07:58 
# SOFTWARE          : gf3-admin
# VERSION           : 1.0.1
# LICENSE           : MIT - © 2021 - Vovolinux
# SMALL DESCRIPTION : Shortcuts for Glassfish3 Server Administration
#
# CHANGELOG :
# 
# 2021-10-28 [v1.0.1] - Kill replaced by status.
#
#------------------------------------------------------------------------------|

#--------------------------------- VARIABLES ---------------------------------->
#

GF_PORT="8080"
GF_HOME="/home/semad/weboutorga/glassfish3/glassfish"
GF_DOMAIN="${GF_HOME}/domains/domain1"
GF_ASADMIN="${GF_HOME}/bin/asadmin"

alias fuser_domain="fuser ${GF_PORT}/tcp"

#------------------------------- END-VARIABLES --------------------------------<


#--------------------------------- FUNCTIONS ---------------------------------->
#

# check domain status
status_domain()
{
    fuser_domain
    [[ "${?}" -eq "0" ]] && local GF_STATUS='up' || local GF_STATUS='down'
    printf %b "> domain is ${GF_STATUS}!\n"
}

clean_server() {
    local current_path=$PWD
    cd $GF_DOMAIN
    sudo rm -rfv applications/*
    sudo rm -rfv imq/*
    sudo rm -rfv generated/*
    sudo rm -rfv osgi-cache/*
    sudo rm -rfv session-store/*
    sudo rm -rfv lib/databases/*
    #sudo rm -rfv domains/domain1/logs/*log*
    cd /home/semad/weboutorga/glassfish3/glassfish/domains/domain1/logs
    pwd
    sudo rm -rfv *.log
    sudo rm -rfv server.log_*
    #sudo rm -rfv /home/semad/weboutorga/glassfish3/glassfish/domains/domain1/logs/*.log
    #sudo rm -rfv /home/semad/weboutorga/glassfish3/glassfish/domains/domain1/logs/server.log_*
    cd $current_path
}

#------------------------------- END-FUNCTIONS --------------------------------<


#---------------------------------- COMMANDS ---------------------------------->
#
# clean server
alias c="clean_server"

# domain status
alias ds="status_domain"

# domain start
alias s="${GF_ASADMIN} start-domain; ds"

# domain stop
alias t="${GF_ASADMIN} stop-domain; ds"

# domain kill
alias k="fuser_domain -k; ds"

# domain restart
alias r="k && s"



#-------------------------------- END-COMMANDS --------------------------------<
