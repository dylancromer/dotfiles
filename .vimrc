"Allow compat between vimtex and polyglot
let g:polyglot_disabled = ['latex']

call plug#begin()
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'fidian/hexmode'
Plug 'Shougo/vinarise.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-expand-region'
Plug 'wincent/command-t'
Plug 'jnwhiteh/vim-golang'
Plug 'dylancromer/vim-cython'
Plug 'dense-analysis/ale'
Plug 'puremourning/vimspector'
Plug 'sagi-z/vimspectorpy'
Plug 'bogado/file-line'
Plug 'ntpeters/vim-better-whitespace'
Plug 'voldikss/vim-floaterm'
Plug 'dylancromer/2049.vim'
Plug 'folke/tokyonight.nvim'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'dylancromer/neovim-ayu'
Plug 'EdenEast/nightfox.nvim'
Plug 'maxmx03/fluoromachine.nvim'
if has('nvim')
    Plug 'NvChad/nvim-colorizer.lua'
endif
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors

function! OverridesForAllSchemes () abort
    highlight Normal guibg=#0e141a
endfunction

augroup OverrideAllColorschemes
    autocmd!
    autocmd Colorscheme ayu-mirage call OverridesForAllSchemes()
augroup END

function! TokyoNightOverrides () abort
    highlight NormalNC guibg=#05181c
endfunction

augroup OverrideTokyoNight
    autocmd!
    autocmd Colorscheme tokyonight call TokyoNightOverrides()
augroup END

" lua <<EOF
" require("tokyonight").setup({
"   -- your configuration comes here
"   -- or leave it empty to use the default settings
"   style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
"   light_style = "day", -- The theme is used when the background is set to light
"   transparent = false, -- Enable this to disable setting the background color
"   terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
"   styles = {
"     -- Style to be applied to different syntax groups
"     -- Value is any valid attr-list value for `:help nvim_set_hl`
"     comments = { italic = false },
"     keywords = { italic = false },
"     functions = {},
"     variables = {},
"     -- Background styles. Can be "dark", "transparent" or "normal"
"     sidebars = "dark", -- style for sidebars, see below
"     floats = "dark", -- style for floating windows
"   },
"   sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
"   day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
"   hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
"   dim_inactive = false, -- dims inactive windows
"   lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

"   --- You can override specific color groups to use other groups or a hex color
"   --- function will be called with a ColorScheme table
"   ---@param colors ColorScheme
"   on_colors = function(colors) end,

"   --- You can override specific highlights to use other groups or a hex color
"   --- function will be called with a Highlights and ColorScheme table
"   ---@param highlights Highlights
"   ---@param colors ColorScheme
"   on_highlights = function(highlights, colors) end,
" })

" vim.cmd[[colorscheme tokyonight]]
" EOF

" lua <<EOF
" local fm = require 'fluoromachine'

" fm.setup {
"     glow = true,
"     theme = 'fluoromachine',
"     overrides = {
"         ['@type'] = { italic = false },
"         ['@function'] = { italic = false },
"         ['@comment'] = { italic = false },
"         ['@keyword'] = { italic = false },
"         ['@constant'] = { italic = false },
"         ['@variable'] = { italic = false },
"         ['@field'] = { italic = false },
"         ['@parameter'] = { italic = false},
"     }
" }

" vim.cmd.colorscheme('fluoromachine')
" EOF

colorscheme ayu-mirage
let g:better_whitespace_guicolor='#eb4e6e'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TREESITTER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1

let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_filetype_changed = 1
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
        "toml";
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

vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>Y "+yg

vnoremap <leader>p "+p
nnoremap <leader>p "+p
vnoremap <leader>P "+p
nnoremap <leader>P "+p

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
" MISC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove search highlight
nnoremap <silent> <leader>c :nohlsearch<cr>
" Toggle ALE highlighting
nnoremap <silent> <enter> :ALEToggle<cr>
nnoremap <leader>0 :ALENext<cr>
nnoremap <leader>9 :ALEPrevious<cr>
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
function! SetTTBinding(...)
    let test_commands = join(a:000)
    let binding = ':w\|:FloatermNew! --width=0.999 --height=0.999 clear && ' . test_commands . ' <cr>'
    exec ':nnoremap tt ' . binding
endfunction
command! -nargs=+ BindTT call SetTTBinding(<f-args>)

function! SetTestKeys(...)
    let current_file = expand('%:p')
    let test_commands = join(a:000)
    let binding = ':w\|:FloatermNew! --width=0.999 --height=0.999 clear && ' . test_commands . ' ' . current_file . ' <cr>'
    exec ':nnoremap tt ' . binding
endfunction
command! -nargs=+ SetTest call SetTestKeys(<f-args>)
