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

  █ CONTENEDORES DE SOFTWARE: DOCKER - DOCKER COMPOSE

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

    2. Docker Hello World ................................................ |2|

    3. Docker Hub ........................................................ |3|

    4. Dockerfile ........................................................ |4|

        4.1 Caso de uso: aplicación python ............................... |4|

    5. Docker-compose..................................................... |5|

        5.1 Volumenes, redes / secretos / variables de entorno ........... |5|

        5.2 Caso de uso: aplicación python/flask/mongodb/nginx ........... |5|

    6. Fin ............................................................... |6|

@autoexe{ vim: set tw=78 ts=8 ft=help: }
==============================================================================
*INTRO*                                      *INFRAESTRUCTURA* *COMO* *CODIGO* - *IAC*

¿Por qué *Docker* ?: |En| |equipos| |de| |desarrollo|

Sin Docker

    * José se incorpora a un equipo de desarrollo que trabaja en un proyecto
      REST con Java 8, SpringBoot, Hibernate/PostgreSQL y Gradle. Se le asigna
      equipo y pasa la primera semana instalando dependencias y configurando
      el proyecto para visualizarlo en su máquina.

Con Docker

    * Jimena se incorpora a un equipo que utiliza Docker, despues de obtener
    su equipo, descarga la última versión del proyecto y ejecuta
    docker-compose up, el proyecto es visible inmediatamente. Puede comenzar a
    experimentar con el código ese mismo día.

@autoexe{ vim: set tw=78 ts=8 ft=help: }
==============================================================================
*INTRO*                                      *INFRAESTRUCTURA* *COMO* *CODIGO* - *IAC*

¿Por qué *Docker* ?: |En| |QA|

Sin Docker

    * Carmen debe asegurarse que los proyectos de 5 equipos de desarrollo no
      contengan errores graves, intercambia entre Java 5/6/7/8, Python 2/3,
      NodeJS 8/9/10 y docenas de manuales para instalar los proyectos y
      generar/ejecutar las pruebas unitarias/integración/estrés.

Con Docker

    * Marcos es tester en una organización que ha adoptado docker, debido a
    que los desarrollos son facilmente replicables puede concentrarse en la
    generación de pruebas automatizadas, los errores que descubre son
    replicables en los equipos de desarrollo pues no dependen de su entorno.

@autoexe{ vim: set tw=78 ts=8 ft=help: }
==============================================================================
*INTRO*                                      *INFRAESTRUCTURA* *COMO* *CODIGO* - *IAC*

¿Por qué *Docker* ?: |En| |ambientes| |productivos|

Sin Docker

    * La liberación de un nuevo servicio de autenticación ha dejado fuera de
    línea proyectos dependientes, Federico reconfigura la versión anterior
    para evitar perdidas económicas, el procedimiento es relativamente
    complejo por lo que la organización trata los eventos de liberación con
    especial interes, hay un miedo constante de romper sistemas.

Con Docker

    * Monica hace lo mismo en una fracción del tiempo, 10 minutos. Los
    procedimientos de actualización son indoloros y frecuentes, se hacen
    varias veces al día, y cuando no funcionan se revierten automaticamente
    (blue/green) gracias a la automatización incorporada en el cluster de
    contenedores (kubernetes/swarm/nomad) que ha adoptado su organización.

@autoexe{ vim: set tw=78 ts=8 ft=help: }
==============================================================================
*INTRO*                                      *INFRAESTRUCTURA* *COMO* *CODIGO* - *IAC*

*Docker* Contenedores: Plantilla de archivos + Punto de entrada |/bin/sh| |-c|

                            +---------------------------+
         Entry Point =====> | /usr/bin/my-app           |
                            | /etc/sudoers.d            |
                            | /bin/bash                 |
                            +---------------------------+

@autoexe{ vim: set tw=78 ts=8 ft=help: }
==============================================================================
*INTRO*                                      *INFRAESTRUCTURA* *COMO* *CODIGO* - *IAC*

