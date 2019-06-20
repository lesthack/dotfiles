# Dotfiles

Este repositorio contiene las configuraciones necesarias para mi trabajo diario.  Si crees que pueden servirte, siéntete libre de  tomarlas, forkearlas, e incluso, atrévete a sugerirme nuevas herramientas, configuraciones o plugins.

## Vim
![GVim on Elementary OS](.vim/gvim.png)

Lista de Plugins:

1. [Emmet](https://github.com/mattn/emmet-vim)
2. [Neocomplcache](https://github.com/Shougo/neocomplcache.vim)
3. [Nerdtree](https://github.com/scrooloose/nerdtree)
4. [Snipmate](https://github.com/garbas/vim-snipmate)
5. [Tabular](https://github.com/godlygeek/tabular)
6. [Tagbar](https://github.com/majutsushi/tagbar)
7. [Airline](https://github.com/bling/vim-airline)
8. [Autoclose](https://github.com/Townk/vim-autoclose)
9. [Easymotion](https://github.com/Lokaltog/vim-easymotion)
10. [Fugitive](https://github.com/tpope/vim-fugitive)
11. [Gitgutter](https://github.com/airblade/vim-gitgutter)
12. [Vim Multiple Cursors](https://github.com/terryma/vim-multiple-cursors)
13. [Vim Indent guides](https://github.com/nathanaelkane/vim-indent-guides)
14. [Vim Wakatime](https://github.com/wakatime/vim-wakatime)
15. [Vim kotlin](https://github.com/udalov/kotlin-vim)
16. [Vim Vala](https://github.com/arrufat/vala.vim)
17. [Vim Typescript](https://github.com/leafgarland/typescript-vim)
18. [Vim Dart](https://github.com/dart-lang/dart-vim-plugin)
19. [Vim Flutter](https://github.com/thosakwe/vim-flutter)

## Clonado
```bash
$ git clone https://github.com/lesthack/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ git submodule update --init --recursive
```

## Usar configuraciones de VIM
La manera mas sencilla es usar enlaces simbólicos, apuntando a nuestro archivo .vimrc y el directorio .vim
```bash
$ ln -s ~/.dotfiles/.vim .vim
$ ln -s ~/.dotfiles/.vim/vimrc ~/.vimrc
```

## Actualizar submodulos
Para actualizar todos los submodulos de forma fácil, ejecuta:
```bash
$ git pull --recurse-submodules
```