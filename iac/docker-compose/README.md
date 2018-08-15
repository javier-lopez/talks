# Quick start

## Bare Metal

    $ ./setup.sh
    in another window $ tmux new -A -s iac

## Or Virtualized

    $ vagrant up
    $ vagrant ssh
    vagrant $ ./setup.sh

In another window

    $ vagrant ssh
    vagrant $ tmux new -A -s iac
