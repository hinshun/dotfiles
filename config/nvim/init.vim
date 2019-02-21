" Enable modelines
set modelines=2

"===============================================================================
" Plugins
"===============================================================================

silent! if plug#begin('~/.vim/plugged')

" Colors
Plug 'hinshun/color.vim'

" Status
Plug 'vim-airline/vim-airline'

" Edit
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'lokaltog/vim-easymotion'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle'   }
Plug 'junegunn/vim-fnr'
Plug 'junegunn/vim-pseudocl'
Plug 'ConradIrwin/vim-bracketed-paste'

" Browsing
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'hinshun/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" LSP
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()
endif

"===============================================================================
" General Settings
"===============================================================================

" Set default shell
set shell=/bin/zsh

" Avoid hit-enter prompts & splash screen
set shortmess+=I

" Enable true colors
set termguicolors

" Enable unicode
set encoding=utf-8

" Init colorscheme
silent! colorscheme hinshun

" Turn on line number
set number

" Always splits to the right and below
set splitbelow
set splitright

" Turn off sound & alerts
set vb
set t_vb=

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Highlight current line cursor is on
set cursorline

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

" Case insensitive search
set ignorecase
set smartcase

" Make regex a little easier to type
set magic

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Tab settings
set tabstop=2     " width of tab
set shiftwidth=2  " shifting >>, <<, ==
set softtabstop=2 " tab key <TAB>, <BS>
set expandtab     " always use softtabstop for <TAB>

" Indent options
set smartindent
set linebreak

" Wrap lines
set wrap

" Virtual editing for cursor to be placed in virtual mode where there is no
" actual character
set virtualedit=block

" Reduce syntax searching in long column lines
set synmaxcol=1000

" Set status line to be only airline
set cmdheight=1

" Don't redraw when not needed
set lazyredraw

" Add no extra spaces when joining lines ending with punctuation
set nojoinspaces

" Align diffs and always vertical
set diffopt=filler,vertical

" Format to recognize for :grep
set grepformat=%f:%l:%c:%m,%f:%l:%m

" Insert mode completion
set completeopt=menuone,longest,noselect

" Keep cursor on same column
set nostartofline

" Prevent windows scrolling together
set nocursorbind
set noscrollbind

" Enable mouse
set mouse=a

" Enable sign columns
set signcolumn=yes

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

" <Leader>nt: Toggle file system explorer
nnoremap <Leader>nt :NERDTreeToggle<cr>

" <Leader>rg: Fast content searching
nnoremap <Leader>rg :Rg<space>

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

" <Leader>gl: Git commits on current visual selection
xmap <Leader>gl :GV!<CR>

" <Leader>r: Find n' Replace
nmap <Leader>r <Plug>(FNR%)
xmap <Leader>r <Plug>(FNR)

" <Leader>z: Toggle zoom by alternating between tabs and splits
nnoremap <silent> <leader>z :call <sid>zoom()<cr>

" <Leader>c: Close quickfix window
nnoremap <leader>c :cclose<bar>lclose<cr>

" <Leader>nl: Remove search highlighting
nnoremap <leader>nl :nohlsearch<CR>

" <Leader>od: Goto definition under cursor
nnoremap <silent> <Leader>od :call LanguageClient#textDocument_definition()<CR>

" <Leader>ot: Goto type definition under cursor
nnoremap <silent> <Leader>ot :call LanguageClient#textDocument_typeDefinition()<CR>

" <Leader>oi: Goto implementation under cursor
nnoremap <silent> <Leader>oi :call LanguageClient#textDocument_implementation()<CR>

" <Leader>oh: Show type info (and short doc) of identifier under cursor
nnoremap <silent> <Leader>oh :call LanguageClient#textDocument_hover()<CR>

" <Leader>os: List of current buffer's symbols
nnoremap <silent> <Leader>os :call LanguageClient#textDocument_documentSymbol()<CR>

" <Leader>or: List all references of identifier under cursor
nnoremap <silent> <Leader>or :call LanguageClient#textDocument_references()<CR>

" <Leader>of: Format current document
nnoremap <silent> <Leader>of :call LanguageClient#textDocument_formatting()<CR>

" <Leader>on: Rename identifier under cursor
nnoremap <silent> <Leader>on :call LanguageClient#textDocument_rename()<CR>

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

" [q: Previous quickfix
nnoremap [q :cprev<cr>zz

" ]b: Next buffer
nnoremap ]b :bnext<cr>

" [b: Previous buffer
nnoremap [b :bprev<cr>

" <C-x><C-f>: Autocomplete from paths in pwd
imap <C-x><C-f> <plug>(fzf-complete-path)

" <C-x><C-l>: Autocomplete from lines in buffers
imap <C-x><C-l> <plug>(fzf-complete-line)

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

" bling/vim-airline
let g:airline_theme='hinshun'
function! AirlineInit()
  let g:airline_section_a = airline#section#create_left(['mode'])
  let g:airline_section_b = airline#section#create_left(['filetype'])
  let g:airline_section_c = airline#section#create_left(['%f'])
  let g:airline_section_z = airline#section#create_right(['%c'])
  let g:airline_section_warning = airline#section#create_right(['whitespace'])
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

" scrooloose/nerdtree
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1

" lokaltog/vim-easymotion
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
hi link EasyMotionShade  Comment

" mbbill/undotree
let g:undotree_WindowLayout = 2

" hinshun/fzf.vim
let FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
" let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_colors =
\ { 'bg':     ['bg', 'Normal'] }
command! Plugs call fzf#run({
  \ 'source':  map(sort(keys(g:plugs)), 'g:plug_home."/".v:val'),
  \ 'options': '--delimiter / --nth -1',
  \ 'down':    '~40%',
  \ 'sink':    'Explore'})

" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1

" LanguageClient
let g:LanguageClient_completionPreferTextEdit = 1
let g:LanguageClient_rootMarkers = {
  \ 'go': ['go.mod'],
  \ 'python': ['setup.py'],
  \ 'rust': ['Cargo.toml'],
  \ 'javascript': ['project.json'],
  \ 'dockerfile': ['Dockerfile'],
  \ }
let g:LanguageClient_serverCommands = {
  \ 'go': ['bingo', '-diagnostics-style', 'none'],
  \ 'python': ['pyls'],
  \ 'rust': ['rustup', 'run', 'stable', 'rls'],
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'dockerfile': ['docker-langserver', '--stdio'],
  \ 'sh': ['bash-language-server', 'start'],
  \ 'yaml': ['yaml-language-server', '--stdio'],
  \ }
