*CONTENIDOS*                         *PROVISIONAMIENTO* *DE* *INFRAESTRUCTURA* - *IAC*

    1. Vagrant / Ansible ................................................. |1|
    2. Packer ............................................................ |2|
    3. Docker compose .................................................... |3|
    4. Terraform ......................................................... |4|
    5. Docker Swarm ...................................................... |5|
    6. Traefik ........................................................... |6|
    7. Fin ............................................................... |7|

@autoexe{ vim: set tw=78 ts=8 ft=help: }

@autoexe{}
    echohl WarningMsg
    let err_msg="Error: no se ha encontrado una sesión de Tmux activa"
    let err_msg.=", por favor invoque una y reabra este archivo desde ahi"
    if !exists('$TMUX') | echo err_msg | endif
    echohl None
@end
==============================================================================
VAGRANT + ANSIBLE                    PROVISIONAMIENTO DE INFRAESTRUCTURA - IAC
-----------------

Definición de infraestructura, ejemplo

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
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
@end
------------------------------------------------------------------------------
.. code:: sh

    $ git clone --depth=1 https://github.com/javier-lopez/vagrants
    $ cd vagrants/minos-core-16.04-keepalived-haproxy-nginx-ansible-minimal
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
    tmux send-keys -t1 'cd vagrants/minos-core-16.04-keepalived-haproxy-nginx-ansible-minimal'
    tmux send-keys -t1 ' && time vagrant up'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
    $ while :; do curl 10.10.10.10; sleep 1; done
@autoexe{sh}
    tmux send-keys -t1 'while :; do curl 10.10.10.10; sleep 1; done'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
@autoexe{sh}
    tmux send-keys -t1 C-C
    sleep 0.5
    tmux send-keys -t1 'vagrant destroy -f'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end
==============================================================================
PACKER                               PROVISIONAMIENTO DE INFRAESTRUCTURA - IAC
------

Generador de plantillas; Azure, EC2, DO, WMWare, VBox, Docker

.. code:: sh

    $ packer build definición.json

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
==============================================================================
PACKER                               PROVISIONAMIENTO DE INFRAESTRUCTURA - IAC
------

Generador de plantillas

.. code:: sh

    $ git clone --depth=1 https://github.com/javier-lopez/packers
    $ cd packers/openbsd
    $ packer build openbsd-6.2-amd64-vbox.json
    $ vagrant box add openbsd-6.2-amd64 ./openbsd-6.2-amd64-vbox.box
    $ vagrant init openbsd-6.2-amd64 && vagrant up

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }

@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
@end
------------------------------------------------------------------------------
@autoexe{sh}
    rm -rf ~/IAC-demo/; mkdir -p ~/IAC-demo; cd ~/IAC-demo
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
    tmux split-window -v -p 20
    sleep 0.5
    tmux send-keys -t1 'git clone --depth=1 https://github.com/javier-lopez/packers'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux send-keys -t1 'cd packers/openbsd'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux send-keys -t1 'test -d ~/code/packers/openbsd/packer_cache && cp -r ~/code/packers/openbsd/packer_cache .'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux send-keys -t1 'time packer build openbsd-6.2-amd64-vbox.json'
    tmux send-keys -t1 ' && vagrant box add openbsd-6.2-amd64 ./openbsd-6.2-amd64-vbox.box'
    tmux send-keys -t1 C-M
    sleep 0.5
@end
------------------------------------------------------------------------------
@autoexe{sh}
    rm -rf ~/IAC-demo/; mkdir -p ~/IAC-demo; cd ~/IAC-demo
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
    tmux split-window -v -p 20
    sleep 0.5
    tmux send-keys -t1 'vagrant init openbsd-6.2-amd64 && vagrant up && vagrant ssh'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
@autoexe{sh}
    tmux send-keys -t1 'vagrant destroy -f'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
    sleep 0.5
@end
==============================================================================
DOCKER-COMPOSE                       PROVISIONAMIENTO DE INFRAESTRUCTURA - IAC
--------------

Provisionador de contenedores. Auxiliado por Vagrant para SO Windows / MacOS

