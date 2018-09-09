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

  █ CONFIGURACIÓN DE INFRAESTRUCTURA: ANSIBLE

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

    2. Ansible Hello World ............................................... |2|

    3. Ansible bootstrapping ............................................. |3|

    4. Ansible inventarios / baules ...................................... |4|

    5. Ansible playbooks ................................................. |5|

    6. Ansible roles ..................................................... |6|

    7. Caso de uso ....................................................... |7|
        6.1 Docker Swarm Cluster ......................................... |7|

    8. Fin ............................................................... |8|

@autoexe{ vim: set tw=78 ts=8 ft=help: }
==============================================================================
*INTRO*                                      *INFRAESTRUCTURA* *COMO* *CODIGO* - *IAC*

¿Por qué *Ansible* ?: Para aplicar el principio de idempotencia en la
instalación y configuración de software.


    * https://www.youtube.com/watch?v=Nqk_nWAjBus



                           +---------------------------+
                          /     \ /                   /|
                         /     \ /                   / |
                        /     \ /                   /  |
                       +---------------------------+   +
                       |                           |  /
                       |  I D E M P O T E N C I A  | /
                       |                           |/
                       +---------------------------+

@autoexe{ vim: set tw=78 ts=8 ft=help: }
==============================================================================
*INTRO*                                      *INFRAESTRUCTURA* *COMO* *CODIGO* - *IAC*

Ansible vs Chef vs Puppet:

    *PROS*

        * Fácil de aprender / usar
        * Sin dependencias (en comparación con sus pares)
        * Sin agentes

    *CONTRAS*

        * Menos años en el mercado
        * Menor variedad de módulos
        * Sin visualización ni reportes
        * Sin soporte para Windows/MAC OS

@autoexe{ vim: set tw=78 ts=8 ft=help: }
==============================================================================
*INTRO*                                      *INFRAESTRUCTURA* *COMO* *CODIGO* - *IAC*

Ansible vs Shell scripting:

    *PROS*

        * Más fácil de aprender / usar
        * Idempotencia casí asegurada por defecto
        * Variedad de módulos y mejores prácticas preestablecidas
        * Intercambio de archivos

    *CONTRAS*

        * Menos flexible (módulos raw/command/shell)
        * Dependencias (python)

