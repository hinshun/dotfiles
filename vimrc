" Turn on automatic indentation
filetype plugin indent on

" Enable syntax
syntax enable

"===============================================================================
" Plugins
"===============================================================================

silent! if plug#begin('~/.vim/plugged')

" Colors
Plug 'hinshun/vim-tomorrow-theme'

" Status
Plug 'bling/vim-airline'

" Edit
Plug 'tpope/vim-repeat'                       " . repeat command for plugins
Plug 'tpope/vim-surround'                     " surround modifier for parentheses, brackets, etc
Plug 'tpope/vim-endwise'                      " end certain structures automatically depending on language
Plug 'tpope/vim-commentary'                   " commenting
Plug 'lokaltog/vim-easymotion'                " better motion
Plug 'osyo-manga/vim-over'                    " preview regex
Plug 'junegunn/vim-easy-align'                " better alignment
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' } " undo tree

" Browsing
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'bogado/file-line'

" Git
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'airblade/vim-gitgutter'

" Lang
Plug 'scrooloose/syntastic'
if v:version >= 703
  Plug 'vim-ruby/vim-ruby'
endif
Plug 'tpope/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'honza/dockerfile.vim'

call plug#end()
endif

"===============================================================================
" General Settings
"===============================================================================

" Set default shell
set shell=/bin/zsh

" Disable splash screen
set shortmess+=I

" Enable 256 colors
set t_Co=256

" Always show statusline
set laststatus=2

" Enable unicode
set encoding=utf-8

" Initialize colorscheme if loaded
silent! colorscheme Tomorrow-Night

" Turn on line number
set number

" Always splits to the right and below
set splitbelow
set splitright

" Turn off sound
set vb
set t_vb=

" Lower the delay of escaping out of other modes
set timeout timeoutlen=200 ttimeoutlen=1

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Highlight current line cursor is on
set cursorline

" Set to auto read when a file is changed from the outside
set autoread

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" Min width of the number column to the left
set numberwidth=1

" Open all folds initially
set foldmethod=indent " fold by indent level
set nofoldenable      " dont fold by default

" Set level of folding
set foldlevel=1 " start folding for level

" Allow changing buffer without saving it first
set hidden

" Set backspace config
set backspace=eol,start,indent

" Case insensitive search
set ignorecase
set smartcase

" Incremental search
set incsearch

" Highlight search
set hlsearch

" Make regex a little easier to type
set magic

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Tab settings
set tabstop=2     " width of tab
set shiftwidth=2  " shifting >>, <<, ==
set softtabstop=2 " tab key <TAB>, <BS>
set expandtab     " always use softtabstop for <TAB>
set smartindent

" Text display settings
set autoindent
set linebreak
" set textwidth=80

" Wild menu settings
set wildmode=list:longest,full
set wildmenu                "turn on wild menu
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app

"===============================================================================
" Leader Key Mappings
"===============================================================================

" Map leader to space
let mapleader = " "
let g:mapleader = " "
let maplocalleader = " "
let g:maplocalleader = " "

" <Leader><Leader>: Open files
nnoremap <Leader><Leader> :FZF -m<CR>

" <Leader>y: Copy to system clipboard
xnoremap <Leader>y "*y

" <Leader>/: Clear highlighted searches
nnoremap <Leader>/ :nohlsearch<cr>

" <Leader>pi: Installs Plugins
nnoremap <Leader>pi :PlugInstall<cr>

" <Leader>ps: Displays the status of Plugins
nnoremap <leader>ps :PlugStatus<cr>

" <Leader>nt: Toggle file system explorer
nnoremap <Leader>nt :NERDTreeToggle<cr>

" <Leader>ag: Fast content searching
nnoremap <Leader>ag :Ag<space>

" <Leader>ut: Undo Tree
nnoremap <Leader>ut :GundoToggle<CR>

" <Leader>gb: Git blame
nnoremap <Leader>gb :Gblame<CR>

" <Leader>gb: Git diff
nnoremap <Leader>gd :Gdiff<CR>

"===============================================================================
" Non-leader Key Mappings
"===============================================================================

" <C-c>: <ESC>
inoremap <C-c> <esc>

" Jump through Quickfix results
nmap <silent> ]q :cnext<CR>
nmap <silent> [q :cprev<CR>

"===============================================================================
" Functions
"===============================================================================

"===============================================================================
" Autocommands
"===============================================================================

augroup auglobal
  " File types
  au BufNewFile,BufRead Dockerfile*         set filetype=dockerfile

  " http://vim.wikia.com/wiki/Highlight_unwanted_spaces
  au BufNewFile,BufRead,InsertLeave * silent! match ExtraWhitespace /\s\+$/
  au InsertEnter * silent! match ExtraWhitespace /\s\+\%#\@<!$/

  " Wrap lines in QuickFix buffer so that characters will not get lost
  autocmd bufenter * if &buftype == 'quickfix' | setlocal wrap | endif
  autocmd BufWinEnter * if &buftype == 'quickfix' | setlocal wrap | endif

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost * if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

  " Automatically open quickfix window after grepping
  autocmd QuickFixCmdPost *grep* cwindow

  " Close vim if the only window open is NERDTree
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

  " Initialize Airline sections
  if exists('airline')
    autocmd VimEnter * call AirlineInit()
  end
augroup END

"===============================================================================
" Plugin Settings
"===============================================================================

" NERDTree
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']

" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_html_tidy_quiet_messages = { "level" : "warnings" }

" EasyMotion
map <Leader> <Plug>(easymotion-prefix)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
hi link EasyMotionShade  Comment

" EasyAlign
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

function! AirlineInit()
  let g:airline_section_b = airline#section#create_left(['%t'])
  let g:airline_section_c = airline#section#create([''])
  let g:airline_section_x = airline#section#create_right([''])
  let g:airline_section_y = airline#section#create_right(['%c'])
  let g:airline_section_z = airline#section#create_right(['branch'])
endfunction

let g:airline_theme_patch_func = 'AirLineTheme'
function! AirLineTheme(palette)
  if g:airline_theme == 'Tomorrow-Night'

    let green = ['', '', 255, 64, '']
    let magenta = ['', '', 255, 125, '']
    let orange = ['', '', 255, 166, '']

    let modes = {
      \ 'insert': green,
      \ 'replace': magenta,
      \ 'visual': orange
      \ }

    for key in keys(modes)
      let a:palette[key].airline_a = modes[key]
      let a:palette[key].airline_z = modes[key]
    endfor
  endif
endfunction

let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V-L',
  \ '' : 'V-B',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }

