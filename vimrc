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

" Swoop:

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

" Unite:

nnoremap <leader>flt :Unite -start-insert file_rec/async -default-action=tabopen<CR>
nnoremap <leader>flh :Unite -start-insert file_rec/async -default-action=split<CR>
nnoremap <leader>flv :Unite -start-insert file_rec/async -default-action=vsplit<CR>
nnoremap <leader>flf :Unite -start-insert file_rec/async<CR>

nnoremap <leader>fgt :Unite -start-insert file_rec/async:! -default-action=tabopen<CR>
nnoremap <leader>fgh :Unite -start-insert file_rec/async:! -default-action=split<CR>
nnoremap <leader>fgv :Unite -start-insert file_rec/async:! -default-action=vsplit<CR>
nnoremap <leader>fgf :Unite -start-insert file_rec/async:!<CR>

nnoremap <leader>bb :Unite -quick-match buffer<CR>

nnoremap <leader>gl :Unite -auto-preview -no-split grep:.<CR>
nnoremap <leader>glp :Unite -auto-preview -no-split grep:.<CR>proc<Space>
nnoremap <leader>gg :Unite -auto-preview -no-split grep:!<CR>
nnoremap <leader>ggp :Unite -auto-preview -no-split grep:!<CR>proc<Space>

let g:unite_source_history_yank_enable = 1

