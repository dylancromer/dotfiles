"Allow compat between vimtex and polyglot
let g:polyglot_disabled = ['latex']

call plug#begin()
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'fidian/hexmode'
Plug 'Shougo/vinarise.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-expand-region'
Plug 'wincent/command-t'
Plug 'flazz/vim-colorschemes'
Plug 'jnwhiteh/vim-golang'
Plug 'dylancromer/vim-cython'
Plug 'dense-analysis/ale'
Plug 'puremourning/vimspector'
Plug 'sagi-z/vimspectorpy'
Plug 'bogado/file-line'
Plug 'ntpeters/vim-better-whitespace'
Plug 'voldikss/vim-floaterm'
Plug 'dylancromer/2049.vim'
if has('nvim')
    Plug 'NvChad/nvim-colorizer.lua'
endif
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
color 2049-ylcy
let g:better_whitespace_guicolor='#eb4e6e'

"""
" PLUGIN CONFIG
"""
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1

let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_set_signs = 1

" Stops polyglot from screwing up trailing whitespace highlighting in Neovim
" Use vim-better-whitespace instead
let g:python_highlight_space_errors = 0

"""
" NEOVIM SPECIFIC CONFIG
"""
if has('nvim')
    lua require('wincent.commandt').setup()
    let g:python3_host_prog = '/Users/crowlake/.local/venv/nvim/bin/python3'
else
    let g:CommandTPreferredImplementation='ruby'
endif

lua <<EOF
require'colorizer'.setup {
    filetypes = {
        "vim";
        "lua";
    },
    user_default_options = {
        mode = "background";
        names = false;
        hsl_fn = true;
    },
}
EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
" allow unsaved background buffers and remember marks/undo for them
set hidden
" remember more commands and search history
set history=10000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set cursorline
set cmdheight=1
set switchbuf=useopen
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
"set t_ti= t_te=
" keep more context when scrolling off the end of a buffer
set scrolloff=3
" Don't make backups at all
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" display incomplete commands
set showcmd
" Enable highlighting for syntax
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
let mapleader=","
" Fix slow O inserts
:set timeout timeoutlen=1000 ttimeoutlen=100
" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable
" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces
" If a file is changed outside of vim, automatically reload it without asking
set autoread
" Use the old vim regex engine (version 1, as opposed to version 2, which was
" introduced in Vim 7.3.969). The Ruby syntax highlighting is significantly
" slower with the new regex engine.
set re=1
" Stop SQL language files from doing unholy things to the C-c key
let g:omni_sql_no_default_maps = 1

nnoremap <leader>y :y+
nnoremap <leader>yy :yy+
nnoremap <leader>p :p+
nnoremap <leader>pp :pp+

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
" SPELL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spell spelllang=en_us
set spell!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMMAND-T
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
    :lua vim.keymap.set('n', '<Leader>b', '<Plug>(CommandTBuffer)')
    :lua vim.keymap.set('n', '<Leader>j', '<Plug>(CommandTJump)')
    :lua vim.keymap.set('n', '<Leader>t', '<Plug>(CommandT)')
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BANG REPLACEMENT FOR NEOVIM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
    :lua vim.keymap.set('n', '!', 'FloatermNew! --width=0.000 --height=0.999')
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove search highlight
nnoremap <silent> <leader>c :nohlsearch<cr>
" Toggle ALE highlighting
nnoremap <silent> <enter> :ALEToggle<cr>
" Toggle line numbers
nnoremap <silent> <leader>l :windo set invnumber<cr>
" Toggle line numbers just for current buffer
nnoremap <silent> <leader>; :set invnumber<cr>
"I think this remaps exiting insert mode to c-c
inoremap <c-c> <esc>

"Adds a newline without going into insert mode
"nnoremap oo o<Esc>k
"nnoremap OO O<Esc>j

command! -nargs=0 PopStack 0d|norm ''

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NEOVIM MISC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
    nnoremap <silent> <c-x> :FloatermToggle<cr>
    tnoremap <silent> <c-x> <C-\><C-n>:FloatermToggle<cr>
    tnoremap <silent> <c-q> <C-\><C-n>:FloatermKill<cr>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BIND tt TO MY TEST COMMANDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetTestKeys(...)
    let test_commands = join(a:000)
    let binding = ':w\|:!' . test_commands . '<cr>'
    exec ':nnoremap tt ' . binding
endfunction
command! -nargs=+ SetTT call SetTestKeys(<f-args>)
