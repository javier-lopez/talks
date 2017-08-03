__-  　★　  :.　 . 　 *　.    　..　   ☆•   ° ★　 .　  　.              .
                                                              ¸•   ° ★　 .   °
.　  °☆ 　.      .　     █  PROGRAMACIÓN DE PLUGINS PARA        ☆•     ★　 .
  .　 *　.　.     　 °                                           ★    　 :    .
                   　 ° 　.   .　　★　　°    ☆ 　     .　　  　★ 　★　 :.
  •   ° ★　 .　  　.　.　　¸  　　   　            ° ★　 .   ° .　  　. 　¸.
　 . • °                              ██            ¸       .　　★　　★ °   ☆
   　　　.　  °☆ 　. *              //       　　　　        :     .
.     ★　 .　 *　.　.　　    ██    ██ ██  ▓▓▓▓▓▓▓▓▓▓ 　　 ° 　¸.       ¸ .
.  ° 　.   .　　★　　       /██   /██/██//▓▓//▓▓//▓▓　     .　　★  　　★   ☆
 . . •                      //██ /██ /██ /▓▓ /▓▓ /▓▓
.  　　　 　  °☆ 　.         //████  /██ /▓▓ /▓▓ /▓▓　　　★　°  .  　 . •    ★
   ° 　    .　　 　　.        //██   /██ ▓▓▓ /▓▓ /▓▓　     .　　   　　★
  ○ °  　  　  　.　.　　      //    // ///  //  // 　　 ° 　¸.       ¸ .
 .   • °   °  ☆                                　　  　:.     .　　★      ☆
   .　　     .　　      ★　 .   ° .　  　. 　¸.     ★　 .   ° .　  　. 　¸.
  ★　 .  　__▄     ☆ ¸.   ☆ ¸. ¸.   .　　★　　  °   ☆           .　　 　　  °
 ☆ ¸. ¸.    ╚▌   　.　.     .           https://www.meetup.com/cdmx-vim-meetup/
 　 .○ °    ██                ¸       ▄        ☆          ☆ ¸. ¸.   .　　★
 .　　★　   ▐█  °☆ 　☾             ▄█████▄   .   ° .　 Julio 27, 2017, Vim-CDMX
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
    let err_msg.=", por favor cree una e invoque esta presentación desde ahi"
    if !exists('$TMUX') | echo err_msg | endif
    echohl None
@end
==============================================================================
*CONTENIDOS*

    1. Intro ............................................................. |3|
    2. Autores prominentes ............................................... |1|
    3. Librerias ......................................................... |4|
    4. Tipos de plugins .................................................. |2|
    5. Documentacion ..................................................... |3|
    6. Caso de uso, vlide.vim ............................................ |4|
       6.1 RDD, desarrollo orientado a documentacion ..................... |4|
       6.2 Estructura general ............................................ |4|
       6.2 Variables ..................................................... |4|
       6.3 Funciones de usuario .......................................... |4|
       6.4 Comandos ...................................................... |4|
       6.5 Mapeos ........................................................ |4|
       6.6 Listas y diccionarios ......................................... |4|
       6.7 Depuración .................................................... |4|
       6.8 Pruebas unitarias, Vader ...................................... |4|
       6.9 Integración continua, Travis-CI ............................... |4|
       6.10 Publicación .................................................. |4|
       6.11 Gestores de plugins .......................................... |4|
    7. Fin ............................................................... |4|

@autoexe{ vim: set tw=78 ts=8 ft=help: }
==============================================================================
INTRO
-----

Como programadores pasamos mucho tiempo en editores de texto (o en IDEs), no es
de extrañar entonces que dichos entornos sean altamente configurables, incluyan
características avanzadas y puedan ser extendidos.

@autoexe{ vim: set tw=78 ts=8 ft=markdown: }
------------------------------------------------------------------------------
Un editor propiamente configurado puede afectar directamente la calidad y
cantidad de nuestro trabajo.

------------------------------------------------------------------------------
Por ejemplo, partiendo del siguiente código en C desordenado, Vim puede:

@autoexe{sh}
    cat << EOF > /tmp/vlide_monkey_typer.c
#include <stdio.h>
                #include <assert.h>

char * as_i_get_older_my_variables_get_longer = "monkey typer";

int randint(int n) {
if ((n - 1) == RAND_MAX) {
return rand();
  } else {
    // Chop off all of the values that would cause skew...
long end = RAND_MAX / n; // truncate skew
            assert (end > 0L);
end *= n;
}
}
EOF

    tmux split-window -v -p 50
    tmux send-keys -t1 'vim /tmp/vlide_monkey_typer.c'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end

------------------------------------------------------------------------------
    * identar
------------------------------------------------------------------------------
@autoexe{sh}
    tmux send-keys -t1 'gg'
    tmux send-keys -t1 '='
    tmux send-keys -t1 'G'
    tmux select-pane -t0
@end

------------------------------------------------------------------------------
    * autocompletar variables / funciones
------------------------------------------------------------------------------
@autoexe{sh}
    tmux send-keys -t1 'G'
    tmux send-keys -t1 'o'
    tmux send-keys -t1 C-M
    tmux send-keys -t1 'a'; sleep 0.5
    tmux send-keys -t1 's'; sleep 0.5
    tmux send-keys -t1 '_'; sleep 0.5
    tmux send-keys -t1 'i';
    tmux select-pane -t0
@end

------------------------------------------------------------------------------
    * expandir snippets
------------------------------------------------------------------------------
@autoexe{sh}
    tmux send-keys -t1 C-M; sleep 0.5
    tmux send-keys -t1 C-M;
    tmux send-keys -t1 C-M;
    tmux send-keys -t1 'm'; sleep 0.5
    tmux send-keys -t1 'a'; sleep 0.5
    tmux send-keys -t1 'i'; sleep 0.5
    tmux send-keys -t1 'n'; sleep 2
    tmux send-keys -t1 Tab
    tmux select-pane -t0
@end

------------------------------------------------------------------------------
    * consultar referencias
------------------------------------------------------------------------------
@autoexe{sh}
    tmux send-keys -t1 Escape
    tmux send-keys -t1 dd
    tmux send-keys -t1 ':h crv-assert'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end

------------------------------------------------------------------------------
    * navegar entre funciones / variables / archivos
------------------------------------------------------------------------------
@autoexe{sh}
    tmux send-keys -t1 ':q'
    tmux send-keys -t1 C-M
    tmux send-keys -t1 Escape
    tmux send-keys -t1 ',d' #enter XDevelopmentMode
    tmux select-pane -t0
@end

------------------------------------------------------------------------------
    * notificar errores, advertencias o mensajes externos
------------------------------------------------------------------------------
@autoexe{sh}
    tmux send-keys -t1 ',d' #exit XDevelopmentMode
    tmux send-keys -t1 ':w!'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end

------------------------------------------------------------------------------
    * compilar y ejecutar pruebas
------------------------------------------------------------------------------
@autoexe{sh}
    cat << 'EOF' > /tmp/vlide_monkey_typer.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <time.h>

char alphabet[] = "abcdefghijklmnopqrstuvwxyz ";

int randint(int n) {
  if ((n - 1) == RAND_MAX) {
    return rand();
  } else {
    long end = RAND_MAX / n;
    assert (end > 0L);
    end *= n;

    int r;
    while ((r = rand()) >= end);

    return r % n;
  }
}

char * monkey(long unsigned int len) {
    char * monkey_phrase = malloc(sizeof(char) * len);
    int i; for (i = 0; i < len; i++) {
        monkey_phrase[i] = alphabet[randint(27)];
    }
    monkey_phrase[len] = '\0';
    return monkey_phrase;
}

