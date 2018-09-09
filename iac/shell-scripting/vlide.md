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

  █ INFRAESTRUCTURA COMO CÓDIGO: SHELL SCRIPTING

  ★　 .   ° .　    　 ° 　.   .　　★　　°    ☆ 　     .　　  　★ 　★　 :.
   .　　     .　　      ★　 .   ° .　  　. 　¸.     ★　 .   ° .　  　. 　¸.
  ★　 .  　__▄     ☆ ¸.     https://www.meetup.com/Infraestructura-como-codigo
 ☆ ¸. ¸.    ╚▌   　.　.     .         ★ 　　  °   ☆           .　　 　　  °
 　 .○ °    ██                ¸       ▄        ☆          ☆ ¸. ¸.   .　　★
 .　　★　   ▐█  °☆ 　☾             ▄█████▄   .   ° 　         Septiembre, 2018
            ▐█    ★        ☆     ╓██▀▀▀▀▀██,       ¸•   ° ★　 .   °    ★　 .
   __ ╟░b   ▐█                  ⌡███████████,   ° ★          https://javier.io
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

    2. Hello World ....................................................... |2|

    3. Estándar POSIX .................................................... |3|

    4. Variables y tipos de datos ........................................ |4|

    5. Instrucciones de control de flujo, if/else/for/while/switch ....... |5|

    6. Funciones ......................................................... |6|

    7. Técnicas de depuración/profiling/linting .......................... |7|

    8. Caso de uso
        8.1 Post instalador de programas ................................. |8|

    9. Fin ............................................................... |9|

@autoexe{ vim: set tw=78 ts=8 ft=help: }
==============================================================================
*INTRO*                                      *INFRAESTRUCTURA* *COMO* *CODIGO* - *IAC*

¿Por qué *Shell* *Scripting* ?: Para aplicar el principio de la composición
en software. UNIX como IDE.

Ventajas:

    + Omnipresente en cada sistema Unix vigente
    + Fácil de aprender y manipular
    + Código pegamento por excelencia

Desventajas:

    - Multitud de implementaciónes, POSIX
    - Sin libreria estándar
    - La sintaxis puede ser algo confusa
    - Limitado en comparación con otros lenguajes como Perl/Python/Ruby
    - Lento
@autoexe{ vim: set tw=78 ts=8 ft=help: }
==============================================================================
*INTRO*                                      *INFRAESTRUCTURA* *COMO* *CODIGO* - *IAC*

*Shell* *Scripting* es un lenguaje simple, su máximo poder viene de otras
herrmientas:

    * core-utils: cat/ls/rm/basename/dirname/cut/date/kill/...
    * sed/grep
    * awk/perl/expect

Y de un conocimiento general del SO

    * manejo de archivos / procesos / tuberias


    ┃                             ┃ ┃ ┃┃          ┃┃  ┗┛      ┃ ┃━━━┛ ┃ ┃
    ┃                             ┃ ┃ ┃┃          ┃┃          ┃ ┃   ┏━━━┛
    ┃    ┏━━━━━━┓                 ┃ ┗━━━┓         ┃┗━━━━━━━━━━━━┛   ┃ ┃
    ┃    ┃      ┃                 ┃   ┃┃┗━━━━━━━┓ ┃           ┃     ┃ ┃
    ┃    ┃      ┗━━┏━┓━━━━━━━━━━━━┃   ┃┃ ┏━━┓   ┃ ┃      ┏━━━━┛     ┗━┛
    ┃    ┃      ┃  ┃ ┃   ┃        ┃   ┃┃ ┃  ┃   ┗━┃┓ ┏━━━┃━━━━┓
    ┃    ┃      ┗  ┃ ┃   ┃        ┃━━━┛┃ ┗━━━━━━━━┃┃ ┃   ┃    ┃
    ┗━━━━━━━━━━━━━━┛ ┃   ┃        ┃    ┗━━━━┛     ┃┃ ┃   ┗━━━┓┃
         ┃           ┃   ┃        ┃               ┃┃ ┃       ┃┃
         ┃           ┃   ┃        ┃        ┏━━━━━━┃┛ ┃       ┃┃
         ┃           ┃┏━━━━━━━┓━━━┗━━┓     ┃      ┃  ┃       ┃┃
         ┃           ┃┃  ┃   ┗┛     ┃┃     ┃      ┃  ┃       ┗┛
         ┃           ┃┃  ┗━┓   ┏━━━━┛┗┓    ┗━━━━━━┃━━┛
         ┃           ┃┃    ┃   ┃      ┃           ┃