*Docker* Contenedores: Plantilla de archivos + Punto de entrada |/bin/sh| |-c|

                            +---------------------------+
         Entry Point .      | /usr/bin/my-app           |
                     \\     | /etc/sudoers.d            |
                      `===> | /bin/bash                 |
                            +---------------------------+

@autoexe{ vim: set tw=78 ts=8 ft=help: }
------------------------------------------------------------------------------
*Docker-compose* Lanzador de servicios basados en contenedores.

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
DOCKER                                     INFRAESTRUCTURA COMO CÓDIGO - IAC
------

Hello World

    $ time docker run hello-world

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
------------------------------------------------------------------------------
¿Qué ha pasado?

------------------------------------------------------------------------------
    * docker busca el contenedor 'hello-world' en localhost
------------------------------------------------------------------------------
    * al no encontrarlo va a los repositorios (registry) configurados,
      por defecto https://hub.docker.com/
------------------------------------------------------------------------------
    * descarga 'hello-world' de https://hub.docker.com/_/hello-world/
------------------------------------------------------------------------------
    * abre el contenedor y ejecuta el entrypoint => /hello

    $ docker inspect hello-world
    $ docker inspect --format='{{.Config.Entrypoint}} {{.Config.Cmd}}' hello-world

------------------------------------------------------------------------------
    $ docker image save hello-world | tar tvf -
    $ docker image save hello-world | tar xvf - d5b5217f651efe128acfb40d64189afd61c4329cdecf0acba2ed522676b55e67/layer.tar
    $ vim d5b5217f651efe128acfb40d64189afd61c4329cdecf0acba2ed522676b55e67/layer.tar

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
DOCKER                                     INFRAESTRUCTURA COMO CÓDIGO - IAC
------

¿Qué pasa si se vuelve a instanciar Hello World?

    $ time docker run hello-world

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
------------------------------------------------------------------------------
Esta vez es mucho más rapido, ¿por qué?

------------------------------------------------------------------------------
    * docker busca el contenedor 'hello-world' en localhost
------------------------------------------------------------------------------
    * al **encontrarlo** ejecuta su entrypoint => /hello
------------------------------------------------------------------------------
    * tiempo total?, algunos segundos

------------------------------------------------------------------------------
Lo importante: una vez **dockerizada** una aplicación puede ejecutarse desde
cualquier lugar donde se encuentre instalado docker en minutos.

==============================================================================
DOCKER                                     INFRAESTRUCTURA COMO CÓDIGO - IAC
------

Contenedores oficiales vs no oficiales. EntryPoints / CMD.

    $ time docker run hello-world
    $ time docker run alpine:latest 'echo' 'hola mundo'
    $ time docker run --entrypoint sh jlpz/gotty:2.0.0-alpha.3 '-c' 'echo hola mundo'

------------------------------------------------------------------------------
                            +---------------------------+
         Entry Point =====> | /usr/bin/my-app           |
                            | /etc/sudoers.d            |
                            | /bin/bash                 |
                            +---------------------------+

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
DOCKER                                     INFRAESTRUCTURA COMO CÓDIGO - IAC
------

Contenedores oficiales vs no oficiales. EntryPoints / CMD.

    $ time docker run hello-world
    $ time docker run alpine:latest 'echo' 'hola mundo'
    $ time docker run --entrypoint sh jlpz/gotty:2.0.0-alpha.3 '-c' 'echo hola mundo'

    $ docker inspect --format='{{.Config.Entrypoint}} {{.Config.Cmd}}' hello-world
    $ docker inspect --format='{{.Config.Entrypoint}} {{.Config.Cmd}}' alpine
    $ docker inspect --format='{{.Config.Entrypoint}} {{.Config.Cmd}}' jlpz/gotty:2.0.0-alpha.3

------------------------------------------------------------------------------
En resumen:

    * Contenedores no oficiales: usuario/contenedor:etiqueta
------------------------------------------------------------------------------
    * Entrypoint es el comando que ejecuta el contenedor con CMD como los
      parametros, si el Entrypoint es nulo entonces es igual a `/bin/sh -c`

==============================================================================
DOCKER                                     INFRAESTRUCTURA COMO CÓDIGO - IAC
------

Contenedores propios: Dockerfiles

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: sh

    #!/bin/sh
    echo 'mi primer contenedor'

------------------------------------------------------------------------------
   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: docker

    FROM alpine:3.8
    COPY script.sh /ruta/rara/script.sh
    CMD  /ruta/rara/script.sh
	
@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
------------------------------------------------------------------------------
    $ time docker build . -t mi-contenedor-1
    $ time docker run mi-contenedor-1

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
DOCKER                                     INFRAESTRUCTURA COMO CÓDIGO - IAC
------

Contenedores propios: Dockerfiles

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: sh

    #!/bin/sh
    echo 'mi segundo contenedor'

------------------------------------------------------------------------------
   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: docker

    FROM alpine:3.8
    COPY script.sh /usr/bin/script.sh
    CMD  script.sh
	
@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
------------------------------------------------------------------------------
    $ time docker build . -t mi-contenedor-2; time docker run mi-contenedor-2
    $ time docker login; time docker tag mi-contenedor-2 jlpz/mi-contenedor-2
    $ time docker push jlpz/mi-contenedor-2
    $ time docker run  jlpz/mi-contenedor-2

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
DOCKER                                     INFRAESTRUCTURA COMO CÓDIGO - IAC
------

Contenedores propios: Dockerfile

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: sh

    #!/bin/sh
    echo 'mi tercer contenedor puede leer datos de /archivo.txt, su contenido es:'
    cat  /archivo.txt

------------------------------------------------------------------------------
   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: docker

    FROM alpine:3.8
    RUN  echo 'o.o/' > /archivo.txt
    COPY script.sh /usr/bin/script.sh
    CMD  script.sh
	
@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
------------------------------------------------------------------------------
    $ time docker build . -t mi-contenedor-3
    $ time docker run mi-contenedor-3

------------------------------------------------------------------------------
    $ time docker run -v /etc/issue.net:/archivo.txt:ro mi-contenedor-3
    $ time docker run -v $PWD/script.sh:/archivo.txt:ro mi-contenedor-3

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
DOCKER                                     INFRAESTRUCTURA COMO CÓDIGO - IAC
------

Contenedores propios: Dockerfile

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: sh

    #!/bin/sh
    echo 'mi cuarto contenedor es un servidor web!'; cd ${1:-/}
    env python -m http.server 1111

------------------------------------------------------------------------------
   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: docker

    FROM python:alpine
    RUN  apk add curl
    COPY script.sh /usr/bin/script.sh
    EXPOSE 1111
    CMD  script.sh
	
@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
------------------------------------------------------------------------------
    $ time docker build . -t mi-contenedor-4
    $ time docker run mi-contenedor-4 #curl localhost:1111
    $ docker ps
    $ docker stop $(docker ps | awk '/mi-contenedor-4/{print $1}')

==============================================================================
DOCKER                                     INFRAESTRUCTURA COMO CÓDIGO - IAC
------

Contenedores propios: Dockerfile

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: sh

    #!/bin/sh
    echo 'mi cuarto contenedor es un servidor web!'; cd ${1:-/}
    env python -m http.server 1111

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: docker

    FROM python:alpine
    RUN  apk add curl
    COPY script.sh /usr/bin/script.sh
    EXPOSE 1111
    CMD  script.sh
	
    $ time docker run -it mi-contenedor-4
    $ curl localhost:1111
    $ time docker exec $(docker ps | awk '/mi-contenedor-4/{print $1}') curl localhost:1111
@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
DOCKER                                     INFRAESTRUCTURA COMO CÓDIGO - IAC
------

Contenedores propios: Dockerfile

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: sh

    #!/bin/sh
    echo 'mi cuarto contenedor es un servidor web!'; cd ${1:-/}
    env python -m http.server 1111

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: docker

    FROM python:alpine
    RUN  apk add curl
    COPY script.sh /usr/bin/script.sh
    EXPOSE 1111
    CMD  script.sh
	
    $ time docker run -it -p 8000:1111 mi-contenedor-4
    $ curl localhost:1111
    $ curl localhost:8000
    $ time docker exec $(docker ps | awk '/mi-contenedor-4/{print $1}') curl localhost:1111
    $ time docker exec $(docker ps | awk '/mi-contenedor-4/{print $1}') curl localhost:8000
@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
DOCKER                                     INFRAESTRUCTURA COMO CÓDIGO - IAC
------

Contenedores propios: Dockerfile

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: sh

    #!/bin/sh
    echo 'mi cuarto contenedor es un servidor web!'; cd ${1:-/}
    env python -m http.server 1111

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: docker

    FROM python:alpine
    RUN  apk add curl
    COPY script.sh /usr/bin/script.sh
    EXPOSE 1111
    CMD  script.sh
	
    $ time docker run -it -p 8000:1111 mi-contenedor-4

                            +---------------------------+
         Entry Point => 8000:1111 /usr/bin/my-app       |
                            | /etc/sudoers.d            |
                            | /bin/bash                 |
                            +---------------------------+

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
DOCKER                                     INFRAESTRUCTURA COMO CÓDIGO - IAC
------

Caso de uso: Aplicación web - python

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: python

    from flask import Flask
    app = Flask(__name__)

    @app.route("/")
    @app.route("/<name>")
    def hello(name="anónimo"):
        return "Hola {}!, bienvenido a mi app o.o/\n".format(name)

    if __name__ == "__main__":
        app.run(host='0.0.0.0', debug=True)

------------------------------------------------------------------------------
   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: docker

    FROM python:alpine

    RUN  pip install flask
    RUN  mkdir -p /usr/src/app
    COPY app.py /usr/src/app

    WORKDIR /usr/src/app
    CMD [ "python", "app.py" ]
@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
DOCKER                                     INFRAESTRUCTURA COMO CÓDIGO - IAC
------

Caso de uso: Aplicación web - python

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: python

    from flask import Flask
    app = Flask(__name__)

    @app.route("/")
    @app.route("/<name>")
    def hello(name="anónimo"):
        return "Hola {}!, bienvenido a mi app o.o/\n".format(name)

    if __name__ == "__main__":
        app.run(host='0.0.0.0', debug=True)
	
    $ time docker build . -t flask-app
    $ time docker run -v $PWD/app.py:/usr/src/app/app.py -it -p 8000:5000 flask-app
    $ curl localhost:8000
@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
DOCKER                                     INFRAESTRUCTURA COMO CÓDIGO - IAC
------

Caso de uso: Aplicación web - python

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: python

    from flask import Flask
    app = Flask(__name__)

    @app.route("/")
    @app.route("/<name>")
    def hello(name="anónimo"):
        return "Hola {}!, bienvenido a mi app o.o/\n".format(name)

    @app.route("/adios")
    @app.route("/adios/<name>")
    def bye(name="anónimo"):
        return "Adios {}!, vuelve pronto\n".format(name)

    if __name__ == "__main__":
        app.run(host='0.0.0.0', debug=True)
	
    $ curl localhost:8000/adios/javier
@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
DOCKER-COMPOSE                             INFRAESTRUCTURA COMO CÓDIGO - IAC
--------------

Shell scripts vs Docker-compose:

    $ docker build . -t flask-app
    $ docker run -v $PWD/app.py:/usr/src/app/app.py -it -p 8000:5000 flask-app

   ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: code:: yaml

    version: '3.4' #comentario

    services:
      app:
        build: .
        image: jlpz/flask-app
        ports:
          - "8000:5000"
        volumes:
          - ./app.py:/usr/src/app/app.py
	
    $ docker-compose up
    $ docker-compose push

   - Convención sobre configuración
   =================================
@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
DOCKER-COMPOSE                             INFRAESTRUCTURA COMO CÓDIGO - IAC
--------------

Caso de uso: Aplicación python/flask/mongodb/nginx

    $ git clone https://github.com/javier-lopez/docker-flask-hello-world-mongodb
    $ cd docker-flask-hello-world-mongodb
    $ docker-compose up

                                     +--------------------------------------+
                                     |               BACKEND                |
    +----------+     +-------------+ |  +-------------+    +-------------+  |
    | Cliente  |_____|    Nginx    |_|__|     App     |____|   MongoDB   |  |
    | x.x.x.x  |     |     5000    | |  |     8000    |    |    17017    |  |
    +----------+     +-------------+ |  +-------------+    +-------------+  |
                                     |                                      |
                                     +--------------------------------------+

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
DOCKER-COMPOSE                             INFRAESTRUCTURA COMO CÓDIGO - IAC
--------------

Caso de uso: Aplicación python/flask/mongodb/nginx

    * Volumenes, redes / secretos / variables de entorno

    $ curl localhost:5000

                                     +--------------------------------------+
                                     |                BACKEND               |
    +----------+   +-------------+   |   +-------------+   +-------------+  |
    | Cliente  |___|    Nginx    |___|___|     App     |___|   MongoDB   |  |
    | x.x.x.x  |   |     5000    |   |   |     8000    |   |    17017    |  |
    +----------+   +-------------+   |   +-------------+   +-------------+  |
                                     |                                      |
                                     +--------------------------------------+

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

  * https://github.com/javier-lopez/talks/blob/master/iac/docker-compose/
@autoexe{ vim: set tw=78 ts=8 ft=mkd: }
==============================================================================
