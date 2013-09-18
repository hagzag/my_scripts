my_scripts
==========

A collection of scripts - which do stuff [ usually bootstrap stuff ]


Bootstrap My Mac
----------------
  This will go through a collection of scripts and add git, xcodes cli tools, 
  install ruby via rvm then add whats needed to use chef to bootstrap your laptop
  I assume this is a blurprint of an omnibus installer ...

	sudo bash < <(curl -L https://raw.github.com/hagzag/my_scripts/master/bootstrap_mac.sh)

  Take a closer look this will do:

| #  | action      | what ?                  | status ? |
|:--:|:------------|:------------------------|:---------|
| 1. | install git | [ if it dosent exist ]  | done     |
| 2. | install xtools-cli | [ if it dosent exist ]  | done     |
| 3. | install ruby via rvm | Ruby version manager | | in progress |
| 4. | install chef | Install chef gem | | in progress |
| 5. | git clone cookbase | get macosx cookbook | [laptop][1] | in progress |
| 6. | run chef solo | Provision node | | in progress |


Install Git - supports MACOSX only ...
-----------
install_git.sh will install git when you have none ..., basically everything else is based on git so ...
  
    sudo bash < <(curl -L https://raw.github.com/hagzag/my_scripts/master/install_git.sh)





[1]: https://github.com/cookbase/laptop 