.. code:: sh

    $ vagrant init minos/core-16.04-docker
    $ vagrant up
    $ vagrant ssh 'git clone --depth=1 https://github.com/javier-lopez/microblogging'
    $ vagrant ssh 'cd microblogging && bash setup.sh'

    http://localhost:5000

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }

@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
@end
------------------------------------------------------------------------------
@autoexe{sh}
    # rm -rf ~/IAC-demo/; mkdir -p ~/IAC-demo; cd ~/IAC-demo
    # [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
    # tmux split-window -v -p 20
    # sleep 0.5
    # tmux send-keys -t1 'git clone --depth=1 https://github.com/javier-lopez/vagrants'
    # tmux send-keys -t1 C-M
    # sleep 0.5
    # tmux send-keys -t1 'cd vagrants/minos-core-16.04-docker'
    # tmux send-keys -t1 ' && time (vagrant up; '
    # tmux send-keys -t1 ' vagrant ssh -c "git clone --depth=1 https://github.com/javier-lopez/microblogging" ; '
    # tmux send-keys -t1 ' vagrant ssh -c "cd microblogging && bash setup.sh")'
    # tmux send-keys -t1 C-M
    # sleep 0.5
    # tmux select-pane -t0
@end
==============================================================================
DOCKER-COMPOSE                       PROVISIONAMIENTO DE INFRAESTRUCTURA - IAC
--------------

Provisionador de contenedores.

.. code:: sh

    $ git clone --depth=1 https://github.com/javier-lopez/microblogging
    $ cd microblogging && time bash setup.sh

    http://localhost:5000

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }

@autoexe{sh}
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
@end
------------------------------------------------------------------------------
@autoexe{sh}
    rm -rf ~/IAC-demo/; mkdir -p ~/IAC-demo; cd ~/IAC-demo
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
    tmux split-window -v -p 20
    sleep 0.5
    tmux send-keys -t1 'git clone --depth=1 https://github.com/javier-lopez/microblogging'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux send-keys -t1 'cd microblogging && time bash setup.sh'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux select-pane -t0
@end
==============================================================================
TERRAFORM                            PROVISIONAMIENTO DE INFRAESTRUCTURA - IAC
---------

Definición de infraestructura, ejemplo con DigitalOcean:

                  +-------------------+       +------------------+
                  |   Docker Manager  |_______|   Docker Worker  | ___
                  |    10.10.10.11    |   |   |    10.10.10.14   |    |
                  +-------------------+   |   +------------------+    |  R
                                          |                           |  O
                                          |                           |  U
 +----------+     +-------------------+__/ \__+------------------+    |  N
 |  Client  |_____|   Docker Manager  |_______|   Docker Worker  | ___|  D
 |  x.x.x.x |     |    10.10.10.12    |__   __|    10.10.10.15   |    |
 +----------+     +-------------------+  \ /  +------------------+    |  R
                                          |                           |  O
                                          |                           |  B
                                          |                           |  I
                  +-------------------+   |   +------------------+    |  N
                  |   Docker Manager  |___|__ |   Docker Worker  | ___|
                  |    10.10.10.13    |       |    10.10.10.16   |
                  +-------------------+       +------------------+

@autoexe{ vim: set tw=78 ts=8 ft=rst norl: }
------------------------------------------------------------------------------
.. code:: sh

    $ terraform init && terraform plan && terraform apply
@autoexe{sh}
    rm -rf ~/IAC-demo/; mkdir -p ~/IAC-demo; cd ~/IAC-demo
    [ "$(tmux list-panes | wc -l)" -gt 1 ] && tmux kill-pane -a -t0
    tmux split-window -v -p 20
    sleep 0.5
    tmux send-keys -t1 'git clone --depth=1 https://github.com/javier-lopez/terraforms'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux send-keys -t1 'cd terraforms/docker-swarm'
    tmux send-keys -t1 ' && terraform init && terraform.plan && terraform.apply.autoapprove'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
    $ terraform show
@autoexe{sh}
    tmux send-keys -t1 'terraform show'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
    $ ssh docker@"$(terraform show | awk '/ipv4_address/{print $3; exit}')" docker node ls
@autoexe{sh}
    tmux send-keys -t1 'ssh -F /dev/null -o UserKnownHostsFile=/dev/null -o CheckHostIP=no -o StrictHostKeyChecking=no docker@$(terraform show | awk "/ipv4_address/{print \$3; exit}") docker node ls'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux select-pane -t0
