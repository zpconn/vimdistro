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

set background=dark
colorscheme solarized

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Tagbar
nnoremap <Leader>m :TagbarToggle<CR>

" Highlight searches.
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplcache#smart_close_popup() . "\<CR>"
endfunction

" <C-h>: close popup
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

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

" Smooth scrolling.
"noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
"noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
"noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
"noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

" Sexy scrolling.
"let g:SexyScroller_ScrollTime = 10
"let g:SexyScroller_CursorTime = 5
"let g:SexyScroller_MaxTime = 500
"let g:SexyScroller_EasingStyle = 2

" Disable arrows in NERDTree
let g:NERDTreeDirArrows=0

map <Leader>n :NERDTreeToggle<CR>

nnoremap <Leader><C-n> :UndotreeToggle<CR>

inoremap jj <Esc>

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

" Always enable rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Enable fuzzy line searching with Ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['line', 'tag']

autocmd BufWritePost * execute ':SemanticHighlight'
autocmd BufReadPost * execute ':SemanticHighlight'

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

