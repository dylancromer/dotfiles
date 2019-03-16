filetype plugin indent on
syntax on

set backspace=indent,eol,start

call plug#begin()
Plug 'lervag/vimtex'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'fidian/hexmode'
Plug 'Shougo/vinarise.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'metakirby5/codi.vim'
Plug 'tpope/vim-abolish'
Plug 'junegunn/goyo.vim'
Plug 'terryma/vim-expand-region'
Plug 'wincent/command-t'
Plug 'sheerun/vim-polyglot'
Plug 'flazz/vim-colorschemes'
call plug#end()

set ruler
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Color"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme atom

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPLIT PANES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

map - :split<cr>
map <Bar> :vsplit<cr>

set splitbelow
set splitright

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"SPELL"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spell spelllang=en_us
set spell!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Custom Autocmds"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
	autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\   exe "normal g`\"" |
		\ endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>
