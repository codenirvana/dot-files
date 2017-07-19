set nocompatible

filetype plugin indent on

" Config
set t_Co=256
set backspace=indent,eol,start
set clipboard=unnamed           " Paste to/from global clipboard
"set colorcolumn=80
set cursorline
set autoread
set expandtab                   " die you stupid tabs
set foldcolumn=1                " fixes weird indent/paint bug
set hidden                      " show unnecessary whitespace chars
set history=1000                " remember more commands and search history
set ignorecase                  " case-insensitive search
set incsearch                   " show search matches as you type
set laststatus=2                " always show status bar
set lazyredraw                  " don’t update display when executing macros
set list listchars=tab:»\ ,trail:·" expose evil tabs and trailing whitespace
set mousehide                   " hide mouse while typing
set nobackup                    " no backup files; it's 70's style cluttering
set noerrorbells                " no really, don’t beep
set nomodeline                  " disable mode lines (security measure)
set noswapfile                  " do not write annoying intermediate swap files,
set nowb
set nowrap                      " don’t wrap lines
set relativenumber
set number                      " show line numebers
set numberwidth=5
set ruler                       " show ruler
set scrolljump=5                " reduce redraws by scrolling 5 lines at a time
set scrolloff=0                 " don't scroll until you hit the top/bottom of the screen
set shiftround                  " use multiple of shiftwidth for `<` and `>`
set shiftwidth=2                " number of spaces to use for autoindenting
set showmatch                   " set show matching parentheses
set mat=2
set showmode                    " always show what mode we’re currently editing in
set smartcase                   " IDK some search thing
set splitbelow                  " open top to bottom (natural)
set splitright                  " open left to right (natural)
set softtabstop=2
set tabstop=2
set smarttab
set undolevels=1000             " use many muchos levels of undo
set visualbell                  " don’t beep
set encoding=utf-8
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting

" Change cursor shape in different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

if exists("&undofile")
  set undofile                  " keep a persistent undo file
  set undodir=~/.vim/tmp/undo//,~/tmp//,/tmp//
endif

" Vim Plug
call plug#begin('~/.vim/plugged')

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }

" Color Schemes
Plug 'morhetz/gruvbox'

" Easy Align
Plug 'junegunn/vim-easy-align'

" NERD Commenter
Plug 'scrooloose/nerdcommenter'

" NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Surround
Plug 'tpope/vim-surround'

" Syntastic
Plug 'vim-syntastic/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'

" Git Gutter
Plug 'airblade/vim-gitgutter'

" JavaScript
Plug 'pangloss/vim-javascript'

" Autocomplete [ , ( etc
Plug 'jiangmiao/auto-pairs'

" Autocomplete Snippets
Plug 'valloric/youcompleteme'

" Vim Go
Plug 'fatih/vim-go'

" Indention levels with thin vertical lines
Plug 'yggdroot/indentline'

" elm-vim
Plug 'ElmCast/elm-vim'

" purescript-vim
Plug 'raichoo/purescript-vim'


" c++
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()

" Plugin Config

" Airline
let g:airline_powerline_fonts = 1
let g:AirlineTheme='gruvbox'

" NERDTree
let NERDTreeHighlightCursorline = 1
let NERDTreeMouseMode = 2      " Allow mouse
let NERDTreeQuitOnOpen = 1
let NERDTreeShowFiles = 1
let NERDTreeShowHidden = 1        " NERDTree show hidden by default
let NERDTreeShowHidden = 1

" Key Commands
let mapleader = "\<Space>"       " Remap Leader to Space
nnoremap <Leader>a :noh<CR>      " Kill Highlight
nnoremap <Leader>g :gqq<CR>      " Align
nnoremap <Leader>q :bd<CR>       " Close current buffer
nnoremap <Leader>w :w<CR>        " Write
nnoremap <Leader>x :x<CR>        " Write + Quit

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader><Leader> V

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR> " Use K to search for word under cursor
vnoremap <F5> :sort<CR>          " Sublime-style sort
nnoremap <C-E> :e#<CR>           " Switch between last edited buffer
nnoremap <C-h> <C-w>h            " Easier split movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-p> :CtrlP<CR>        " Dupe of existing shortcut; needed for Vim Plug perf
map <C-\> :NERDTreeToggle<CR>    " Ctrl + \ shortcut for NERDTree

" Syntax
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint', 'jshint']
let g:airline#extensions#syntastic#enabled = 0

" Git Gutter
let g:gitgutter_sign_column_always=1

" JavaScript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" Autocomplete
let g:AutoPairsFlyMode = 1

" Vim Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

" Elm-vim
let g:elm_syntastic_show_warnings = 1
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" Theme
syntax on
set background=dark
colorscheme gruvbox

" Italic Font
highlight Comment gui=italic
highlight Comment cterm=italic
highlight htmlArg gui=italic
highlight htmlArg cterm=italic
highlight Type    gui=italic
highlight Type    cterm=italic

