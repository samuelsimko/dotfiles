==================
 Samuel's dotfiles
==================

About
-----

This repository contains dotfiles to set up my personal GNU/Linux development
environment and configure several preferred applications.

- Editor: nvim
- Shell: Zsh
- Terminal: Termite
- Theme: Gruvbox
- Window manager: i3wm

This repository was heavily based on https://github.com/tiborsimko/dotfiles.

Screenshot
----------

.. figure:: https://raw.githubusercontent.com/samuelsimko/dotfiles/master/screenshot.png
   :alt: screenshot.png
   :align: center

Prerequisites
-------------

This repository uses `GNU Stow <https://www.gnu.org/software/stow/>`_ to manage
symbolic links to dotfiles. The ``stow`` package should be readily installable
using your operating system's package manager.

Usage
-----

First, clone this repository to new home:

.. code-block:: console

    $ cd $HOME
    $ git clone git@github.com:samuelsimko/dotfiles .dotfiles

Second, install any wanted software (such as ``vim``, ``i3``) using
your operating system's package manager (such as ``apt``, ``brew``, ``pacman``,
``yum``):

.. code-block:: console

    $ sudo pacman -S neovim zsh

Third, install vim-plug (used for vim):

.. code-block:: console

    $ # install vim-plug (used for vim):
    $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Fourth, activate all wanted configurations (such as ``tmux``, ``vim``,
``zsh``) via ``stow``:

.. code-block:: console

    $ stow nvim i3
