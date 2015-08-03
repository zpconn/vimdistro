syntax on
set smartindent
set shiftwidth=4
set tabstop=4
set number
set ignorecase
set smartcase
set t_Co=256

if match(getcwd(), "/feedstream_server") >= 0
	set tabstop=8
end

execute pathogen#infect()

let mapleader="\<Space>"
set background=dark
colorscheme solarized

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Tagbar
nnoremap <Leader>m :TagbarToggle<CR>

" Highlight searches.
set hlsearch
nnoremap <silent> <CR> :nohlsearch<Bar>:echo<CR>

" Go to first non-space character.
nnoremap <leader>0 ^

" Enable persistent undo.
if has("persistent_undo")
	set undodir=~/.vim/undo/
	set undofile
endif

" Move the currently selected line(s) up or down.
nnoremap <C-j> :m .+1<CR>
nnoremap <C-k> :m .-2<CR>

" Highlight the current line.
set cursorline

" Disable arrows in NERDTree
let g:NERDTreeDirArrows=0

map <Leader>pt :NERDTreeToggle<CR>

nnoremap <Leader>ut :UndotreeToggle<CR>

inoremap jj <Esc>
inoremap fd <Esc>
nnoremap fd <Esc>
vnoremap fd <Esc>

nnoremap JJJJ <Nop>

set showcmd

set incsearch

if !&scrolloff
	set scrolloff=5
endif
if !&sidescrolloff
	set sidescrolloff=5
endif
set display+=lastline

if &history < 1000
	set history=1000
endif

set autoindent
set copyindent
set autoread

if version >= 700
	set spl=en spell
	set nospell
endif

set mouse=a

set backspace=2

if has("autocmd")
	filetype plugin indent on
endif

au BufNewFile,BufRead *.rvt set filetype=tcl
au BufNewFile,BufRead *.rcl set filetype=tcl

set laststatus=2

" find-vimrc
nnoremap <leader>fv :e ~/.vim/vimrc<CR>

" WINDOW MANAGEMENT:

nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>wc <C-w>q

" TAB MANAGEMENT:

nnoremap <leader>tl gt
nnoremap <leader>th gT
nnoremap <leader>tc :tabclose<CR>

" SWOOP:

function! Multiple_cursors_before()
    if exists('*SwoopFreezeContext') != 0
    	call SwoopFreezeContext()
    endif
endfunction

function! Multiple_cursors_after()
    if exists('*SwoopFreezeContext') != 0
    	call SwoopUnFreezeContext()
    endif
endfunction

let g:swoopUseDefaultKeyMap = 0

nmap <leader>/ :call Swoop()<CR>
vmap <leader>/ :call SwoopSelection()<CR>

nmap <leader>m/ :call SwoopMulti()<CR>
vmap <leader>m/ :call SwoopMultiSelection()<CR>

" UNITE:

" t = tab
" h = horizontal split
" v = vertical split

" find-local-*
nnoremap <leader>flt :Unite -start-insert file_rec/async -default-action=tabopen<CR>
nnoremap <leader>flh :Unite -start-insert file_rec/async -default-action=split<CR>
nnoremap <leader>flv :Unite -start-insert file_rec/async -default-action=vsplit<CR>
nnoremap <leader>flf :Unite -start-insert file_rec/async<CR>

" find-git-*
nnoremap <leader>fgt :Unite -start-insert file_rec/async:! -default-action=tabopen<CR>
nnoremap <leader>fgh :Unite -start-insert file_rec/async:! -default-action=split<CR>
nnoremap <leader>fgv :Unite -start-insert file_rec/async:! -default-action=vsplit<CR>
nnoremap <leader>fgf :Unite -start-insert file_rec/async:!<CR>

" find-home-*
nnoremap <leader>fht :Unite -start-insert file_rec/async:~/src -default-action=tabopen<CR>
nnoremap <leader>fhh :Unite -start-insert file_rec/async:~/src -default-action=split<CR>
nnoremap <leader>fhv :Unite -start-insert file_rec/async:~/src -default-action=vsplit<CR>
nnoremap <leader>fhf :Unite -start-insert file_rec/async:~/src<CR>

" most recently viewed files
nnoremap <leader>frt :Unite -quick-match file_mru -default-action=tabopen<CR>
nnoremap <leader>frh :Unite -quick-match file_mru -default-action=split<CR>
nnoremap <leader>frv :Unite -quick-match file_mru -default-action=vsplit<CR>
nnoremap <leader>frf :Unite -quick-match file_mru<CR>

" open buffers
nnoremap <leader>b :Unite -quick-match buffer<CR>

" grep-local
nnoremap <leader>gl :Unite -auto-preview -no-split grep:.<CR>

" grep-local-proc
nnoremap <leader>glp :Unite -auto-preview -no-split grep:.<CR>proc<Space>

" grep-local-word
nnoremap <silent> <leader>glw :UniteWithCursorWord -auto-preview -no-split grep:.<CR>

" grep-git
nnoremap <leader>gg :Unite -auto-preview -no-split grep:!<CR>

" grep-git-proc
nnoremap <leader>ggp :Unite -auto-preview -no-split grep:!<CR>proc<Space>

" grep-git-word
nnoremap <silent> <leader>ggw :UniteWithCursorWord -auto-preview -no-split grep:!<CR>

" grep-home
nnoremap <leader>gh :Unite -auto-preview -no-split grep:/usr/home/zachery.conn/src/<CR>

" grep-home-proc
nnoremap <leader>ghp :Unite -auto-preview -no-split grep:/usr/home/zachery.conn/src/<CR>proc<Space>

" grep-git-word
nnoremap <silent> <leader>ghw :UniteWithCursorWord -auto-preview -no-split grep:/usr/home/zachery.conn/src/<CR>proc<Space>

let g:unite_source_history_yank_enable = 1
let g:unite_source_grep_command = 'ack'
let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_rec_max_cache_files = 99999

":autocmd BufWinEnter * setlocal modifiable

