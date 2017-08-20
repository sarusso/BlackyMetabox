# MetaBox
A collection of plug-and-play services for your Box

## Reuirements

For building MetaBox, you need Docker, Git, Python and Bash, plus Internet connectivity.

For accessing the services, the requirements change from service to service. In general, a modern (post 2014) OS and Web browser should work. (Note: Safari with Web remote Desktop over https does not work due to a limitation is Safari itself)

If you make exstensive use or local or remote MetaBox Desktop, you might want to try the native MetaBox Desktop App (for Windows, Mac and Linux).



## Services

* Desktop: a Xfce desktop plus VNC and web-based VNC.


* Web: web services, including access to Desktop's web-based VNC. Access it via http://localhost or http://

* Files: provides access for files in the "Data" folder of metauser hoem directory trough Samba (Windows File Sharing protocol).

* Zeroconf: provides zero configuration for services discovery when running on a LAN network or VPN. An exampe is to see the "Metabox" server in OSX Finer sidebar.

* Vpn: provides access to the host tought Hamachi VPN service. Requires creating an accoung on Hamachi's website. Read more below.


## Build

    $ metabox/build all

## Run

    $ metabox/run all


## List

    $ metabox/run ps

## Ssh

    $ metabox/ssh service_name (user automatically set to metauser)


## Stop

    $ metabox/clean all

## Authentication

Default user is metauser. Default password for Web and Files services: "metapass". Change it!!

For Web (with "web" service running):

    $ metabox/ssh web
    $ cd /data && sudo htpasswd -bc htpasswd metauser YOUR_NEW_PASS
    $ exit
    $ metabox/rerun web

For Files (with "files" service running):

    $ metabox/ssh files
    $ sudo bash -c "(echo YOUR_NEW_PASS; echo YOUR_NEW_PASS) | smbpasswd -a metauser"
    $ exit
    $ metabox/rerun files


## Setting up VPN

MetaBox To provide VPN access MetaBox uses Hamachi, which even if requires a third-party intermediary (their servers), the setup is extremely simplified. Moreover, once established, the connection is directly tunneled to your MetaBox host in the majority of the cases even across Firewalls and NATs.

To set it up, first you need to go on http://vpn.net (Hamachi's website) and signup for a free account. Then you need to create a new netowrk. We suggest type "mesh", without password, and to require memeber approval. Copy the network ID (in the format xxx-yyy-zzz). Then:

    $ metabox/ssh vpn
    $ sudo su
    $ hamachi login
    $ hamachi  # Will show status
    $ hamachi do-join xxx-yyy-zzz  # Type [enter] on password prompt
    
Now, on vpn.net, accept the new join request you will see. Then:
    
    $ hamachi  # Will show status    
    $ exit
    $ exit

The final step is to install the Hamachi client for tour laptop and join the network from thre as well. Your MetaBox will be assigned a static private IP, which will never change (unless you delete MetaBox's data folder).



