" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

"Plugins

call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'sheerun/vim-polyglot'

Plug 'scrooloose/NERDTree'

"Plug 'jiangmiao/auto-pairs'

Plug 'morhetz/gruvbox'

"Plug 'vim-scripts/c.vim'

Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
  
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Plug 'ycm-core/YouCompleteMe'
"
"Plug 'mxw/vim-prolog'

Plug 'adimit/prolog.vim'

Plug 'kien/ctrlp.vim'

Plug 'artur-shaik/vim-javacomplete2'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'itspriddle/vim-shellcheck'

Plug 'chrisbra/csv.vim'

Plug 'davidhalter/jedi-vim'

Plug 'puremourning/vimspector'

Plug 'vim-syntastic/syntastic'

Plug 'szw/vim-maximizer'

Plug 'nvie/vim-flake8'

Plug  'vimwiki/vimwiki'

Plug 'justinmk/vim-sneak'

Plug 'tranvansang/octave.vim'

Plug 'https://github.com/adelarsq/vim-matchit'

Plug 'frazrepo/vim-rainbow'

Plug 'liuchengxu/vim-which-key'

Plug 'ThePrimeagen/vim-be-good'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-repeat'

"Plug 'vlime/vlime', {'rtp': 'vim/'}

Plug 'takac/vim-hardtime'

"Plug 'vim-airline/vim-airline'

Plug 'sedm0784/vim-you-autocorrect'

Plug 'rhysd/vim-clang-format'

"Plug 'adolenc/cl-neovim'

Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_hode=0

Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none
Plug 'kballard/vim-swift', {
        \ 'filetypes': 'swift',
        \ 'unite_sources': ['swift/device', 'swift/developer_dir']
        \}

setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u



call plug#end()


