#!/usr/bin/env bash
# Template proudly created by Shell-Base

#-----------HEADER-------------------------------------------------------------|
# AUTHOR            : Vovolinux <suporte@vovolinux.com.br>
# HOMEPAGE          : https://vovolinux.com.br 
# CREATED           : 28/10/2021 às 07:58 
# SOFTWARE          : gf3-admin
# VERSION           : 1.0.0
# LICENSE           : MIT - © 2021 - Vovolinux
# SMALL DESCRIPTION : Shortcuts for Glassfish3 Server Administration
#
# CHANGELOG :
#
#------------------------------------------------------------------------------|

#--------------------------------- VARIABLES ---------------------------------->
#

GF_PORT="8080"
GF_ASADMIN="/full/path/to/glassfish3/glassfish/bin/asadmin"
alias fuser_domain="fuser ${GF_PORT}/tcp"

#------------------------------- END-VARIABLES --------------------------------<


#--------------------------------- FUNCTIONS ---------------------------------->
#

# kill domain and screen message
kill_domain() {
    fuser_domain -k
    [[ "${?}" -eq "0" ]] && local a=' ' || local a=' already '
    printf %b "> domain${a}killed.\n"
}

#------------------------------- END-FUNCTIONS --------------------------------<


#---------------------------------- COMMANDS ---------------------------------->
#
# domain start
alias s="${GF_ASADMIN} start-domain; fuser_domain -k"

# domain stop
alias t="${GF_ASADMIN} stop-domain"

# domain kill
alias k="kill_domain"

# domain restart
alias r="k && s"

#-------------------------------- END-COMMANDS --------------------------------<
