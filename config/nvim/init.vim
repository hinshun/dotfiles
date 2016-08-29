" Turn on automatic indentation
filetype plugin indent on

" Enable syntax
syntax enable

" Enable modelines
set modelines=2

"===============================================================================
" Plugins
"===============================================================================

silent! if plug#begin('~/.vim/plugged')

" Colors
Plug 'hinshun/vim-tomorrow-theme'

" Status
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Edit
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'lokaltog/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle'   }
Plug 'junegunn/vim-fnr'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-peekaboo'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
if v:version >= 703
  Plug 'junegunn/vim-after-object'
endif
if has('nvim')
  Plug 'Shougo/deoplete.nvim'
  Plug 'zchee/deoplete-go', { 'do': 'make'}
endif

" Browsing
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }
Plug 'bogado/file-line'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" Lang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'honza/dockerfile.vim'

" Lint
Plug 'scrooloose/syntastic'

call plug#end()
endif

"===============================================================================
" General Settings
"===============================================================================

" Set default shell
set shell=/bin/zsh

" Avoid hit-enter prompts & splash screen
set shortmess+=I

" Enable 256 colors
set t_Co=256

" Always show statusline
set laststatus=2

" Enable unicode
set encoding=utf-8

" Init colorscheme
silent! colorscheme Tomorrow-Night

" Turn on line number
set number

" Always splits to the right and below
set splitbelow
set splitright

" Turn off sound & alerts
set vb
set t_vb=

" Lower the delay of escaping out of other modes
set timeoutlen=200

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Highlight current line cursor is on
set cursorline

" Set to auto read when a file is changed from the outside
set autoread

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=5

" Min width of the number column to the left
set numberwidth=1

" Fold settings
set foldmethod=indent " fold by indent level
set nofoldenable      " dont fold by default
set foldlevelstart=99 " start folding for level

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
set smarttab

" Indent options
set autoindent
set smartindent
set linebreak

" Wrap lines
set wrap

" Virtual editing for cursor to be placed in virtual mode where there is no
" actual character
set virtualedit=block

" Reduce syntax searching in long column lines
set synmaxcol=1000

" 80 chars/line
set textwidth=0
if exists('&colorcolumn')
  set colorcolumn=80
endif

" Don't redraw when not needed
set lazyredraw

" Show keystrokes in buffer
set showcmd

" Highlight unwanted characters
set list
set listchars=tab:\|\ ,

" Add no extra spaces when joining lines ending with punctuation
set nojoinspaces

" Align diffs and always vertical
set diffopt=filler,vertical

" Format to recognize for :grep
set grepformat=%f:%l:%c:%m,%f:%l:%m

" Insert mode completion
set completeopt=menuone,longest,noselect

" Enable wild menu
set wildmode=list:longest,full
set wildmenu

" Keep cursor on same column
set nostartofline

" Enable numerical addition/subtraction for hexadecimals
set nrformats=hex

" Enable mouse
set mouse=a

" Temporary files
set backupdir=/tmp/vim//,.
set directory=/tmp/vim//,.
if v:version >= 703
  set undodir=/tmp/vim//,.
endif

if has('patch-7.3.541')
  set formatoptions+=j
endif

if has('patch-7.4.338')
  let &showbreak = '↳ '
  set breakindent
  set breakindentopt=sbr
endif

if !has('nvim')
  " Use blowfish2 encryption for buffers written to file
  set cryptmethod=blowfish2
endif

"===============================================================================
" Leader Key Mappings
"===============================================================================

" Map leader to space
let mapleader = " "
let g:mapleader = " "
let maplocalleader = " "
let g:maplocalleader = " "

" <Leader><Leader>: Open files
nnoremap <silent> <Leader><Leader> :Files<CR>

" <Leader><Leader>: Open buffers
nnoremap <silent> <Leader><Enter> :Buffers<CR>

" <Leader>pi: Installs Plugins
nnoremap <Leader>pi :PlugInstall<cr>

" <Leader>ps: Displays the status of Plugins
nnoremap <leader>ps :PlugStatus<cr>

" <Leader>nt: Toggle file system explorer
nnoremap <Leader>nt :NERDTreeToggle<cr>

" <Leader>ag: Fast content searching
nnoremap <Leader>ag :Ag<space>

" <Leader>ge: Git edit
nnoremap <Leader>ge :Gedit<CR>

" <Leader>gb: Git blame
nnoremap <Leader>gb :Gblame<CR>

" <Leader>gb: Git diff
nnoremap <Leader>gd :Gdiff<CR>

" <Leader>gs: Git status
nnoremap <Leader>gs :GFiles?<CR>

" <Leader>gr: Git commits
nnoremap <Leader>gc :Commits<CR>

