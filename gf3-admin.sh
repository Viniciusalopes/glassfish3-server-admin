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
GF_ASADMIN="/home/semad/weboutorga/tools/glassfish3/glassfish/bin/asadmin"
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

#------------------------------- END-FUNCTIONS --------------------------------<


#---------------------------------- COMMANDS ---------------------------------->
#

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
