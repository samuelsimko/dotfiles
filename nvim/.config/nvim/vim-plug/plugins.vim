" Samuel's nvim plugins.

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'adimit/prolog.vim'

Plug 'artur-shaik/vim-javacomplete2'

Plug 'chrisbra/csv.vim'

Plug 'davidhalter/jedi-vim'

Plug 'frazrepo/vim-rainbow'

Plug 'https://github.com/adelarsq/vim-matchit'

Plug 'itspriddle/vim-shellcheck'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'justinmk/vim-sneak'

Plug 'kballard/vim-swift', {
        \ 'filetypes': 'swift',
        \ 'unite_sources': ['swift/device', 'swift/developer_dir']
        \}

Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none

Plug 'kien/ctrlp.vim'

Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_hode=0

Plug 'liuchengxu/vim-which-key'

Plug 'morhetz/gruvbox'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvie/vim-flake8'

Plug 'puremourning/vimspector'

Plug 'rhysd/vim-clang-format'

Plug 'sedm0784/vim-you-autocorrect'

Plug 'scrooloose/NERDTree'

Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
    setlocal spell
    set spelllang=en_us
    inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

Plug 'sheerun/vim-polyglot'

Plug 'szw/vim-maximizer'

Plug 'takac/vim-hardtime'

Plug 'ThePrimeagen/vim-be-good'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-surround'

Plug 'tranvansang/octave.vim'

Plug  'vimwiki/vimwiki'

Plug 'vim-syntastic/syntastic'

call plug#end()