int evaluate(char * monkey_phrase, char * phrase) {
    int score = 0; int i = 0;
    for (i = 0; i < strlen(phrase); i++) {
        if (monkey_phrase[i] == phrase[i]) {
            score++;
        }
    }
    if (score > 0) score = (score * 100) / strlen(phrase);
    return score;
}

int main(int argc, char const* argv[]) {
    if(argc == 1){
        printf("Usage: %s phrase\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    char phrase[strlen(argv[1]) + 1]; strncpy(phrase, argv[1], sizeof(phrase));
    char best_phrase[sizeof(phrase)];
    char monkey_phrase[sizeof(phrase)];
    int  best_score = 0; int score = 0; long unsigned int i = 0;

    srand(time(NULL)); while (1) {
        strncpy(monkey_phrase, monkey(sizeof(phrase)-1), sizeof(phrase));
        score = evaluate(monkey_phrase, phrase);
        if (score == 100) {
            printf("monkey wrote it and only took %lu tries!\n", i);
            exit(EXIT_SUCCESS);
        } else {
            if (best_score < score) {
                best_score  = score;
                strncpy(best_phrase, monkey_phrase, sizeof(monkey_phrase));
            }
            if (i % 100000 == 0)
                printf("%10lu - best score so far against '%s' is '%s' (%d%%), current '%s' (%d%%)\n", i, phrase, best_phrase, best_score, monkey_phrase, score);
        }
        i++;
    }
}
EOF

    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
    tmux split-window -v -p 50
    tmux send-keys -t1 'vim /tmp/vlide_monkey_typer.c'
    tmux send-keys -t1 C-M
    tmux split-window -t1 -v -p 90
    sleep 0.5
    tmux send-keys -t1 ':make'
    for i in 1 2 3; do tmux send-keys -t1 C-M; done
    sleep 0.5
    tmux send-keys -t2 'cp /tmp/vlide_monkey_typer ~/.monkey_typer'
    tmux send-keys -t2 C-M
    sleep 0.5
    tmux send-keys -t2 '~/.monkey_typer vimmer'
    tmux send-keys -t2 C-M
    tmux select-pane -t0
@end

------------------------------------------------------------------------------
    * etc...

No importa si su editor es Emacs/Visual Studio Code/Atom o Vim, pocas curvas de
aprendizaje le serán tan útiles a lo largo de su carrera como dominar su editor
de texto.

@autoexe{sh}
    rm -rf ~/.monkey_typer
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
@end
==============================================================================
La forma de dominar Vim, es a través de VimL, su lenguaje embebido:

    "Use Vim settings, rather than Vi settings (much better!).
    "This must be first, because it changes other options as a side effect.
    set nocompatible

    "Make backspace behave in a sane manner.
    set backspace=indent,eol,start

    "Switch syntax highlighting on
    syntax on

    "Enable file type detection and do language-dependent indenting.
    filetype plugin indent on

Si alguna vez ha modificado el archivo '~/.vimrc', conoce los fundamentos de
Vim scripting.

@autoexe{ vim: set tw=78 ts=8 ft=vim: }
==============================================================================
Otras interfaces
----------------

Adicionalmente, Vim puede comunicarse con otros lenguajes, como Python / Ruby /
Lua / Tcl y Perl, siempre y cuando haya sido compilado con dicho soporte y el
interprete del lenguaje objetivo se encuentre disponible.

@autoexe{ vim: set tw=78 ts=8 ft=markdown: }
------------------------------------------------------------------------------

La función 'has' puede ayudarnos a detectar las opciones disponibles:

    if has('python')
        echo "soporte de python2 incluido"
    else
        echo "sin soporte de python2 (╯°□°）╯︵ ┻━┻"
    endif

@autoexe{}
    echohl WarningMsg
    if  has('python') | echo "soporte de python2 incluido"           | endif
    if !has('python') | echo "sin soporte de python2 (╯°□°）╯︵ ┻━┻" | endif
    echohl None
@end

@autoexe{ vim: set tw=78 ts=8 ft=vim: }
------------------------------------------------------------------------------
También se puede utilizar el comando 'vim --version':

    $ vim --version | ag "[+-](python|ruby|lua|tcl|perl)"'

@autoexe{sh}
    tmux split-window -v -p 50
    tmux send-keys -t1 'vim --version|head -1; vim --version|awk "/Features/{print; exit;}"; vim --version|ag "[+-](python|ruby|lua|tcl|perl)"'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
Esta presentación se centrará en la programación de plugins con VimL.

@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
@end
==============================================================================
VimL / Vim scripting
--------------------

Lo bueno:

  * Embebido, por lo tanto siempre disponible
  * Simple

@autoexe{ vim: set tw=78 ts=8 ft=markdown: }
------------------------------------------------------------------------------
Lo malo:

  * Lento
  * Sin soporte multihilo, aunque existen trucos
  * La libreria estándar es muy pequeña

@autoexe{ vim: set tw=78 ts=8 ft=markdown: }
------------------------------------------------------------------------------
Lo feo:

  * La sintaxis
  * El depurador
  * La documentación (poca)

@autoexe{ vim: set tw=78 ts=8 ft=markdown: }
==============================================================================
Autores prominentes
-------------------

Hace poco terminé de escribir mi 8vo plugin, desafortunadamente eso no basta
para ser experto en Vim, los siguientes autores sí lo son:

  * Marty Grenfell,      https://github.com/scrooloose
  * Junegunn Choi,       https://github.com/junegunn
  * Tim Pope,            https://github.com/tpope
  * Shougo Matsu,        https://github.com/Shougo
  * Charles E. Campbell, http://www.drchip.org/astronaut/vim/index.html

------------------------------------------------------------------------------
Por lo tanto, tomen todo lo que diga con una pizca (o varias) de incredulidad.

                                   ٩(- ̮̮̃-̃)۶
==============================================================================
Librerias
---------

Para complementar la (pequeña) librería estándar de Vim, las personas han
escrito extensiones, estas son las más populares:

  * https://github.com/xolox/vim-misc
  * https://github.com/LucHermitte/lh-vim-lib
  * https://github.com/vim-jp/vital.vim
  * https://github.com/vim-scripts/ingo-library
  * https://github.com/eparreno/vim-l9

Tal vez en el futuro se fusionen en una sola o se integren en Vim/NeoVim ...
==============================================================================
Tipos de plugins
----------------

Los tipos de plugins que se pueden programar para Vim, son:

------------------------------------------------------------------------------
  * Generales: definen comandos y mapeos

------------------------------------------------------------------------------
    * Por ejemplo: `junegunn/vim-easy-align`, un plugin para formatear código
      que define el comando `:EasyAlign`

@autoexe{sh}
    cat << 'EOF' > /tmp/vlide_easy-align.mkd
|id|titulo|artista|
|--|------|-------|
|1|Noreste caliente|Band of Bitches|
|2|Cordillera|Alex Anwandter|
|3|Mania Cardiaca|Enjambre|
|4|Fractubela|Tino el Pinguino|
|5|Coqueta|Ghetto Kids|
EOF

    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
    tmux split-window -v -p 50
    tmux send-keys -t1 'vim /tmp/vlide_easy-align.mkd'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end

------------------------------------------------------------------------------
@autoexe{sh}
    sleep 0.5
    tmux send-keys -t1 ':%EasyAlign *| {"a":"c"}'
    tmux send-keys -t1 C-M; sleep 0.5
    tmux send-keys -t1 ':'
    tmux send-keys -t1 Up
    tmux select-pane -t0
@end

==============================================================================
Tipos de plugins
----------------

Los tipos de plugins que se pueden programar para Vim, son:

  * Generales: definen comandos y mapeos

  * De eventos: reaccionan a cambios de estado

@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
@end

------------------------------------------------------------------------------
    * Por ejemplo: `ap/vim-css-color`, que se ejecuta en `CursorMoved`,
     `CursorMovedI` para colorear códigos hexadecimales.

@autoexe{sh}
    cat << 'EOF' > /tmp/vlide_index.js
const Styles = StyleSheet.create({
    container: { alignItems: 'stretch', flex: 1 },
    body: {
        flex:            9,         flexDirection:   'row',
        alignItems:      'center', justifyContent:  'center',
        backgroundColor: '',
    },
});
EOF

    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
    tmux split-window -v -p 50
    tmux send-keys -t1 'vim /tmp/vlide_index.js'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end

------------------------------------------------------------------------------
@autoexe{sh}
    tmux send-keys -t1 "6G0f'a"
    tmux send-keys -t1 "#8d2"; sleep 3
    tmux send-keys -t1 'd1d'
    tmux select-pane -t0
@end
==============================================================================
Tipos de plugins
----------------

Los tipos de plugins que se pueden programar para Vim, son:

  * Generales: definen comandos y mapeos

  * De eventos: reaccionan a cambios de estado

  * De tipo de archivo: solo aplicables a los archivos definidos

@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
@end
------------------------------------------------------------------------------
    * Por ejemplo: `sheerun/vim-polyglot`, que mejora drásticamente el soporte
      de sintaxis e integración a diferentes lenguajes de programación, como
      Nim, https://nim-lang.org

@autoexe{sh}
    cat << 'EOF' > /tmp/vlide_average.nim
#Compute average line length
var
  sum = 0
  count = 0

for line in stdin.lines:
  sum += line.len
  count += 1

echo("Average line length: ",
     if count > 0: sum / count else: 0)
EOF

    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
    tmux split-window -v -p 50
    tmux send-keys -t1 'vim /tmp/vlide_average.nim'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end
==============================================================================
Tipos de plugins
----------------

Los tipos de plugins que se pueden programar para Vim, son:

  * Generales: definen comandos y mapeos

  * De eventos: reaccionan a cambios de estado

  * De tipo de archivo: solo aplicables a los archivos definidos

  * De temas: definen esquemas de colores

@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
@end
------------------------------------------------------------------------------
    * Por ejemplo: 'flazz/vim-colorschemes'

@autoexe{sh}
    cat << 'EOF' > /tmp/vlide_dhcp.py
#!/usr/bin/env python
import socket,binascii,time,os,sys,IN, optparse

if not hasattr(IN,"SO_BINDTODEVICE"):
    IN.SO_BINDTODEVICE = 25  #http://stackoverflow.com/a/8437870/541038

def slicendice(msg,slices):
    for x in slices:
        if str(type(x)) == "<type 'str'>": x=eval(x)
        yield msg[:x]
        msg = msg[x:]
EOF

    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
    tmux split-window -v -p 50
    tmux send-keys -t1 'vim /tmp/vlide_dhcp.py'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
@autoexe{sh}
    tmux send-keys -t1 ':colorscheme default'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
@autoexe{sh}
    tmux send-keys -t1 ':colorscheme pencil'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
@autoexe{sh}
    tmux send-keys -t1 ':colorscheme murphy'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end
==============================================================================
Los tipos de plugins que se pueden programar para Vim, son:

  * Generales: definen comandos y mapeos

  * De eventos: reaccionan a cambios de estado

  * De tipo de archivo: solo aplicables a los archivos definidos

  * De temas: definen esquemas de colores

Esta presentación se centrará en la programación de plugins generales o de
comandos.

@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
    tmux send-keys -t0 '/Generales: definen comandos y mapeos'
    tmux send-keys -t0 C-M
    tmux send-keys -t0 'gg0'
@end
==============================================================================
Documentación
-------------

La documentación oficial aunque es buena referencia no es la mejor guía para
comenzar.

------------------------------------------------------------------------------
    :help usr_41.txt
@autoexe{}
    help usr_41.txt
    wincmd p "forces to return the focus to the window who call it
@end
------------------------------------------------------------------------------
    :help function-list

@autoexe{}
    help function-list
    wincmd p "forces to return the focus to the window who call it
@end
------------------------------------------------------------------------------
Es mejor:

https://www.ibm.com/developerworks/library/l-vim-script-1/index.html

O http://vim.wikia.com/wiki/Vim_Tips_Wiki que contiene una cantidad
considerable de snippets.

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile
@end
------------------------------------------------------------------------------

Una mención especial a: http://learnvimscriptthehardway.stevelosh.com/ que
aunque aparece con frecuencia en los resultados de búsqueda su contenido es
poco relevante (los ejemplos con frecuencia son muy simples).
==============================================================================
Caso de uso
-----------


   ▄               ▄  ▄            ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄
  ▐░▌             ▐░▌▐░▌          ▐░░░░░░░░░░░▌▐░░░░░░░░░░▌ ▐░░░░░░░░░░░▌
   ▐░▌           ▐░▌ ▐░▌           ▀▀▀▀█░█▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀
    ▐░▌         ▐░▌  ▐░▌               ▐░▌     ▐░▌       ▐░▌▐░▌
     ▐░▌       ▐░▌   ▐░▌               ▐░▌     ▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄▄▄
      ▐░▌     ▐░▌    ▐░▌               ▐░▌     ▐░▌       ▐░▌▐░░░░░░░░░░░▌
       ▐░▌   ▐░▌     ▐░▌               ▐░▌     ▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀▀▀
        ▐░▌ ▐░▌      ▐░▌               ▐░▌     ▐░▌       ▐░▌▐░▌
         ▐░▐░▌       ▐░█▄▄▄▄▄▄▄▄▄  ▄▄▄▄█░█▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄▄▄
          ▐░▌        ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░▌ ▐░░░░░░░░░░░▌
           ▀          ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀   ▀▀▀▀▀▀▀▀▀▀▀


https://github.com/javier-lopez/vlide.vim, un plugin para crear presentaciones
interactivas con Vim
==============================================================================
RDD, Readme Driven Development
------------------------------

Pero antes, un parentesis para describir una metodología que me ha funcionado
para desarrollar plugins y otros proyectos de software libre, RDD:

  * http://tom.preston-werner.com/2010/08/23/readme-driven-development.html

------------------------------------------------------------------------------
  - La programación es iterativa, no se conoce el problema hasta que no se
    resuelve, es más fácil iterar sobre documentación que sobre código.

------------------------------------------------------------------------------
  - Una implementación perfecta de la especificación erronea es peor que una
    mala implementación de la correcta.

------------------------------------------------------------------------------
  - No se trata de especificar a detalle cada características, sino de comenzar
    una discusión sobre las principales propiedades del sistema. Esto es
    especialmente útil discutir el proyecto con otros desarrolladores.

------------------------------------------------------------------------------
  - Es más fácil escribir documentación al inicio de un proyecto que al
    final ( ͡° ͜ʖ ͡°)

==============================================================================
RDD, Readme Driven Development
------------------------------

Aplicando estos principios me he encontrado repitiendo los siguientes pasos
para cada nuevo plugin.

------------------------------------------------------------------------------
  - Escribir el manual, **doc/plugin.txt**

      - Aquí se describen los comandos y opciones de configuraciones del plugin
        `:help NuestroPlugin`

------------------------------------------------------------------------------
  - Escribir las pruebas unitarias y de integración, **tests/plugin.vader**

------------------------------------------------------------------------------
  - Implementar el plugin de acuerdo a las pruebas y documentación. **plugin**
    **autoload**, **ftplugin**, **after**

------------------------------------------------------------------------------
  - Escribir el archivo **README.mkd** con un subconjunto de los comandos y
    configuraciones descritos en **doc/plugin.txt**.

------------------------------------------------------------------------------
      - Este documento hace enfásis en la instalación y primeros pasos, ¡usar
        **imágenes/videos y/o gifs**!

------------------------------------------------------------------------------
      - Agregar insignias que describan el estado de las pruebas continuas,
        dependencias, licencias, etc  ๑( ͝° ͜ʖ͡°)و
==============================================================================
Estructura general
------------------

  ▾ vlide.vim/
    ▸ autoload/
    ▸ doc/
    ▸ plugin/
    ▸ tests/
      README.md

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile
@end
==============================================================================
Estructura general
------------------

  ▾ vlide.vim/
    ▸ autoload/
    ▸ doc/
    ▸ plugin/
        vlide.vim => punto de partida, definición de comandos y mapeos
    ▸ tests/
      README.md

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    let l:file = split(globpath(&runtimepath, "plugin/vlide.vim"))
    if !empty(l:file) | execute "split " . l:file[0] | wincmd p | endif
@end
==============================================================================
Estructura general
------------------

  ▾ vlide.vim/
    ▸ autoload/ => implementación perezosa
      ▾ vlide/
        ▸ autoexe/
          autoexe.vim
          init.vim
          slide.vim
          subslide.vim
          util.vim
      vlide.vim
    ▸ doc/
    ▸ plugin/
    ▸ tests/
      README.md

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    let l:file = split(globpath(&runtimepath, "autoload/vlide.vim"))
    if !empty(l:file) | execute "split " . l:file[0] | wincmd p | endif
@end
==============================================================================
Variables
---------

  let   ▸ define  variables
  unlet ▸ elimina variables

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile
@end
------------------------------------------------------------------------------

  |buffer-variable|    b:variable  Local al buffer actual
  |window-variable|    w:variable  Local a la ventana actual
  |tabpage-variable|   t:variable  Local a la pestaña actual
  |global-variable|    g:variable  Global.
  |local-variable|     l:variable  Local a la función
  |script-variable|    s:variable  Local al script
  |function-argument|  a:variable  Argumentos de funciones
  |vim-variable|       v:variable  Global, predefinidas por Vim.

@autoexe{ vim: set tw=78 ts=8 ft=help: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    let l:file = split(globpath(&runtimepath, "autoload/vlide.vim"))
    if !empty(l:file) | execute "split " . l:file[0] | call cursor(7,0) | setlocal cursorline | wincmd p | endif
@end

@autoexe{sh}
    tmux send-keys -t0 ':wincmd p'
    tmux send-keys -t0 C-M
    tmux send-keys -t0 ':Grep [bwtglsav]:'
    tmux send-keys -t0 C-M
    tmux send-keys -t0 ':wincmd t' #mv cursor to the top window
    tmux send-keys -t0 C-M
@end

------------------------------------------------------------------------------
@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    "reset search pattern
    let @/ = ""
@end
==============================================================================
Funciones de usuario
--------------------

  function! NombreFuncion({argumentos})              [range|abort|dict]
@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    let l:file = split(globpath(&runtimepath, "plugin/vlide.vim"))
    if !empty(l:file) | execute "split " . l:file[0] | call cursor(40,0) | setlocal cursorline | wincmd p | endif
@end
------------------------------------------------------------------------------
  function! directorio#archivo#funcion({argumentos}) [range|abort|dict]

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    let l:file = split(globpath(&runtimepath, "autoload/vlide/slide.vim"))
    if !empty(l:file) | execute "split " . l:file[0] | call cursor(7,0) | setlocal cursorline | wincmd p | endif
@end
------------------------------------------------------------------------------
Número de argumentos:

  function! Funcion()           ▸  no acepta argumentos
  function! Funcion(bang)       ▸  acepta 1 argumento referenciado como a:bang
  function! Funcion(bang, ...)  ▸  acepta 1 o más argumentos
  function! Funcion(...)        ▸  acepta 0 o más argumentos

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile
@end
------------------------------------------------------------------------------
  :help E884

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    help E884
    wincmd p "forces to return the focus to the window who call it
@end
==============================================================================
Comandos
--------

Los comandos son alias de funciones, pueden recibir rangos, argumentos y
atributos.

command! -nargs=* -complete=file -bang Vlide call vlide#start(<bang>0,<f-args>)
            |
            `▸ Número de argumentos: 0-n, ? (0 o 1), + (1 o más),  * (0 o más)

    :help command-nargs

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    help command-nargs
    wincmd p "forces to return the focus to the window who call it
@end
==============================================================================
Comandos
--------

Los comandos son alias de funciones, pueden recibir rangos, argumentos y
atributos.

command! -nargs=* -complete=file -bang Vlide call vlide#start(<bang>0,<f-args>)
                      |
                      `▸ Tipo de autocompletado, file, help, custom, etc

    :help command-complete

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    help command-complete
    wincmd p "forces to return the focus to the window who call it
@end
==============================================================================
Comandos
--------

Los comandos son alias de funciones, pueden recibir rangos, argumentos y
atributos.

command! -nargs=* -complete=file -bang Vlide call vlide#start(<bang>0,<f-args>)
                                   |
                                   `▸ Con modificador !, para forzar / conmutar

    :help command-bang

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    help command-bang
    wincmd p "forces to return the focus to the window who call it
@end
==============================================================================
Comandos
--------

Los comandos son alias de funciones, pueden recibir rangos, argumentos y
atributos.

command! -nargs=* -complete=file -bang Vlide call vlide#start(<bang>0,<f-args>)
                                        |
                                        `▸ Comando / alias

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile
@end
==============================================================================
Comandos
--------

Los comandos son alias de funciones, pueden recibir rangos, argumentos y
atributos.

command! -nargs=* -complete=file -bang Vlide call vlide#start(<bang>0,<f-args>)
                                              |
                                              `▸ Acción

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile
@end
==============================================================================
Comandos
--------

Los comandos son alias de funciones, pueden recibir rangos, argumentos y
atributos.

command! -nargs=* -complete=file -bang Vlide call vlide#start(<bang>0,<f-args>)
                                                       |
                                                       `▸ Función

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile
@end
==============================================================================
Comandos
--------

Los comandos son alias de funciones, pueden recibir rangos, argumentos y
atributos.

command! -nargs=* -complete=file -bang Vlide call vlide#start(<bang>0,<f-args>)
                                                                |
                                      atributo booleano 0 o !0 ◂´

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    let l:file = split(globpath(&runtimepath, "autoload/vlide.vim"))
    if !empty(l:file) | execute "split " . l:file[0] | call cursor(8,0) | setlocal cursorline | wincmd p | endif
@end
==============================================================================
Comandos
--------

Los comandos son alias de funciones, pueden recibir rangos, argumentos y
atributos.

command! -nargs=* -complete=file -bang Vlide call vlide#start(<bang>0,<f-args>)
                                                                         |
                                                 argumentos adicionales ◂´

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    let l:file = split(globpath(&runtimepath, "autoload/vlide.vim"))
    if !empty(l:file) | execute "split " . l:file[0] | call cursor(11,0) | setlocal cursorline | wincmd p | endif
@end
==============================================================================
Mapeos
------

Defición de atajos de teclado.

    nnoremap <unique> <script> <Plug>Vlide :Vlide<CR>
        |
        `▸ Tipo de atajo, no recursivo / normal

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile
@end
------------------------------------------------------------------------------
    Recursivo: El atajo expande o no otros atajos, para scripts es mejor no
               expandirlos si pretendemos que nuestro script funcione en la
               mayoría de configuraciones

    Normal:    Modo por defecto de Vim.

------------------------------------------------------------------------------
    :help noremap
@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    help noremap
    wincmd p "forces to return the focus to the window who call it
@end
==============================================================================
Mapeos
------

Defición de atajos de teclado.

    nnoremap <unique> <script> <Plug>Vlide :Vlide<CR>
                |
                `▸ Propiedad, el atajo no se crea si ya está definido

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile
@end
------------------------------------------------------------------------------
    :help unique
@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    help unique
    wincmd p "forces to return the focus to the window who call it
@end
==============================================================================
Mapeos
------

Defición de atajos de teclado.

    nnoremap <unique> <script> <Plug>Vlide :Vlide<CR>
                         |
                         `▸ Propiedad, el atajo expande únicamente otros
                            atajos definidos en el script.

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile
@end
------------------------------------------------------------------------------
    :help map-script
@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    help map-script
    wincmd p "forces to return the focus to the window who call it
@end
==============================================================================
Mapeos
------

Definición de atajos de teclado.

    nnoremap <unique> <script> <Plug>Vlide :Vlide<CR>
                                 |
                                 `▸ Propiedad, se trata de un atajo interno

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile
@end
------------------------------------------------------------------------------
    if !hasmapto('<Plug>Vlide', "n") "normal mode
        exe "nmap <buffer> <silent>" . g:vlide_mapping . " <Plug>Vlide"
    endif

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile
@end
------------------------------------------------------------------------------
    :help <Plug>
@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    help using-<Plug>
    wincmd p "forces to return the focus to the window who call it
@end
==============================================================================
Mapeos
------

Defición de atajos de teclado.

    nnoremap <unique> <script> <Plug>Vlide :Vlide<CR>
                                              |
                                              `▸ Acción

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile
@end
==============================================================================
Mapeos
------

Atajos de teclado por acción VS defición por variables globales.

Bundle 'javier-lopez/vlide.vim' , { 'on': ['<Plug>Vlide'] }
    map <F5> <Plug>Vlide
                                    VS

Bundle 'mileszs/ack.vim' , { 'on': ['Ack'] }
    let g:ack_mappings = { "O": "<CR>zz", "o": "<CR>zz:ccl<CR>", "p": "<CR>zz<C-W>p", "i": "<C-W><CR><C-W>x<C-W>p", }

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile
@end
==============================================================================
Listas
------

En VimL, una lista es una secuencia de valores escalares: cadenas, números
listas, etc, pueden ser de un solo o de varios tipos.

    let lista = [1,2,"tres", [4,5] ]

@autoexe{ vim: set tw=78 ts=8 ft=vim: }
------------------------------------------------------------------------------
El índice comienza a partir del 0, y se pueden acceder a índices negativos
para ir en orden inverso.

    echo lista[0]
@autoexe{}
    echohl WarningMsg
    let lista = [1,2,"tres", [4,5] ] | echo lista[0]
    echohl None
@end
------------------------------------------------------------------------------
    echo lista[-1]

@autoexe{}
    echohl WarningMsg
    let lista = [1,2,"tres", [4,5] ] | echo lista[-1]
    echohl None
@end
------------------------------------------------------------------------------
Se pueden concatenar elementos con add(), o +=

    call add (lista, 6) || let lista += [6] "error: let lista += 6

@autoexe{}
    echohl WarningMsg
    let lista = [1,2,"tres", [4,5] ]
    call add(lista, 6) | echo lista
    echohl None
@end
------------------------------------------------------------------------------
Y eliminar con remove()

    call remove (lista, 0)

@autoexe{}
    echohl WarningMsg
    let lista = [1,2,"tres", [4,5], 6]
    call remove(lista, 0) | echo lista
    echohl None
@end
==============================================================================
Listas
------

En VimL, una lista es una secuencia de valores escalares: cadenas, números
listas, etc, pueden ser de un solo tipo o de varios.

   :help function-list
   https://www.ibm.com/developerworks/library/l-vim-script-3/index.html

@autoexe{ vim: set tw=78 ts=8 ft=markdown: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    help function-list
    wincmd p "forces to return the focus to the window who call it
@end
==============================================================================
Listas
------

    vlide.vim/autoload/vlide.vim
        vlide#start(bang, ...)
            vlide#slide#parse(buffer)
@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    let l:file = split(globpath(&runtimepath, "autoload/vlide/slide.vim"))
    if !empty(l:file) | execute "split " . l:file[0] | call cursor(45,0) | setlocal cursorline | wincmd p | endif
@end
------------------------------------------------------------------------------
            vlide#slide#display(buffer)
@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    let l:file = split(globpath(&runtimepath, "autoload/vlide/slide.vim"))
    if !empty(l:file) | execute "split " . l:file[0] | call cursor(69,0) | setlocal cursorline | wincmd p | endif
@end
------------------------------------------------------------------------------
                vlide#subslide#parse(s:raw_slides[a:slide-1])
@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    let l:file = split(globpath(&runtimepath, "autoload/vlide/subslide.vim"))
    if !empty(l:file) | execute "split " . l:file[0] | call cursor(7,0) | setlocal cursorline | wincmd p | endif
@end
------------------------------------------------------------------------------
                vlide#subslide#total()
@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    let l:file = split(globpath(&runtimepath, "autoload/vlide/slide.vim"))
    if !empty(l:file) | execute "split " . l:file[0] | call cursor(73,0) | setlocal cursorline | wincmd p | endif
@end
------------------------------------------------------------------------------
@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    let l:file = split(globpath(&runtimepath, "autoload/vlide/subslide.vim"))
    if !empty(l:file) | execute "split " . l:file[0] | call cursor(136,0) | setlocal cursorline | wincmd p | endif
@end
------------------------------------------------------------------------------
                vlide#subslide#display(l:subslide)
@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    let l:file = split(globpath(&runtimepath, "autoload/vlide/slide.vim"))
    if !empty(l:file) | execute "split " . l:file[0] | call cursor(75,0) | setlocal cursorline | wincmd p | endif
@end
------------------------------------------------------------------------------
@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    let l:file = split(globpath(&runtimepath, "autoload/vlide/subslide.vim"))
    if !empty(l:file) | execute "split " . l:file[0] | call cursor(21,0) | setlocal cursorline | wincmd p | endif
@end
==============================================================================
Diccionarios
------------

Los diccionarios en VimL se parecen a los de Python, son contenedores
desordenados, indexados por cadenas en lugar de enteros.

    let usuario = ['nombre':'Javier López', 'edad':28, 'editor': 'vim' ]
    echo get(usuario, 'nombre')           || echo usuario[nombre]
    "retorna 0, si la propiedad no existe || lanza una excepción

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    echohl WarningMsg
    let  usuario = {'nombre':'Javier López', 'edad':28, 'editor': 'vim'}
    echo usuario['nombre']
    echohl None
@end
------------------------------------------------------------------------------
Pueden ser accedidos / creados con la notación punto.

    let  usuario.nivel = 3
    echo usuario.nivel
@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    echohl WarningMsg
    let  usuario = {'nombre':'Javier López', 'edad':28, 'editor': 'vim'}
    let  usuario.nivel = 3
    echo usuario.nivel
    echohl None
@end
------------------------------------------------------------------------------
    echo usuario

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    echohl WarningMsg
    let  usuario = {'nombre':'Javier López', 'edad':28, 'editor': 'vim'}
    let  usuario.nivel = 3
    echo usuario
    echohl None
@end
------------------------------------------------------------------------------
O por la función items()

    for [llave, valor] in items(usuario)
        echon llave . ":" . valor
    endfor

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    echohl WarningMsg
    let  usuario = {'nombre':'Javier López', 'edad':28, 'editor': 'vim'}
    let  usuario.nivel = 3
    for [llave, valor] in items(usuario) | echon llave . ":" . valor . " " | endfor
    echohl None
@end
------------------------------------------------------------------------------
Para eliminar entradas, se utiliza la función filter()

    call filter(usuario, 'v:key[0] != "e"')
    echo usuario

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    echohl WarningMsg
    let  usuario = {'nombre':'Javier López', 'edad':28, 'editor': 'vim'}
    let  usuario.nivel = 3
    call filter(usuario, 'v:key[0] != "e"')
    echo usuario
    echohl None
@end
==============================================================================
Diccionarios
------------

Un uso común es utilizarlos para enviar opciones a funciones, por ejemplo:

    fun! Imprimir(msg, opts)
        execute 'highlight MSG_COLOR ctermfg=' . get(a:opts, 'color', 'white')
        echohl MSG_COLOR
            echo a:msg
        echohl None
    endf

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    redraw!
@end
------------------------------------------------------------------------------
    call Imprimir("Las rosas son rojas", { 'color' : 'red' })
@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    let fun_start = search("fun!", "n")
    let fun_end   = search("endf", "n")
    let fun = getline(fun_start, fun_end)
    execute join(fun, "\n")
    call Imprimir("Las rosas son rojas", { 'color' : 'red' })
@end
------------------------------------------------------------------------------
    call Imprimir("el mar es azul", { 'color' : 'blue' })
@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    let fun_start = search("fun!", "n")
    let fun_end   = search("endf", "n")
    let fun = getline(fun_start, fun_end)
    execute join(fun, "\n")
    call Imprimir("el mar es azul", { 'color' : 'blue' })
@end
------------------------------------------------------------------------------
    call Imprimir("no entiendo ni jota de VimL", { 'color' : 'yellow' })
@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    let fun_start = search("fun!", "n")
    let fun_end   = search("endf", "n")
    let fun = getline(fun_start, fun_end)
    execute join(fun, "\n")
    call Imprimir("no entiendo ni jota de VimL", { 'color' : 'yellow' })
@end
------------------------------------------------------------------------------
    call Imprimir("mejor me voy de aqui :qa!", {})
@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    let fun_start = search("fun!", "n")
    let fun_end   = search("endf", "n")
    let fun = getline(fun_start, fun_end)
    execute join(fun, "\n")
    call Imprimir("mejor me voy de aqui :qa!", {})
@end
==============================================================================
Depuración
----------

VimL como otros lenguajes brinda mecanismos de depuración, existen 3 formas
principales:

@autoexe{ vim: set tw=78 ts=8 ft=help: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    redraw!
@end
------------------------------------------------------------------------------
  * Mensajes integrados en el código: |echom|, |Decho|

------------------------------------------------------------------------------
  * Trazas, opción 'verbose' (mi preferida)

------------------------------------------------------------------------------
  * Depurador, opción 'debug'
==============================================================================
Depuración
----------

El caso más simple es imprimir datos relevantes desde el plugin desarrollado,
por ejemplo:

    echom 'el valor de la variable b:var es: ' . b:var

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    let b:var = 42
    echom 'el valor de la variable b:var es: ' . b:var
@end
------------------------------------------------------------------------------
A diferencia de 'echo', los mensajes de 'echom' se almacenan en un buffer
especial que se puede consultar posteriormente con ':messages'.

@autoexe{}
    let b:orig_cmdheight = &cmdheight
    set cmdheight=29
    messages
@end
------------------------------------------------------------------------------
Existen plugins como Decho[0] que mejoran la característica anterior para
habiltiar/deshabilitar dichos mensajes sin la necesidad de agregarlos /
eliminarlos del código, los mensajes agregados con Decho se controlan con:

    :DechoOn | :DechoOff

[0] http://www.vim.org/scripts/script.php?script_id=120

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{}
    echo b:orig_cmdheight
    let &cmdheight=b:orig_cmdheight
@end
==============================================================================
Depuración
----------

Otra forma de depurar plugins es generando trazas de los comandos ejecutados,
para tal efecto se manipula la opción 'verbose' entre los rangos 0-15.

@autoexe{ vim: set tw=78 ts=8 ft=vim: }
------------------------------------------------------------------------------
Por ejemplo:

    set verbose=10 | Vlide
@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
    tmux split-window -v -p 50
    tmux send-keys -t1 'vim'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux send-keys -t1 ':set verbose=10 | VlideReferenceSlide'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
    :12verbose call vlide#start(0)

@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
    tmux split-window -v -p 50
    tmux send-keys -t1 'vim'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux send-keys -t1 ':VlideReferenceSlide'
    tmux send-keys -t1 C-M
    tmux send-keys -t1 ':Vlide!'
    tmux send-keys -t1 C-M
    tmux send-keys -t1 ':12verbose call vlide#reference()'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
En algunos casos, es preferible redireccionar los mensajes a otro archivo:

    set verbosefile=depuracion-vlide.txt | set verbose=15 | Vlide

@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
    tmux split-window -v -p 50
    tmux send-keys -t1 'vim'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux send-keys -t1 ':set verbosefile=/tmp/vlide_depuracion.txt | set verbose=15 | VlideReferenceSlide'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux send-keys -t1 ':e /tmp/vlide_depuracion.txt'
    tmux send-keys -t1 C-M
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end
==============================================================================
Depuración
----------

Finalmente, se puede usar el depurador integrado, que aunque no es muy avanzado
puede dar pistas adicionales.

    :debug VlideReferenceSlide
@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
@end
------------------------------------------------------------------------------
@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
    tmux split-window -v -p 50
    tmux send-keys -t1 'vim'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux send-keys -t1 ':debug VlideReferenceSlide'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
        s tep
@autoexe{sh}
    tmux send-keys -t1 'step'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
        n ext
        c ontinue
        q uit

@autoexe{sh}
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
Durante la sesión se puede ejecutar VimL, por ejemplo `echo a:name` para
revisar el estado de variables.

@autoexe{ vim: set tw=78 ts=8 ft=vim: }

@autoexe{sh}
    tmux send-keys -t1 'echo a:name'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end
==============================================================================
Pruebas unitarias, Vader
------------------------

Los 2 plugins más populares para crear pruebas de VimL son:

  * Vim-vspec, https://github.com/kana/vim-vspec
  * Vader,     https://github.com/junegunn/vader.vim

@autoexe{ vim: set tw=78 ts=8 ft=markdown: }

@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
@end
------------------------------------------------------------------------------
Personalmente encuentro más amigable (con más ejemplos) el README.md de Vader,
por lo que aprendí su sintaxis y desde entonces no he visto atrás, ambos
plugins utilizan una sintaxis BDD.
==============================================================================
Pruebas unitarias, Vader
------------------------

Vader reconoce los siguientes comandos:

Given(3 diapositivas):
  Contenido del buffer al iniciar la prueba

@autoexe{ vim: set tw=78 ts=8 ft=vader: }

@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
@end
------------------------------------------------------------------------------
"Comandos en modo normal
Do(Ir a la siguiente diapositiva):
  \<Space>

------------------------------------------------------------------------------
Execute(Obtener el número de diapositiva actual):
  let l:current = call vlide#slide#current()

------------------------------------------------------------------------------
Then(Verificar que se ha avanzado una diapositiva):
  Assert l:current == 2

------------------------------------------------------------------------------
Expect(Verificar el contenido de la segunda diapositiva):
  Más contenido

------------------------------------------------------------------------------
Before:
  "Se puede ejecutar código antes

After
  "o después de cada test

@autoexe{ vim: set tw=78 ts=8 ft=vader: }

@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
@end
==============================================================================
Pruebas unitarias, Vader
------------------------

Cada prueba se define en un archivo con sufijo |.vader|, que puede ejecutarse
con el comando |:Vader| %

  ▾ vlide.vim/
    ▸ autoload/
    ▸ doc/
    ▸ plugin/
    ▾ tests/
      ▸ include/
        feature#load.vader
        |feature#slide.vader|
        feature#subslide.vader
        README.md

@autoexe{ vim: set tw=78 ts=8 ft=help: }

@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
@end
------------------------------------------------------------------------------
@autoexe{sh}
    tmux split-window -v -p 50
    tmux send-keys -t1 'vim -c"+Vlide!"'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux send-keys -t1 ':let file = split(globpath(&runtimepath, "tests/feature#slide.vader"))'
    tmux send-keys -t1 C-M
    tmux send-keys -t1 ':if !empty(file) | execute "edit " . escape(file[0], "#") | endif'
    for i in 1 2; do tmux send-keys -t1 C-M; done
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
@autoexe{ vim: set tw=78 ts=8 ft=help: }

@autoexe{sh}
    tmux send-keys -t1 ':Vader %'
    for i in 1 2; do tmux send-keys -t1 C-M; done
    sleep 0.5
    tmux send-keys -t1 ':Vader %'
    tmux select-pane -t0
@end
==============================================================================
Integración continua, Travis-CI
-------------------------------

Integración continua:

  ▸ Ejecución de pruebas con cada cambio
@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
@end
------------------------------------------------------------------------------
  ▸ Notificación de resultados
------------------------------------------------------------------------------
  ▸ Ejecución de pasos posteriores dependiendo del resultado de las pruebas

------------------------------------------------------------------------------
Travis-CI:

------------------------------------------------------------------------------
  ▸ Nada que instalar, es un servicio web, https://travis-ci.org
------------------------------------------------------------------------------
  ▸ Se integra con Github y más de 30 servicios,
    https://docs.travis-ci.com/user/deployment
------------------------------------------------------------------------------
  ▸ Es gratis para repositorios públicos alojados en Github ( ͡ᵔ ͜ʖ ͡ᵔ)
@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
@end
==============================================================================
Integración continua, Travis-CI
-------------------------------

Para agregar su proyecto a travis-ci se siguen los siguientes pasos:

  1. Se vincula su cuenta de GH ▸▸▸ Travis, https://travis-ci.org/ (SignUp)

------------------------------------------------------------------------------
  2. Se actualiza la lista de proyectos, https://travis-ci.org/profile/usuario
     (Sync Account), ahora podrán ver sus proyectos públicos de GH en Travis.

------------------------------------------------------------------------------
  3. Se activa el repositorio objetivo.

------------------------------------------------------------------------------
¡Listo!
@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile
@end

@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
@end
==============================================================================
Integración continua, Travis-CI
-------------------------------

Bueno, casi, también se debe definir el archivo `.travis.yml`

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile
@end

@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
@end
------------------------------------------------------------------------------

    dist: trusty
    sudo: required
    before_install: sudo apt-get update && sudo apt-get install -y git-core vim-nox
    script: sh tests/tests.sh

------------------------------------------------------------------------------
Ahora travis-ci ejecutará estos pasos con cada cambio (leáse commit) en el
proyecto.
==============================================================================
Publicación
-----------

Los principales gestores de plugins; Vundle, NeoBundle y Vim-plug, soportan la
instalación de extensiones desde:

------------------------------------------------------------------------------
  * Github / Bitbucket

------------------------------------------------------------------------------
  * Vim.org:

------------------------------------------------------------------------------
http://www.vim.org/scripts/ requiere que los plugins se distribuyan como
archivos comprimidos, por ejemplo: tar.gz, zip, o vba, sin embargo es mucho más
común encontrarlos como repositorios en Github.

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    let l:file = split(globpath(&runtimepath, "autoload/vlide/../../package.sh"))
    if !empty(l:file) | execute "split " . l:file[0] | call cursor(3,0) | setlocal cursorline | wincmd p | endif
@end
------------------------------------------------------------------------------

    :help vimball
@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile

    help vimball
    wincmd p "forces to return the focus to the window who call it
@end
==============================================================================
FIN


                         __
                        /  \           ________________________
                        |  | ° o O   /                         \
                        @  @        | ¿Preguntas / comentarios? |
                        || ||       |                           |
                        || ||        \_________________________/
                        |\_/|
                        \___/


Consulta ésta presentación en línea:

  * https://github.com/javier-lopez/talks/blob/master/vim-plugins-dev-es.md

@autoexe{ vim: set tw=78 ts=8 ft=markdown: }

@autoexe{}
    "close all but the presentation buffer
    let buffer = bufnr("%") | let lbuffer = bufnr("$")  | let i = buffer
    while i <= lbuffer | if i != buffer && bufexists(i) | silent exe "bwipe " . i | endif | let i = i+1 | endwhile
@end
==============================================================================
@autoexe{sh}
    cat << 'EOF' > /tmp/vlide_credits.vim
"If already loaded, we're done...
if exists("loaded_SWcrawl") | finish | endif
let loaded_SWcrawl = 1

"Preserve external compatibility options, then enable full vim compatibility...
let s:save_cpo = &cpo
set cpo&vim

"Set up the actual colon command...
command! -nargs=1 -complete=file  Credits call SWcrawl(<f-args>)

"Implementation....
let s:CRAWL_SPEED      = 3.0 "(lines per second)
let s:STAR_DENSITY     = 50  "(pixels per star, i.e. 1 star per STAR_DENSITY pixels)
let s:STARFIELD_HEIGHT = 2   "(screens deep)

let s:CENTRED_CRAWL_LINE = '^\s*[>]\s*\zs.\{-}\ze\s*[<]\s*$'
let s:PREFACE_LINE       = '^\s*\zs.\{-}\ze\s*$'

highlight SWC_PREFACE    ctermfg=cyan
highlight SWC_FADE_LIGHT ctermfg=cyan
highlight SWC_FADE_DARK  ctermfg=blue
highlight SWC_CRAWL      ctermfg=white
highlight SWC_STAR       ctermfg=white
highlight SWC_BLACK      ctermfg=black  ctermbg=black

let s:PREFACE_POS = { 'x': 10, 'y': 5 }

function! SWcrawl (textsource)
    "Load preface, logo, and text to be crawled...
    let preface   = []
    let crawl     = []
    let centred   = []
    let max_crawl_width = 0

    for nextline in readfile(a:textsource)
        "Ignore blank lines...
        if nextline =~ '^\s*$'
            continue

        "Lines in >...< are centred crawl components...
        elseif nextline =~ s:CENTRED_CRAWL_LINE
            let next_crawl = matchstr(nextline, s:CENTRED_CRAWL_LINE)
            if strlen(next_crawl) > max_crawl_width
                let max_crawl_width = strlen(substitute(next_crawl,'\s\+',' ','g'))
            endif
            let crawl   += [ next_crawl ]
            let centred += [ 1 ]

        "Anything else is preface...
        else
            let preface += [ substitute(matchstr(nextline, s:PREFACE_LINE), "^\s*", repeat(" ",s:PREFACE_POS.x), '') ]
        endif
    endfor

    "Save current buffer for final transition effect...
    let original_buffer = getline(1,'$')

    "Switch to a new buffer...
    let prev_matches = getmatches()
    "enew!
    setlocal buftype=nofile
    setlocal cmdheight=1
    setlocal nocursorcolumn
    setlocal nocursorline
    setlocal nofoldenable
    setlocal nonumber
    setlocal norelativenumber
    setlocal noswapfile
    setlocal wrap
    setlocal linebreak
    silent! setlocal breakindent "not be available in old vim versions
    setlocal nolist
    setlocal bufhidden=wipe
    setlocal nobuflisted

    let b:WIN = { 'x' : winwidth(0), 'y' : winheight(0) }
    call setline(1, repeat([""], b:WIN.y + 1))

    "And hide annoyances...
    set lcs=
    let old_rulerformat = &rulerformat
    let &rulerformat="%#SWC_BLACK#%l"
    echo ""

    "Generate starfield...
    let stars = SWC_gen_stars()

    "Clear screen...
    call setline(1, repeat([""], s:STARFIELD_HEIGHT * b:WIN.y) + original_buffer)
    redraw

    "Run crawl...
    call clearmatches()
    call matchadd('SWC_CRAWL', '.', 100)
    call matchadd('SWC_STAR',  '\s\zs[.]\ze\s', 101)
    for offset_from_bottom in range(1, len(crawl) + b:WIN.y)
        let crawl_line = offset_from_bottom < b:WIN.y ? 0 : offset_from_bottom - b:WIN.y + 1
        for screen_line in range(1, b:WIN.y)
            if screen_line >= b:WIN.y - offset_from_bottom && crawl_line < len(crawl)
                let padded_line = SWC_pad(crawl[crawl_line], screen_line, centred[crawl_line], max_crawl_width)
                call setline(screen_line, padded_line)
                let crawl_line += 1
            else
                call setline(screen_line, "")
            endif
        endfor
        call SWC_paint_stars(stars)
        echo ""
        redraw
        exec 'sleep ' . s:trunc(1000/s:CRAWL_SPEED) . 'm'
        if getchar(0) || offset_from_bottom > len(crawl) && padded_line !~ '\S'
            break
        endif
    endfor

    "Switch back to previous buffer and restore normal highlighting...
    "bwipeout %
    "edit! #
    call setmatches(prev_matches)
    let &rulerformat = old_rulerformat
    redraw
endfunction

function s:trunc (n)
    return str2nr(string( a:n ))
endfunction

function! SWC_pad (text, y_pos, centred, max_text_width)
    "Does this need padding???
    let words = split(a:text, '\s\+')
    if len(words) < 1
        return a:text
    endif

    "How many unpadded characters are there???
    let unpadded_width = 0
    for word in words
        let unpadded_width += strlen(word)
    endfor

    "How much padding is needed???
    let rel_y = (2.0 * a:y_pos / b:WIN.y) - 1.0
    let stretched_width = s:trunc( a:max_text_width + rel_y * (b:WIN.x - a:max_text_width) )
    let required_padding = max([ 0, stretched_width - unpadded_width ])
    let indent = (b:WIN.x - stretched_width) / 2
    let gap_count = len(words) - 1

    "Is this a last line???
    let tight = a:centred || strlen(a:text) < 0.9 * a:max_text_width

    "Insert padding...
    let min_padding_needed_for = gap_count
    if tight
        let min_pad_per_gap = max([ 1, s:trunc(rel_y * 6.0) ])
    else
        let min_pad_per_gap = max([ 1, required_padding / gap_count ])
        let leftover_padding = required_padding - gap_count * min_pad_per_gap
        let min_padding_needed_for = min([ gap_count, gap_count - leftover_padding ])
    endif
    let padded_text = join(words[0 : min_padding_needed_for], repeat(" ", min_pad_per_gap))
    \               . repeat(" ", min_pad_per_gap+1)
    \               . join(words[min_padding_needed_for+1 : -1], repeat(" ", min_pad_per_gap+1))
    let padded_text = substitute(padded_text, '\s*$', '', '')

    "Indent to centre...
    let padded_text = substitute(padded_text, '\s*$', '', '')
    let max_ever_padding = b:WIN.x - a:max_text_width
    let indent = a:centred ? (b:WIN.x - strlen(padded_text))/2
    \                      : indent
    return repeat(" ", indent) . padded_text
endfunction

let s:m_w = 1 + getpid()
let s:m_z = localtime()

"not sure of the wisdom of generating a full 32-bit RN here
"and then using abs() on the sucker. Feedback welcome.
function! RandomNumber(...)
  if a:0 == 0
    let s:m_z = (36969 * and(s:m_z, 0xffff)) + (s:m_z / 65536)
    let s:m_w = (18000 * and(s:m_w, 0xffff)) + (s:m_w / 65536)
    return (s:m_z * 65536) + s:m_w      " 32-bit result
  elseif a:0 == 1 " We return a number in [0, a:1] or [a:1, 0]
    return a:1 < 0 ? RandomNumber(a:1,0) : RandomNumber(0,a:1)
  else " if a:2 >= 2
    return abs(RandomNumber()) % (abs(a:2 - a:1) + 1) + a:1
  endif
endfunction

function! SWC_gen_stars ()
    let star_count = b:WIN.x * s:STARFIELD_HEIGHT * b:WIN.y / s:STAR_DENSITY
    let stars = []
    for n in range(star_count)
        let x = RandomNumber(b:WIN.x) + 1
        let y = RandomNumber(s:STARFIELD_HEIGHT * b:WIN.y) + 1
        let stars += [{'y':y,'x':x}]
    endfor
    return stars
endfunction

function! SWC_paint_stars (stars)
    let max_x = b:WIN.x
    for star in a:stars
        let line = strpart(getline(star.y) . repeat(" ", max_x), 0, max_x)
        let line = substitute(line, '\s\zs\%'.(star.x-1).'c\s\ze\s', '.', '')
        call setline(star.y, line)
    endfor
endfunction

"Restore previous external compatibility options
let &cpo = s:save_cpo
EOF

    cat << 'EOF' > /tmp/vlide_credits.txt
>                            Agradecimientos                                 <
>                            ===============                                 <
>                                                                            <
>   Idea original:                                                           <
>                                                                            <
>   https://blog.dbi-services.com/using-tmux-for-semi-interactive-demos/     <
>                                                                            <
>   Recursos:                                                                <
>                                                                            <
>   https://www.ibm.com/developerworks/library/l-vim-script-1/index.html     <
>   http://vim.wikia.com/wiki/Vim_Tips_Wiki                                  <
>   https://vi.stackexchange.com                                             <
>                                                                            <
>   Plugins similares:                                                       <
>                                                                            <
>   https://github.com/alfredodeza/posero.vim                                <
>   https://github.com/sotte/presenting.vim                                  <
>                                                                            <
>   Efecto, agradecimientos:                                                 <
>                                                                            <
>   https://youtu.be/aHm36-na4-4?t=50                                        <
>   https://git.io/v728x                                                     <
>   https://git.io/v724e                                                     <
EOF

    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
    tmux send-keys -t0 ':source /tmp/vlide_credits.vim | Credits /tmp/vlide_credits.txt'
    tmux send-keys -t0 C-M
@end

@autoexe{ vim: set tw=78 ts=8 ft=help: }