" <Leader>gl: Git commits on current file
nnoremap <Leader>gl :BCommits<CR>

" <Leader>r: Find n' Replace
nmap <Leader>r <Plug>(FNR%)
xmap <Leader>r <Plug>(FNR)

" <Leader>z: Toggle zoom by alternating between tabs and splits
nnoremap <silent> <leader>z :call <sid>zoom()<cr>

" <Leader>c: Close quickfix window
nnoremap <leader>c :cclose<bar>lclose<cr>

" <Leader>or: Run go file
au FileType go nmap <leader>or <Plug>(go-run)

" <Leader>ob: Build go file
au FileType go nmap <leader>ob <Plug>(go-build)

" <Leader>ot: Test go file
au FileType go nmap <leader>ot <Plug>(go-test)

" <Leader>od: Jump to go definition
au FileType go nmap <Leader>od <Plug>(go-def)

" <Leader>oc: Jump to go doc
au FileType go nmap <Leader>oc <Plug>(go-doc-vertical)

" <Leader>os: List go interfaces that struct implements
au FileType go nmap <Leader>os <Plug>(go-implements)

" <Leader>oi: Show go signature and type
au FileType go nmap <Leader>oi <Plug>(go-info)

" <Leader>oe: Refactor go name
au FileType go nmap <Leader>oe <Plug>(go-rename)

"===============================================================================
" Non-leader Key Mappings
"===============================================================================

" U: Undo tree
nnoremap U :UndotreeToggle<CR>

" Movement in INSERT mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k

" Moving lines
nnoremap <silent> <C-k> :move-2<cr>
nnoremap <silent> <C-j> :move+<cr>
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv

" ]q: Next quickfix
nnoremap ]q :cnext<cr>zz

" [q: Next quickfix
nnoremap [q :cprev<cr>zz

" ]b: Next buffer
nnoremap ]b :bnext<cr>

" [b: Previous buffer
nnoremap [b :bprev<cr>

" <C-x><C-f>: Autocomplete from paths in pwd
imap <C-x><C-f> <plug>(fzf-complete-path)

" <C-x><C-j>: Autocomplete from files in pwd
imap <C-x><C-j> <plug>(fzf-complete-file-ag)

" <C-x><C-l>: Autocomplete from lines in buffers
imap <C-x><C-l> <plug>(fzf-complete-line)

" <C-x><C-l>: Autocomplete from visible tmux
inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')

"===============================================================================
" Functions
"===============================================================================

function! s:zoom()
  if winnr('$') > 1
    tab split
  elseif len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
                  \ 'index(v:val, '.bufnr('').') >= 0')) > 1
    tabclose
  endif
endfunction

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
  autocmd BufReadPost * if &ft != 'gitcommit'
        \ && line("'\"") > 0 && line("'\"") <= line("$")
        \ | exe "normal g`\"" | endif

  " Automatically open quickfix window after grepping
  autocmd QuickFixCmdPost *grep* cwindow

  " Close vim if the only window open is NERDTree
  autocmd BufEnter * if (winnr("$") == 1
        \ && exists("b:NERDTreeType") && b:NERDTreeType == "primary")
        \ | q | endif
augroup END

"===============================================================================
" Plugin Settings
"===============================================================================

" scrooloose/nerdtree
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']

" scrooloose/syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_html_tidy_quiet_messages = { "level" : "warnings" }
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" lokaltog/vim-easymotion
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
hi link EasyMotionShade  Comment

" junegunn/vim-easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" junegunn/vim-after-object
silent! if has_key(g:plugs, 'vim-after-object')
  autocmd VimEnter * silent! call after_object#enable('=', ':', '#', ' ', '|')
endif

" mbbill/undotree
let g:undotree_WindowLayout = 2

" fatih/vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" hinshun/fzf.vim
" let $FZF_DEFAULT_COMMAND = 'ag -l --ignore goartifacts -g ""'
let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': 'enew' }
command! Plugs call fzf#run({
  \ 'source':  map(sort(keys(g:plugs)), 'g:plug_home."/".v:val'),
  \ 'options': '--delimiter / --nth -1',
  \ 'down':    '~40%',
  \ 'sink':    'Explore'})

" bling/vim-airline
let g:airline_powerline_fonts = 1
function! AirlineInit()
  let g:airline_section_a = airline#section#create_left(['mode'])
  let g:airline_section_b = airline#section#create_left(['filetype'])
  let g:airline_section_c = airline#section#create_left(['%f'])
  let g:airline_section_x = airline#section#create_right(['hunks'])
  let g:airline_section_y = airline#section#create_right(['branch'])
  let g:airline_section_z = airline#section#create_right(['%c'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

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

if has('nvim')
  " Shougo/deoplete.nvim
  let g:deoplete#enable_at_startup = 1
endif
