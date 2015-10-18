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
Plug 'junegunn/limelight.vim'

" Status
Plug 'bling/vim-airline'

" Edit
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'lokaltog/vim-easymotion'
Plug 'osyo-manga/vim-over'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle'   }
Plug 'junegunn/vim-fnr'
Plug 'junegunn/vim-peekaboo'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
if v:version >= 703
  Plug 'junegunn/vim-after-object'
endif

" Browsing
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'bogado/file-line'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'Keithbsmiley/investigate.vim'

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
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'honza/dockerfile.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'junegunn/vim-journal'

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
set completeopt=menuone,preview,longest

" Enable wild menu
set wildmode=list:longest,full
set wildmenu

" Keep cursor on same column
set nostartofline

" Enable mouse
set ttymouse=xterm2
set mouse=a

if has('patch-7.3.541')
  set formatoptions+=j
endif

if has('patch-7.4.338')
  let &showbreak = '↳ '
  set breakindent
  set breakindentopt=sbr
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

" <Leader>ge: Git edit
nnoremap <Leader>ge :Gedit<CR>

" <Leader>gb: Git blame
nnoremap <Leader>gb :Gblame<CR>

" <Leader>gb: Git diff
nnoremap <Leader>gd :Gdiff<CR>

" <Leader>gs: Git status
nnoremap <Leader>gs :Gstatus<CR>

" <Leader>gr: View git repository
nnoremap <Leader>gr :Gitv<CR>

" <Leader>gl: Git log
nnoremap <Leader>gl :Gitv!<CR>
vnoremap <Leader>gl :Gitv!<CR>

" <Leader>l: Toggle Limelight
nnoremap  <Leader>l :Limelight!!<CR>

" <Leader>r: Find n' Replace
nmap <Leader>r <Plug>(FNR%)
xmap <Leader>r <Plug>(FNR)

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

" gt: Goto line with fuzzy match
nnoremap <silent> gt :call fzf#run({
\   'source':  <sid>buffer_lines(),
\   'sink':    function('<sid>line_handler'),
\   'options': '--extended --nth=3..',
\   'down':    '60%'
\ })<CR>

" ]q: Next quickfix
nnoremap ]q :cnext<cr>zz

" [q: Next quickfix
nnoremap [q :cprev<cr>zz

" ]b: Next buffer
nnoremap ]b :bnext<cr>

" [b: Previous buffer
nnoremap [b :bprev<cr>

" <C-x><C-k>: Autocomplete from English dictionary
imap <C-x><C-k> <plug>(fzf-complete-word)

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

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf ' . keys[0]
  exec keys[1]
  normal! ^zz
endfunction

function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(
          \ getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
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

  " Initialize Airline sections
  if exists('airline')
    autocmd VimEnter * call AirlineInit()
  end
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

" lokaltog/vim-easymotion
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
hi link EasyMotionShade  Comment

" junegunn/vim-easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" gregsexton/gitv
let g:Gitv_TruncateCommitSubjects = 1

" junegunn/vim-after-object
silent! if has_key(g:plugs, 'vim-after-object')
  autocmd VimEnter * silent! call after_object#enable('=', ':', '#', ' ', '|')
endif

" mbbill/undotree
let g:undotree_WindowLayout = 2

" bling/vim-airline
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
