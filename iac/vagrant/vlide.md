 .      .   • °   °  ☆    　:.     .　　★      ☆      .　　    •   ° ★      .
  •   ° ★　 .　  　.　.　　¸  　 *　.    　..　    ° ★　 .   ° .　  　. 　¸.
　 .   °                    ¸                               .　　★　　★ °   ☆
   　　　.　  °☆ 　. *
.     ★　 .　 *　.　.　    　██╗    █████╗     ██████╗     .　　★  　　★   ☆
 .  ° 　.   .　　★　　       ██║   ██╔══██╗   ██╔════╝
  . . •                      ██║   ███████║   ██║         ★　°  .  　 . •    ★
 .  　　　 　  °☆ 　.        ██║   ██╔══██║   ██║          .　　   　　★
    ° 　    .　　 　　.      ██║   ██║  ██║   ╚██████╗   ° 　¸.       ¸ .
   ○    　  　  　.　.       ╚═╝   ╚═╝  ╚═╝    ╚═════╝    　　 ° 　¸.       ¸ .
 .         °  ☆                                　　  　:.     .　　★      ☆
  •   ° ★　 .　  　.　.　　¸  　　   　            ° ★　 .   ° .　  　. 　¸.
 -  　★　  :.　 . 　 *　.    　..　   ☆•   ° ★　 .　  　.              .

  █ PROVISIONAMIENTO DE INFRAESTRUCTURA: VAGRANT

  ★　 .   ° .　    　 ° 　.   .　　★　　°    ☆ 　     .　　  　★ 　★　 :.
   .　　     .　　      ★　 .   ° .　  　. 　¸.     ★　 .   ° .　  　. 　¸.
  ★　 .  　__▄     ☆ ¸.     https://www.meetup.com/Infraestructura-como-codigo
 ☆ ¸. ¸.    ╚▌   　.　.     .         ★ 　　  °   ☆           .　　 　　  °
 　 .○ °    ██                ¸       ▄        ☆          ☆ ¸. ¸.   .　　★
 .　　★　   ▐█  °☆ 　☾             ▄█████▄   .   ° 　           Agosto, 2018
            ▐█    ★        ☆     ╓██▀▀▀▀▀██,       ¸•   ° ★　 .   °    ★　 .
   __ ╟░b   ▐█                  ⌡███████████,   ° ★           http://javier.io
   ░░ ╟░b▓░ ▐█  ∞▄         Φ,⌡░∩█████████████,(▓░ _     ⌡
   ░░ ░░░░░▐██  ▓▓∩▓▌▓▓⌡▌⌡░▓▌⌡░⌡███▓░░░ ░ ███,▐░██░,   ⌡█▌__▄▄_ __ _    _
  ▓▓▓▓▓▓▓▓░█████▓▓▓░█████████▓▓▓███▓▓░▓x░∞███▓▓░██▓▓█▓▓▓██▓█████▓▓▓▓░▓▓░███▓
████████████████▓██████████████▓███▓█▓▓▓▓▓███▓▓███████████▓█████▓▓▓███████████

@autoexe{ vim: set tw=78 ts=8 ft=help: }

@autoexe{}
    echohl WarningMsg
    let err_msg="Error: no se ha encontrado una sesión de Tmux activa"
    let err_msg.=", por favor invoque una y reabra este archivo desde ahi"
    if !exists('$TMUX') | echo err_msg | endif
    echohl None
@end
==============================================================================
*CONTENIDOS*                                 *INFRAESTRUCTURA* *COMO* *CODIGO* - *IAC*


    1. Intro ............................................................. |1|

    2. Vagrant Hello World ............................................... |2|

    3. Vagrant Cloud ..................................................... |3|

    4. Vagrant Provisionadores ........................................... |4|
        4.1 File ......................................................... |4|
        4.1 Shell ........................................................ |4|
        4.1 Ansible ...................................................... |4|

    5. Vagrant Plugins ................................................... |5|
        5.1 vagrant-hostmanager-ext ...................................... |5|
        5.2 vagrant-triggers ............................................. |5|
        5.2 vagrant-cachier .............................................. |5|

    6. Caso de uso ....................................................... |5|
        6.1 HA con keepalived, haproxy y nginx ........................... |5|

    7. Fin ............................................................... |6|

@autoexe{ vim: set tw=78 ts=8 ft=help: }
==============================================================================
*INTRO*                                      *INFRAESTRUCTURA* *COMO* *CODIGO* - *IAC*

¿Por qué *Vagrant* ?: Cuando los contenedores no son suficientes, la
virtualización puede salvar el día.

Ejemplos:

    * Balanceadores / Proxies inversos
    * Docker sobre Windows/Mac
    * Software para otras plataformas / arquitecturas
    * Clusters de contenedores (Swarm/Kubernetes/Nomad) / DB

Vagrant también puede usarse como gestor de:

    * Contenedores, aunque docker-compose y docker son mejores en ello
    * Cliente de computo en la nube, aunque terraform/cloudformation son
      mejores

    * Se especializa en la gestión de hipervisores locales:

                        |VirtualBox|/VWWare/HyperV

@autoexe{ vim: set tw=78 ts=8 ft=help: }
==============================================================================
*INTRO*                                      *INFRAESTRUCTURA* *COMO* *CODIGO* - *IAC*

*Vagrant* Box: Plantilla de archivos + metadatos

                       +---------------------------+
                       | /usr/bin/my-app           |
                       | /etc/sudoers.d       SO   |
                       | /bin/bash                 |
                       +---------------------------+
                       | {                         |
                       |   "name": "user/box"      |
                       |    ...                    |
                       +---------------------------+

    $ vagrant package
    $ packer => Dockerfile

@autoexe{ vim: set tw=78 ts=8 ft=help: }
==============================================================================
*INTRO*                                      *INFRAESTRUCTURA* *COMO* *CODIGO* - *IAC*

*Vagrantfile* Definición de Vagrant boxes / Equivalente a *docker-compose.yml*

          +------------------------------------------------------+
          |                                   [Mi Aplicación]    |
          |                   +-------+      Stack de Software   |
          |                 +-| Nginx |-+                        |
          |                 | +-------+ |                        |
          |                 |     |     |                        |
          |     +---------+ | +-------+ | +--------+  +-------+  |
          |     | HAProxy ||||| Nginx ||||| Tomcat |||| MySql |  |
          |     +---------+ | +-------+ | +--------+  +-------+  |
          |                 |     |     |                        |
          |                 | +-------+ |                        |
          |                 +-| Nginx |-+                        |
          |                   +-------+                          |
          |                                                      |
          +------------------------------------------------------+

@autoexe{ vim: set tw=78 ts=8 ft=help: }
==============================================================================
VAGRANT                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Hello World

    $ time vagrant init javier-lopez/openbsd-6.2
    $ time vagrant init jhakonen/windows-10-n-pro-en-x86_64
    $ time vagrant init tnarik/solaris10-minimal

    $ time vagrant up && time vagrant ssh

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
VAGRANT                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Hello World

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: ruby

    Vagrant.configure("2") do |config|
      config.vm.box = "javier-lopez/openbsd-6.2"
    end

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
VAGRANT                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Hello World

    $ time vagrant init javier-lopez/openbsd-6.2
    $ time vagrant up && time vagrant ssh -c 'echo Hello World; uname -a'

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
------------------------------------------------------------------------------
¿Qué ha pasado?

------------------------------------------------------------------------------
    * vagrant busca la imagen 'javier-lopez/openbsd-6.2' en localhost
------------------------------------------------------------------------------
    * al no encontrarlo va a los repositorios configurados, por defecto
      https://app.vagrantup.com/
------------------------------------------------------------------------------
    * descarga 'javier-lopez/openbsd-6.2'
      de https://app.vagrantup.com/javier-lopez/boxes/openbsd-6.2
------------------------------------------------------------------------------
    * descomprime la imagen, lee los metadatos y ejecuta el virtualizador
------------------------------------------------------------------------------
    * ejecuta las instrucciones del Vagranfile para provisionar/personalizar
      el entorno

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
VAGRANT                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

¿Qué pasa si se vuelve a instanciar openbsd-6.2?

    $ time vagrant destroy -f
    $ time vagrant up && time vagrant ssh -c 'echo Hello World; uname -a'

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
------------------------------------------------------------------------------
Esta vez es más rapido, ¿por qué?

------------------------------------------------------------------------------
    * vagrant busca la imagen 'javier-lopez/openbsd-6.2' en localhost
------------------------------------------------------------------------------
    * al **encontrarlo** descomprime la imagen, lee los metadatos y ejecuta
      el virtualizador especifico
------------------------------------------------------------------------------
    * tiempo total?, algunos segundos

------------------------------------------------------------------------------
Lo importante: especificando un **Vagrantfile** cada proyecto puede ser
replicado con `vagrant up`, a esto se le conoce como el TAO de Vagrant.

==============================================================================
VAGRANT                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Debido a la virtualización, vagrant es mucho más lento que docker, sin embargo
se pueden mejorar sus tiempos:

   * Clones Ligeros

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: ruby

    Vagrant.configure("2") do |config|
      config.vm.box = "javier-lopez/openbsd-6.2"
      config.vm.provider "virtualbox" do |vbox|
        vbox.linked_clone = true
      end
    end
	
    $ time vagrant destroy -f; time vagrant up ; vagrant ssh

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
VAGRANT                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Debido a la virtualización, vagrant es mucho más lento que docker, sin embargo
se pueden mejorar sus tiempos:

   * Personalizar las caracteristicas en memoria / CPU del sistema
     virtualizado

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: ruby

    Vagrant.configure("2") do |config|
      config.vm.box = "javier-lopez/openbsd-6.2"
      config.vm.provider "virtualbox" do |vbox|
        vbox.linked_clone = true
        vbox.customize ["modifyvm", :id, "--memory", 1024]
        vbox.customize ["modifyvm", :id, "--cpuexecutioncap", 100]
        vbox.customize ["modifyvm", :id, "--cpus", 4]
      end
    end
	
    $ time vagrant destroy -f; time vagrant up; vagrant ssh

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
VAGRANT                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Debido a la virtualización, vagrant es mucho más lento que docker, sin embargo
se pueden mejorar sus tiempos:

   * Proxies cache de paquetes / datos

       - vagrant-cachier
       - apt-cacher-ng
       - squid

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
------------------------------------------------------------------------------

   * Generar imagenes bases con dependencias preinstaladas

       - packer https://www.packer.io/

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
PROVISIONADORES                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

File

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: ruby

    Vagrant.configure("2") do |config|
      config.vm.box = "minos/core-16.04"
      config.vm.provision "file", source: "./setup.sh", destination: "~/setup.sh"
      config.vm.synced_folder ".", "/vagrant/"

      config.vm.provider "virtualbox" do |vbox|
        vbox.linked_clone = true
      end
    end
	
    $ time vagrant up --provision; time vagrant ssh

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
PROVISIONADORES                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

Shell

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: ruby
    $adios = <<-SCRIPT #HEREDOCS
    echo "Adios, \\o"
    SCRIPT

    Vagrant.configure("2") do |config|
      config.vm.box = "minos/core-16.04"
      config.vm.provision "shell", inline: "echo Hola Mundo o/"
      config.vm.provision "shell", inline: $adios

      config.vm.provider "virtualbox" do |vbox|
        vbox.linked_clone = true
      end
    end
	
    $ time vagrant up --provision; time vagrant ssh

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
PROVISIONADORES                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

Shell

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: sh
    #!/bin/sh
    set -x; echo 'Hola Mundo o/'; touch ~/javier-estuvo-aqui

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: ruby
    Vagrant.configure("2") do |config|
      config.vm.box = "minos/core-16.04"
      config.vm.provision "shell", path: "script.sh", privileged: false

      config.vm.provider "virtualbox" do |vbox|
        vbox.linked_clone = true
      end
    end
	
    $ time vagrant up --provision; time vagrant ssh

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
PROVISIONADORES                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

Ansible

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: yaml
    - hosts: all
      tasks:
        - name: Hola mundo
          raw: echo Hola mundo o/

        - name: Generar /archivo
          copy: content="" dest=/archivo
          become: yes

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: ruby
    Vagrant.configure("2") do |config|
      config.vm.box = "minos/core-16.04"

      config.vm.provision "ansible" do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "playbook.yml"
      end
    end
	
    $ time vagrant up --provision; time vagrant ssh

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
PLUGINS                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

vagrant-hostmanager-ext: Permite resolver máquinas virtuales por nombres en
lugar de IPs. Útil para entornos multimáquinas, clusters/stacks de software.

    $ vagrant plugin install vagrant-hostmanager-ext

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
------------------------------------------------------------------------------
vagrant-triggers: Ejecuta scripts sobre eventos, arranque / apagado / etc

    $ vagrant plugin install vagrant-triggers

------------------------------------------------------------------------------
vagrant-cachier: Almacena binarios de empaquetadores populares, yum/apt/pip/etc

    $ vagrant plugin install vagrant-cachier

------------------------------------------------------------------------------
|https://github.com/hashicorp/vagrant/wiki/Available-Vagrant-Plugins|

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
VAGRANT                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Caso de uso: Alta disponibilidad con keepalived, haproxy y nginx

                  +---------------------------+       +-------------+
                  |    Keepalive / HAProxy    |_______|    Nginx    | ___
                  |     - - - - / 10.10.10.12 |   |   | 10.10.10.14 |    |
                  +---------------------------+   |   +-------------+    |  R
                                                  |                      |  O
                                                  |                      |  U
 +----------+     +---------------------------+__/ \__+-------------+    |  N
 |  Client  |_____|    Keepalive / HAProxy    |_______|    Nginx    | ___|  D
 |  x.x.x.x |     | 10.10.10.10 / 10.10.10.11 |__   __| 10.10.10.15 |    |
 +----------+     +---------------------------+  \ /  +-------------+    |  R
                                                  |                      |  O
                                                  |                      |  B
                                                  |                      |  I
                  +---------------------------+   |   +-------------+    |  N
                  |    Keepalive / HAProxy    |___|___|    Nginx    | ___|
                  |    - - - -  / 10.10.10.13 |       | 10.10.10.16 |
                  +---------------------------+       +-------------+

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
VAGRANT                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Caso de uso: Alta disponibilidad con keepalived, haproxy y nginx

                  +---------------------------+       +-------------+
                __|    Keepalive / HAProxy    |_______|    Nginx    | ___
               /  |  10.10.10.10/ 10.10.10.12 |   |   | 10.10.10.14 |    |
               |  +---------------------------+   |   +-------------+    |  R
               |                                  |                      |  O
               |                                  |                      |  U
 +----------+  |                                   \__+-------------+    |  N
 |  Client  |__/                                      |    Nginx    | ___|  D
 |  x.x.x.x |                                       __| 10.10.10.15 |    |
 +----------+                                      /  +-------------+    |  R
                                                  |                      |  O
                                                  |                      |  B
                                                  |                      |  I
                  +---------------------------+   |   +-------------+    |  N
                  |    Keepalive / HAProxy    |___|___|    Nginx    | ___|
                  |    - - - -  / 10.10.10.13 |       | 10.10.10.16 |
                  +---------------------------+       +-------------+

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
VAGRANT                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Caso de uso: Alta disponibilidad con keepalived, haproxy y nginx

                  +---------------------------+
                __|    Keepalive / HAProxy    |___.
               /  |  10.10.10.10/ 10.10.10.12 |   |
               |  +---------------------------+   |                         R
               |                                  |                         O
               |                                  |                         U
 +----------+  |                                  |                      ._ N
 |  Client  |__/                                  |                      |  D
 |  x.x.x.x |                                     |                      |
 +----------+                                     |                      |  R
                                                  |                      |  O
                                                  |                      |  B
                                                  |                      |  I
                  +---------------------------+   |   +-------------+    |  N
                  |    Keepalive / HAProxy    |___|___|    Nginx    | ___|
                  |    - - - -  / 10.10.10.13 |       | 10.10.10.16 |
                  +---------------------------+       +-------------+

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
VAGRANT                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Caso de uso: Alta disponibilidad con keepalived, haproxy y nginx

    $ git clone https://github.com/javier-lopez/vagrants
    $ cd vagrants/minos-core-16.04-keepalived-haproxy-nginx
    $ vagrant up && vim Vagranfile

    $ for node in 01 02 03; do
    $   vagrant ssh haproxy-$node.example.com -c "ip addr | grep 10.10.10.10 && echo haproxy-$node has it!"
    $ done

    $ while :; do curl 10.10.10.10; echo ------; sleep 1; done

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
#FIN

                         __
                        /  \          ________________________
                        |  | ° o O  /                         \
                        @  @       | ¿Preguntas / comentarios? |
                        || ||       \_________________________/
                        |\_/|
                         \_/


Consulta ésta presentación en línea:

  * https://github.com/javier-lopez/talks/blob/master/iac/vagrant/
@autoexe{ vim: set tw=78 ts=8 ft=mkd: }
==============================================================================
