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

  █  PROVISIONAMIENTO DE INFRAESTRUCTURA: VAGRANT, CLOUDFORMATION, TERRAFORM

  ★　 .   ° .　    　 ° 　.   .　　★　　°    ☆ 　     .　　  　★ 　★　 :.
   .　　     .　　      ★　 .   ° .　  　. 　¸.     ★　 .   ° .　  　. 　¸.
  ★　 .  　__▄     ☆ ¸.     https://www.meetup.com/Infraestructura-como-codigo
 ☆ ¸. ¸.    ╚▌   　.　.     .         ★ 　　  °   ☆           .　　 　　  °
 　 .○ °    ██                ¸       ▄        ☆          ☆ ¸. ¸.   .　　★
 .　　★　   ▐█  °☆ 　☾             ▄█████▄   .   ° 　 Diciembre 02, 2017, CDMX
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
*CONTENIDOS*                         *PROVISIONAMIENTO* *DE* *INFRAESTRUCTURA* - *IAC*

    1. Intro ............................................................. |3|
    3. Vagrant ........................................................... |4|
    4. Cloudformation .................................................... |2|
    5. Terraform ......................................................... |3|
    7. Fin ............................................................... |4|

@autoexe{ vim: set tw=78 ts=8 ft=help: }
==============================================================================
*INTRO*                              *PROVISIONAMIENTO* *DE* *INFRAESTRUCTURA* - *IAC*

¿Por qué es deseable codificar infraestructura?~

------------------------------------------------------------------------------
    Propiedades del código:

------------------------------------------------------------------------------
        * Auditable
------------------------------------------------------------------------------
        * Reproducible
------------------------------------------------------------------------------
        * Autodocumentado
------------------------------------------------------------------------------
        * Reutilizable
------------------------------------------------------------------------------
        * Transparente
------------------------------------------------------------------------------
        * Ágil!
        * ...
==============================================================================
*INTRO*                              *PROVISIONAMIENTO* *DE* *INFRAESTRUCTURA* - *IAC*

Políticas~

    * Nuevas herramientas, viejos habitos
    * Bajo demanda, los servicios pueden crearse/destruirse a voluntad
    * Autoservicio, eso no incluye sistemas intermediarios de tickets!

------------------------------------------------------------------------------
Cultura~

Idealmente se debe llegar a un punto donde cualquier miembro del equipo pueda
identificar prácticas que no son autocontenibles, reproducibles, ágiles, etc.

    * Iniciar sesión en un servidor e instalar paquetes manualmente
    * Crear imágenes de contenedores / máquinas virtuales manualmente
    * Abrir tickets para solicitar recursos computacionales

------------------------------------------------------------------------------
    * CLI != IAC
    * SSH != IAC
==============================================================================
*INTRO*                              *PROVISIONAMIENTO* *DE* *INFRAESTRUCTURA* - *IAC*

Herramientas~

    * Gestor de versiones
      + Csv / Svn / HG / Bzr / Git

------------------------------------------------------------------------------
    * Provisionamiento de infraestructura
      + Cobbler / Foreman / Terraform / Vagrant / Cloudformation / Otras apis

------------------------------------------------------------------------------
    * Gestor de configuraciones
      + Puppet / Chef / Saltstack / Ansible

------------------------------------------------------------------------------
    * Generador de artefactos
      + Packer + Kickstart / Preseed / ECS / Openstack Heat / Dockerfile

------------------------------------------------------------------------------
    * Consumidor de artefactos
      + Docker / EC2 / GCE / Vbox / Pbuilder / Openstack

------------------------------------------------------------------------------
    * Gestor de servicios basados en artefactos
      + Nomad / Docker Swarm compose / Kubernetes
==============================================================================
*INTRO*                              *PROVISIONAMIENTO* *DE* *INFRAESTRUCTURA* - *IAC*

Herramientas~




    * Provisionamiento de infraestructura
      + Cobbler / Foreman / Terraform / Vagrant / Cloudformation / Otras apis












==============================================================================
VAGRANT                              PROVISIONAMIENTO DE INFRAESTRUCTURA - IAC
-------

Provisionador de máquinas virtuales (VBox, VMWare), aunque también soporta
Docker y otras APIs de proveedores en la nube.

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
------------------------------------------------------------------------------
.. code:: sh

    $ vagrant init 'bento/ubuntu-16.04'
@autoexe{sh}
    rm -rf /tmp/IAC-demo/; mkdir -p /tmp/IAC-demo; cd /tmp/IAC-demo
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
    tmux split-window -v -p 50
    sleep 0.5
    tmux send-keys -t1 'vagrant init "bento/ubuntu-16.04"'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux send-keys -t1 'ls'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
    $ vagrant up
