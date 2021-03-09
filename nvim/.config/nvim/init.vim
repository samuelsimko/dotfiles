" Samuel's vim configuration.

" plugins are listed on a separate file for more clarity
source $HOME/.config/nvim/vim-plug/plugins.vim 

" Define leaders
let mapleader = ' '
let maplocalleader = "\\"

set number
set relativenumber

set background=dark 
colorscheme gruvbox 

set nocompatible
filetype plugin on
syntax on


"Enable javacomplete for java files
autocmd FileType java setlocal omnifunc=javacomplete#Complete


"Vimspector and maximize shortcuts

fun GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun


" syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1

" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']

" Jump to definition
nmap <silent> gd <Plug>(coc-definition)

" Debugger remaps for Vimspector
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint


imap <C-e> <C-O><Plug>VimyouautocorrectUndo


" Mappings to split more efficiently
noremap <leader>v <c-w>v<c-w>l
noremap <leader>s <c-w>s<c-w>j
noremap <leader>x <c-w>c


" To avoid a collision with my plugins
nnoremap <SID>something_random <Plug>IMAP_JumpForward

" Mappings to move between windows more efficiently
map <c-j> <c-w>j 
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Ycm mappings
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>

"vim-fugitive mappings

nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G <CR>

nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>

nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>

nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>

nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>

nmap <Leader>/ :Ag<Space>
nmap <Leader>/ :Rg<Space>

nmap <Leader>H :Helptags!<CR>

"automatic vim HardMode (prevents spam of hjkl keys and other features)

"function to copy matches after a search

function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)



" Source of the QuickSpell function: 
" https://vi.stackexchange.com/questions/19680/how-can-i-make-vim-not-use-the-entire-screen-for-spelling-suggestions

" Don't hijack the entire screen for spell checking, just show the top 9 results
" in the commandline.
" Press 0 for the full list. Any key press that's not a valid option (1-9) will
" behave as normal.
fun! QuickSpell()
    if &spell is 0
        echohl Error | echo "Spell checking not enabled" | echohl None
        return
    endif

    " Separator between items.
    let l:sep = ' | '

    " Show as many columns as will fit in the window.
    let l:sug = spellsuggest(expand('<cword>'), 9)
    let l:c = 0
    for l:i in range(0, len(l:sug))
        let l:c += len(l:sug[l:i - 1]) + len(printf('%d ', l:i + 1))
        " The -5 is needed to prevent some hit-enter prompts, even when there is
        " enough space (bug?)
        if l:c + (len(l:sep) * l:i) >= &columns - 5
            break
        endif
    endfor

    " Show options; make it stand out a bit.
    echohl QuickFixLine
    echo join(map(l:sug[:l:i - 1], {i, v -> printf('%d %s', l:i+1, l:v)}), l:sep)
    echohl None

    " Get answer.
    let l:char = nr2char(getchar())

    " Display regular spell screen on 0.
    if l:char is# '0'
        normal! z=
        return
    endif

    let l:n = str2nr(l:char)

    " Feed the character if it's not a number, so it's easier to do e.g. "ciw".
    if l:n is 0 || l:n > len(l:sug)
        return feedkeys(l:char)
    endif

    " Replace!
    exe printf("normal! ciw%s\<Esc>", l:sug[l:n-1])
    echo
endfun
nnoremap z= :call QuickSpell()<CR>