@autoexe{ vim: set tw=78 ts=8 ft=help: }
==============================================================================
SHELL SCRIPTING                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

Hello World

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: sh

   #!/bin/sh
   echo "Hello World"


    $ chmod +x script.sh
    $ time ./script.sh

    $ time bash|zsh|ksh|dash ./script.sh

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
SHELL SCRIPTING                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

Estándar POSIX:

    Implementación mínima de una shell a partir de KSH 1982

                ┬
                ├── sh => bourne shell
                │   ├── csh => basada en C
                │   │   ├── |ksh| => korn shell, y base del estándard POSIX
                │   │   │   ├── bash
                │   │   │   ├── zsh
                │   │   │   ├── fish
                │   │   │   ├── dash
                │   │   │   ├── sh (*BSD)

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
SHELL SCRIPTING                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

Bashisms: https://mywiki.wooledge.org/Bashism

    Características especificas de Bash: |#!/bin/bash|

               POSIX               ||          BASHISM
          ======================================================
              hola() {             VS       function hola() {
              printf               VS       echo
              set $@               VS       arreglos
              [                    VS       [[
              case/grep            VS       cadena = *patron

    $ ./script.bash

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
SHELL SCRIPTING                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

En esta presentación seguiremos el principio WORA y nos concentraremos en
*POSIX* shell scripting con la finalidad de hacer nuestros scripts compatibles
con ksh/bash/dash/zsh en Linux/MACOS/*BSD/CYGWIN.

                                    ,----..
                           .---.   /   /   \  ,-.----.      ,---,
                          /. ./|  /   .     : \    /  \    '  .' \
                      .--'.  ' ; .   /   ;.  \;   :    \  /  ;    '.
                     /__./ \ : |.   ;   /  ` ;|   | .\ : :  :       \
                 .--'.  '   \' .;   |  ; \ ; |.   : |: | :  |   /\   \
                /___/ \ |    ' '|   :  | ; | '|   |  \ : |  :  ' ;.   :
                ;   \  \;      :.   |  ' ' ' :|   : .  / |  |  ;/  \   \
                 \   ;  `      |'   ;  \; /  |;   | |  \ '  :  | \  \ ,'
                  .   \    .\  ; \   \  ',  / |   | ;\  \|  |  '  '--'
                   \   \   ' \ |  ;   :    /  :   ' | \.'|  :  :
                    :   '  |--"    \   \ .'   :   : :-'  |  | ,'
                     \   \ ;        `---`     |   |.'    `--''
                      '---"                   `---'

                               WRITE ONCE RUN ANYWHERE


@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
SHELL SCRIPTING                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

Variables, y tipos de datos.

Shell scripting es tan simple que solo soporta 2 tipos de datos:

    - |Numeros|
    - Cadenas de texto

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: sh

   #!/bin/sh

   uno="1"
   dos=2

   printf "%s\\n" "Resultado: $((uno + dos))"

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
SHELL SCRIPTING                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

Variables, y tipos de datos.

Shell scripting es tan simple que solo soporta 2 tipos de datos:

    - Numeros
    - |Cadenas| |de| |texto|

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: sh

   #!/bin/sh

   saludo="hola mi nombre es"
   nombre='javier'

   saludo_completo="${saludo} ${nombre}"

   printf "%s\\n" "${saludo_completo}"

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
SHELL SCRIPTING                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

Instrucciones de control de flujo.

    |if/else|

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: sh

   #!/bin/sh

   if [ -z "${1}" ]; then
       nombre="anonimo"
   else
       nombre="${1}"
   fi

   printf "%s\\n" "Hola ${nombre} o.o/"

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
SHELL SCRIPTING                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

Instrucciones de control de flujo.

    |if/else|

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: sh

   #!/bin/sh

   if test -z "${1}"; then
       nombre="anonimo"
   else
       nombre="${1}"
   fi

   printf "%s\\n" "Hola ${nombre} o.o/"

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
SHELL SCRIPTING                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

Instrucciones de control de flujo.

    |if/else|

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: sh

   #!/bin/sh

   if ! printf "%s" "${1}" | grep ".*" >/dev/null 2>&1; then
       nombre="anonimo"
   else
       nombre="${1}"
   fi

   printf "%s\\n" "Hola ${nombre} o.o/"

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
SHELL SCRIPTING                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

Instrucciones de control de flujo.

    |for|

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: sh

   #!/bin/sh

    for file in *; do
        [ -e "${file}" ] || continue
        printf "%s\\n" "${file} => $(du -sh "${file}"|cut -f1)"
    done


@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
SHELL SCRIPTING                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

Instrucciones de control de flujo.

    |for|

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: sh

   #!/bin/sh

    for file in $(ls); do #MAL; MAL; MAL!, http://mywiki.wooledge.org/ParsingLs
        [ -e "${file}" ] || continue
        printf "%s\\n" "${file} => $(du -sh "${file}"|cut -f1)"
    done


@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
SHELL SCRIPTING                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

Instrucciones de control de flujo.

    |while|

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: sh

   #!/bin/sh

    countdown="10"

    while [ "${countdown}" -gt "0" ]; do
        printf "%s\\n" "${countdown} segundos para la detonación ..."
        sleep 1; countdown="$((countdown - 1))"
    done

    printf "%s\\n" "BOOOOOOOOOOOOOOOOOOOOOOOOOM!"

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
SHELL SCRIPTING                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

Funciones.

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: sh

   #!/bin/sh

    _is_root() { #current user is root?
        [ X"$(whoami)" = X"root" ]
    }

    _is_root || {
        printf "%s\\n" "Este script solo puede ejecutarse por el administrador" >&2
        exit 1
    }

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
SHELL SCRIPTING                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

Funciones.

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: sh

   #!/bin/sh

    _1stchar() { #return first char of a string
        [ -z "${1}" ] && return 1
        local substr="${1#?}"
        printf "%s\\n" "${1%$substr}"
    }

    nombre="Javier"; letra_inicial="$(_1stchar "${nombre}")"

    printf "%s\\n" "${nombre} empieza con ${letra_inicial}"

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
SHELL SCRIPTING                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

Funciones.

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: sh

   #!/bin/sh

    _validmail() { #verify if an email is valid, return 1 on failure
        case "${1}" in
            *@*.*) return 0 ;;
            *|"")  return 1 ;;
        esac
    }

    if ! _validmail "${1}"; then
        printf "%s\\n" "${1} no es una dirección de correo válida"
    fi

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
SHELL SCRIPTING                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

Depuración / Profiling / Linting

    $ bash -x ./script.sh

    $ curl https://github.com/javier-lopez/learn/blob/master/sh/tools/shell-profiler
    $ time ./script.sh && shell-profiler ./script.sh

    https://www.shellcheck.net/


                                    ___________
                                   |.---------.|
                                   ||         ||
                                   || $       ||
                                   ||         ||
                                   |'---------'|
                                    `)__ ____('
                                    [=== -- o ]--.
                                  __'---------'__ \
                                 [::::::::::: :::] )
                                  `""'"""""'""""`/T\
                                                 \_/

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
SHELL SCRIPTING                            INFRAESTRUCTURA COMO CÓDIGO - IAC
---------------

Caso de uso: Posinstalador de software.

Problema, algunos paquetes de software se encuentran desactualizados en los
canales de software de las distribuciones, automaticemos la instalación de
dichos paquetes desde la página web del fabricante.

    $ git clone --depth=1 https://github.com/javier-lopez/learn
    $ cd sh/is/
    $ vim postinstall-minos

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

  * https://github.com/javier-lopez/talks/blob/master/iac/shell-scripting/

@autoexe{ vim: set tw=78 ts=8 ft=mkd: }
==============================================================================