@autoexe{sh}
    tmux send-keys -t1 'vagrant up'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
    $ vagrant ssh
@autoexe{sh}
    tmux send-keys -t1 'vagrant ssh'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
@autoexe{sh}
    tmux send-keys -t1 'exit'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux send-keys -t1 'vagrant destroy -f'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end

==============================================================================
VAGRANT                              PROVISIONAMIENTO DE INFRAESTRUCTURA - IAC
-------

Ejemplo práctico, infraestructura en alta disponibilidad:


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
@autoexe{sh}
    rm -rf /tmp/IAC-demo/; mkdir -p /tmp/IAC-demo; cd /tmp/IAC-demo
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
@end
------------------------------------------------------------------------------
.. code:: sh

    $ git clone --depth=1 https://github.com/javier-lopez/vagrants
    $ cd vagrants/minos-core-16.04-keepalived-haproxy-nginx
    $ vagrant up
------------------------------------------------------------------------------
@autoexe{sh}
    rm -rf /tmp/IAC-demo/; mkdir -p /tmp/IAC-demo; cd /tmp/IAC-demo
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
    tmux split-window -v -p 20
    sleep 0.5
    tmux send-keys -t1 'git clone --depth=1 https://github.com/javier-lopez/vagrants'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux send-keys -t1 'cd vagrants/minos-core-16.04-keepalived-haproxy-nginx'
    tmux send-keys -t1 ' && vagrant up'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
@autoexe{sh}
    tmux send-keys -t1 'vagrant destroy -f'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end
==============================================================================
TERRAFORM                            PROVISIONAMIENTO DE INFRAESTRUCTURA - IAC
---------

Provisionador de recursos en la nube, aunque también soporta Docker y otros
hipervisores locales.

.. code:: sh

    $ terraform init
    $ terraform plan
    $ terraform apply
    $ terraform destroy

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
TERRAFORM                            PROVISIONAMIENTO DE INFRAESTRUCTURA - IAC

Ejemplo práctico, infraestructura en alta disponibilidad con DigitialOcean:


                                                +-------------+
                                            ,___|    Nginx    | ___
                                            |   |   X.X.X.X   |    |
                                            |   +-------------+    |  R
                                            |                      |  O
                                            |                      |  U
 +----------+           +---------------+__/                       |  N
 |  Client  |___________|    HAProxy    |                          |  D
 |  x.x.x.x |           |    X.X.X.X    |__                        |
 +----------+           +---------------+  \                       |  R
                                            |                      |  O
                                            |                      |  B
                                            |                      |  I
                                            |   +-------------+    |  N
                                            \___|    Nginx    | ___|
                                                |   X.X.X.X   |
                                                +-------------+

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
------------------------------------------------------------------------------
.. code:: sh

    $ git clone --depth=1 https://github.com/javier-lopez/terraforms
    $ cd terraforms/haproxy-www
    $ terraform.plan
    $ terraform.apply.autoapprove
------------------------------------------------------------------------------
@autoexe{sh}
    rm -rf ~/IAC-demo/; mkdir -p ~/IAC-demo; cd ~/IAC-demo
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
    tmux split-window -v -p 20
    sleep 0.5
    tmux send-keys -t1 'git clone --depth=1 https://github.com/javier-lopez/terraforms'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux send-keys -t1 'cd terraforms/haproxy-www'
    tmux send-keys -t1 ' && terraform init && terraform.plan && terraform.apply.autoapprove'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
@autoexe{sh}
    tmux send-keys -t1 'terraform.destroy.autoapprove'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux select-pane -t0
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

  * https://github.com/javier-lopez/talks/blob/master/iac/provisionamiento-de-infraestructura-vagrant-cloudformation-terraform/vlide.md

@autoexe{ vim: set tw=78 ts=8 ft=markdown: }

@autoexe{sh}
    rm -rf ~/IAC-demo/; mkdir -p ~/IAC-demo; cd ~/IAC-demo
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
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
>                            ===============                                 <
>                               Créditos                                     <
>                            ===============                                 <
>                                                                            <
>   Hashicorp: https://www.hashicorp.com                                     <
>                                                                            <
>   Vagrant:   https://vagrantup.com                                         <
>   Terraform: https://terraform.io                                          <
>                                                                            <
>   Grupo:     https://www.meetup.com/Infraestructura-como-codigo/           <
EOF

    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
    tmux send-keys -t0 ':source /tmp/vlide_credits.vim | Credits /tmp/vlide_credits.txt'
    tmux send-keys -t0 C-M
@end

@autoexe{ vim: set tw=78 ts=8 ft=help: }
==============================================================================