@autoexe{ vim: set tw=78 ts=8 ft=help: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Hello World

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: yaml

    - hosts: localhost
      connection: local
      tasks:
        - name: Hola mundo
          raw: echo Hola mundo o/


    $ ansible-playbook playbook.yml
@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
------------------------------------------------------------------------------
    $ ansible-playbook -vvvvvvvvv playbook.yml

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Hello World

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: yaml

    - hosts: localhost
      connection: local
      tasks:
        - name: Hola mundo
          raw: echo Hola mundo o/
          register: raw_output

        - debug: var=raw_output.stdout_lines


    $ ansible-playbook playbook.yml
@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Bootstrapping

    * Instalar dependencias: python/python-pip
        * Configurar sistema de paquetes yum/apt con proxy / registro
    * Configurar sudo/wheel
    * Generar cuenta del sistema para ansible
    * Agregar llaves ssh

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
------------------------------------------------------------------------------
   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: yaml

    - hosts: all
      remote_user: root # => el usuario ansible aún no existe
      gather_facts: no  # => requiere python, puede o no puede estar

      roles:
        - { role: bootstrap, tags: [ 'init', 'bootstrap' ] }


    $ ansible-playbook --ask-pass playbook.yml

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Inventarios, playbooks y roles.

                            ┬
                            ├── inventories
                            │   ├── prod
                            │   │   └── ...
                            │   └── dev
                            │       └── ...
                            ├── plays
                            │   ├── bootstrap.yml
                            │   ├── common.yml
                            │   └── ...
                            └── roles
                                ├── bootstrap.yml
                                │   └── ...
                                ├── common.yml
                                │   └── ...
                                └── ...


@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Inventarios: variables de entorno, listas de nodos y gestión de secretos

                            ┬
                            ├── prod
                            │   ├── group_vars
                            │   │   └── all
                            │   │       ├── vars.yml
                            │   │       └── vault.ym
                            │   └── hosts
                            └── dev
                                ├── group_vars
                                │   └── all
                                │       ├── vars.yml
                                │       └── vault.ym
                                └── hosts

	
    $ ansible-playbook -i dev/hosts playbook.yml

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Inventarios: variables de entorno, listas de nodos y gestión de secretos

                            ┬
                            └── prod
                                ├── group_vars
                                │   └── all
                                │       ├── vars.yml
                                │       └── vault.ym
                                └── |hosts|

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: ini

    a.ejemplo.com
    b.ejemplo.com #hosts: all
    c.ejemplo.com

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Inventarios: variables de entorno, listas de nodos y gestión de secretos

                            ┬
                            └── prod
                                ├── group_vars
                                │   └── all
                                │       ├── vars.yml
                                │       └── vault.ym
                                └── |hosts|

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: ini

    mail.ejemplo.com

    [webserver] #hosts: webservers
    a.webserver.ejemplo.com
    b.webserver.ejemplo.com

    [db]
    a.db.ejemplo.com

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Inventarios: variables de entorno, listas de nodos y gestión de secretos

                            ┬
                            └── prod
                                ├── group_vars
                                │   └── all
                                │       ├── vars.yml
                                │       └── vault.ym
                                └── |hosts|

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: ini

    [common:children]
    webserver
    db

    [webserver]
    a.webserver.ejemplo.com

    [db]
    a.db.ejemplo.com

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Inventarios: variables de entorno, listas de nodos y gestión de secretos

                            ┬
                            └── prod
                                ├── group_vars
                                │   └── all
                                │       ├── |vars.yml|
                                │       └── vault.ym
                                └── hosts

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: yaml

    domain: ejemplo.com

    system_users:
      - username: ansible
        password: '{{vault_ansible_password}}'
        groups: ['wheel']
        shell: /bin/bash

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Inventarios: variables de entorno, listas de nodos y gestión de secretos

                            ┬
                            └── prod
                                ├── group_vars
                                │   └── all
                                │       ├── vars.yml
                                │       └── |vault.yml|
                                └── hosts

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: yaml

    vault_ansible_password: ansible_password


    $ ansible-vault edit --ask-vault-pass vault.yml

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Playbooks: Permite aplicar roles a cierto grupo de nodos

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: yaml

    - import_playbook: plays/common.yml
      when: not skip_common

    - import_playbook: plays/load-balancer.yml
      when: not skip_load_balancer

    - import_playbook: plays/nfs.yml
      when: not skip_nfs


    $ ansible-playbook playbook.yml -i inventories/prod/hosts -u ansible \
    $ --private-key=~/.ssh/id_rsa --vault-password-file ./vault_pass.txt

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Playbooks: Permite aplicar roles a cierto grupo de nodos

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: yaml

    - hosts: all
      roles:
        - { role: facts,      tags: [ 'common', 'facts' ] }
        - { role: cache-pkgs, tags: [ 'common', 'cache-pkgs' ] }
        - { role: common,     tags: [ 'common' ] }

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Playbooks: Permite aplicar roles a cierto grupo de nodos

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: yaml

    - hosts: load-balancer
      roles:
        - { role: keepalived, tags: [ 'load-balancer', 'keepalived' ] }
        - { role: haproxy,    tags: [ 'load-balancer', 'haproxy' ] }


@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Roles: Instrucciones específicas para instalar/configurar software.

                           ┬
                           └── role
                               ├── files
                               │   └── service.conf
                               ├── handlers
                               │   └── main.yml
                               ├── tasks
                               │   ├── subtask.yml
                               │   └── main.yml
                               └── templates
                                   └── service.conf.j2


@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Roles: Instrucciones específicas para instalar/configurar software.

                           ┬
                           └── role
                               ├── files
                               │   └── service.conf
                               ├── |handlers|
                               │   └── main.yml
                               ├── tasks
                               │   ├── subtask.yml
                               │   └── main.yml
                               └── |templates|
                                   └── service.conf.j2


@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Roles: Instrucciones específicas para instalar/configurar software.

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: yaml

    - name: copy docker config files
      template:
        src:  {{item}}
        dest: /etc/systemd/system/docker.service.d/{{item | basename | regex_replace('\.j2','')}}
      with_items:
        - docker-common.j2
        - docker-storage-{{docker_storage_driver}}.j2
        - docker-network.j2
      notify:
        - restart docker

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Roles: Instrucciones específicas para instalar/configurar software.

                           ┬
                           └── role
                               ├── files
                               │   └── service.conf
                               ├── handlers
                               │   └── main.yml
                               ├── tasks
                               │   ├── subtask.yml
                               │   └── main.yml
                               └── |templates|
                                   └── |service.conf.j2|


@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Roles: Instrucciones específicas para instalar/configurar software.

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: yaml

    nfs_exports:
      - src: "{{persistent_storage_path}}"
        mode: 0777
        options: "*(rw,sync,no_root_squash,insecure)"

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
------------------------------------------------------------------------------
   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: jinja2

    {% for export in nfs_exports %}
    {{export.src}} {{export.options}}
    {% endfor %}

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Roles: Instrucciones específicas para instalar/configurar software.

                           ┬
                           └── role
                               ├── files
                               │   └── service.conf
                               ├── handlers
                               │   └── main.yml
                               ├── tasks
                               │   ├── |subtask.yml|
                               │   └── main.yml
                               └── templates
                                   └── service.conf.j2


@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Roles: Instrucciones específicas para instalar/configurar software.

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: yaml

    - name: itop customization subrole
      include: itop_customization.yml
      when: itop_customization == True

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Caso de uso: Cluster Docker Swarm

 _____________________________________________________________________________
|                                                                             |
|            TRAEFIK                             SERVICES                     |
|    ______________________     __________________________________________    |
|   |                      |   |                                          |   |
|   |  +----------------+  |   |  +----------------+  +----------------+  |   |
|   |  | Docker Manager |  |   |  | Docker Worker  |  | Docker Worker  |  |   |
|   |  |  10.10.10.22   |  |   |  |  10.10.10.14   |  |  10.10.10.14   |  |   |
|   |  +----------------+  |   |  +----------------+  +----------------+  |   |
|   |                      |   |                                          |   |
|   |                      |   |                                          |   |
|   |  +----------------+  |   |  +----------------+  +----------------+  |   |
|   |  | Docker Manager |  |___|  | Docker Worker  |  | Docker Worker  |  |   |
|   |  |  10.10.10.21   |  |   |  |  10.10.10.14   |  |  10.10.10.14   |  |   |
|   |  +----------------+  |   |  +----------------+  +----------------+  |   |
|   |                      |   |                                          |   |
|   |                      |   |                                          |   |
|   |                      |   |                                          |   |
|   |  +----------------+  |   |  +----------------+  +----------------+  |   |
|   |  | Docker Manager |  |   |  | Docker Worker  |  | Docker Worker  |  |   |
|   |  |  10.10.10.23   |  |   |  |  10.10.10.14   |  |  10.10.10.14   |  |   |
|   |  +----------------+  |   |  +----------------+  +----------------+  |   |
|   |______________________|   |__________________________________________|   |
|                                                                             |
|_____________________________________________________________________________|

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
ANSIBLE                                    INFRAESTRUCTURA COMO CÓDIGO - IAC
-------

Caso de uso: Cluster Docker Swarm

    $ git clone https://github.com/javier-lopez/vagrants
    $ cd vagrants/minos-core-16.04-docker-swarm-ansible
    $ vagrant up && vim Vagranfile

    $ open monitor.example.com
    $ while :; do curl -k -L --header 'Host: echo.example.com' http://10.10.10.10; sleep 1; done

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

  * https://github.com/javier-lopez/talks/blob/master/iac/ansible/

@autoexe{ vim: set tw=78 ts=8 ft=mkd: }
==============================================================================