@end
==============================================================================
TERRAFORM                            PROVISIONAMIENTO DE INFRAESTRUCTURA - IAC
---------

Definición de infraestructura, ejemplo con DigitalOcean:

                  +-------------------+       +------------------+
                  |   Docker Manager  |_______|   Docker Worker  | ___
                  |    10.10.10.11    |   |   |    10.10.10.14   |    |
                  +-------------------+   |   +------------------+    |  R
                                          |                           |  O
                                          |                           |  U
 +----------+     +-------------------+__/ \__+------------------+    |  N
 |  Client  |_____|   Docker Manager  |_______|   Docker Worker  | ___|  D
 |  x.x.x.x |     |    10.10.10.12    |__   __|    10.10.10.15   |    |
 +----------+     +-------------------+  \ /  +------------------+    |  R
                                          |                           |  O
                                          |                           |  B
                                          |                           |  I
                  +-------------------+   |   +------------------+    |  N
                  |   Docker Manager  |___|__ |   Docker Worker  | ___|
                  |    10.10.10.13    |       |    10.10.10.16   |
                  +-------------------+       +------------------+

.. code:: sh

    $ git clone https://github.com/javier-lopez/dockers/
@autoexe{sh}
    tmux send-keys -t1 'ssh -F /dev/null -o UserKnownHostsFile=/dev/null -o CheckHostIP=no -o StrictHostKeyChecking=no docker@$(terraform show | awk "/ipv4_address/{print \$3; exit}") git clone https://github.com/javier-lopez/dockers/'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
    $ docker stack deploy -c dockers/traefik-backends/traefik.yml traefik
@autoexe{sh}
    tmux send-keys -t1 'ssh -F /dev/null -o UserKnownHostsFile=/dev/null -o CheckHostIP=no -o StrictHostKeyChecking=no docker@$(terraform show | awk "/ipv4_address/{print \$3; exit}") docker stack deploy -c dockers/traefik-backends/traefik.yml traefik'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
    $ docker stack deploy -c dockers/traefik-backends/visualizer.yml visualizer
@autoexe{sh}
    tmux send-keys -t1 'ssh -F /dev/null -o UserKnownHostsFile=/dev/null -o CheckHostIP=no -o StrictHostKeyChecking=no docker@$(terraform show | awk "/ipv4_address/{print \$3; exit}") docker stack deploy -c dockers/traefik-backends/visualizer.yml visualizer'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
    $ docker stack deploy -c dockers/traefik-backends/echo.yml echo
@autoexe{sh}
    tmux send-keys -t1 'ssh -F /dev/null -o UserKnownHostsFile=/dev/null -o CheckHostIP=no -o StrictHostKeyChecking=no docker@$(terraform show | awk "/ipv4_address/{print \$3; exit}") docker stack deploy -c dockers/traefik-backends/echo.yml echo'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
    $ while :; do curl echo.example.com; sleep 1; done
@autoexe{sh}
    tmux send-keys -t1 'sudo ls'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
@autoexe{sh}
    tmux send-keys -t1 'echo $(terraform show | awk "/ipv4_address/{print \$3; exit}") echo.example.com | sudo tee -a /etc/hosts'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux send-keys -t1 'echo $(terraform show | awk "/ipv4_address/{print \$3; exit}") traefik.example.com | sudo tee -a /etc/hosts'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux send-keys -t1 'echo $(terraform show | awk "/ipv4_address/{print \$3; exit}") visualizer.example.com | sudo tee -a /etc/hosts'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux send-keys -t1 'while :; do curl echo.example.com; sleep 1; done'
    tmux send-keys -t1 C-M
    tmux select-pane -t0
@end
------------------------------------------------------------------------------
    $ terraform destroy
@autoexe{sh}
    tmux send-keys -t1 C-C
    sleep 0.5
    tmux send-keys -t1 'terraform.destroy.autoapprove'
    tmux send-keys -t1 C-M
    sleep 0.5
    tmux select-pane -t0
@end
==============================================================================
FIN
@autoexe{sh}
    sudo rm -rf ~/IAC-demo/
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
