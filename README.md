# glassfish3-server-admin
[Shell Script] Shortcuts for Glassfish3 Server Administration

---
<br>

## shell commands after install

__$ s__ = domain start

__$ t__ = domain stop

__$ k__ = domain kill

__$ r__ = domain restart

<br>

---

## how to install

<br>

- Download __gf3-admin.sh__ file

  <pre>$ wget https://raw.githubusercontent.com/Viniciusalopes/glassfish3-server-admin/main/gf3-admin.sh -O $HOME/gf3-admin.sh</pre>

<br>

- Allow Execution

  <pre>$ chmod +x $HOME/gf3-admin.sh</pre>

<br>

- Include into ```.*shrc...```

  - ...for bash users

    <pre>$ echo -e "\n# Shortcuts for Glassfish3 Server Administration - By Vovolinux $(date "+%Y-%m-%d - %H:%M:%S")\nsource $HOME/gf3-admin.sh\n\n" >> $HOME/.bashrc</pre>

    <br>

  - ...for zsh users

    <pre>$ echo -e "\n# Shortcuts for Glassfish3 Server Administration - By Vovolinux $(date "+%Y-%m-%d - %H:%M:%S")\nsource $HOME/gf3-admin.sh\n\n" >> $HOME/.zshrc</pre>

<br>

- Edit ```$HOME/gf3-admin.sh``` file and:

  - If necessary, change the __GF_PORT__ variable with your glassfish server port,

  - Change the __GF_ASADMIN__ variable with your full path to ```/glassfish3/glassfish/bin/asadmin```

<br>

- Restart your terminal emulator.

<br>
On my machine, it works!

(Vovolinux)
