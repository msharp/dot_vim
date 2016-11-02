set nocompatible " be iMproved
filetype on    " required!
filetype off     " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'

" ---------------
" Vundle Bundles
" ---------------
Bundle 'scrooloose/nerdtree'
" UI Additions
Bundle 'myusuf3/numbers.vim'
Bundle 'dickeyxxx/status.vim'
" Language Additions
Bundle 'vim-ruby/vim-ruby'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'leshill/vim-json'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-markdown'
Bundle 'vim-scripts/sql.vim--Stinson'
Bundle 'oscarh/vimerl'
Bundle 'elixir-lang/vim-elixir'
Bundle 'lambdatoast/elm.vim'
" colourscheme
Bundle 'altercation/vim-colors-solarized'
" fancy status bar
Bundle 'bling/vim-airline'

filetype plugin indent on  " Automatically detect file types. (must turn on after Vundle)

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=","

" ---------------
" Color
" ---------------
set background=dark
colorscheme solarized " from plugin

" airline/powerline fonts
let g:airline_powerline_fonts = 1
set t_Co=256
set guifont=Sauce\ Code\ Powerline\ Light:h15


" hack to handle solarized in terminal, from
" http://stackoverflow.com/questions/14093554/vim-solarized-on-os-x-terminal-app-incorrect-colors
if !has('gui_running')
   " Compatibility for Terminal
   let g:solarized_termtrans=1
   " Make Solarized use 16 colors for Terminal support
   let g:solarized_termcolors=16
endif

" ---------------
" Backups
" ---------------
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" ---------------
" UI
" ---------------
set ruler  " Ruler on
set nu  " Line numbers on
set relativenumber " cursor-location-relative line numbering
set nowrap  " Line wrapping off
set laststatus=2  " Always show the statusline
set cmdheight=2

" ---------------
" Behaviors
" ---------------
syntax enable
set history=768        " Number of things to remember in history.
if $TMUX == ''         " fix for tmux yanking (http://stackoverflow.com/questions/11404800/fix-vim-tmux-yank-paste-on-unnamed-register)
  set clipboard+=unnamed " Yanks go on clipboard instead.
endif
set timeoutlen=500     " Time to wait for a command (after leader for example)
set foldlevelstart=99  " Remove folds

" ---------------
" Text Format
" ---------------
set tabstop=2
set backspace=2 " Delete everything with backspace
set shiftwidth=2  " Tabs under smart indent
set cindent
set autoindent
set smarttab
set expandtab
set backspace=2

" ---------------
" Visual
" ---------------
set showmatch  " Show matching brackets.

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" Use ; for : in normal and visual mode, fewer keystrokes
nnoremap ; :
vnoremap ; :

" toggle line numbers mode within myusuf3/numbers.vim plugin
nnoremap <F3> :NumbersToggle<CR>

" Edit vimrc with ,v
nmap <silent> <leader>v :e ~/.vimrc<CR>

" Window Movement
nmap <silent> <leader>h :wincmd h<CR>
nmap <silent> <leader>j :wincmd j<CR>
nmap <silent> <leader>k :wincmd k<CR>
nmap <silent> <leader>l :wincmd l<CR>

" Window Splitting
nmap <silent> <leader>sh :split<CR>
nmap <silent> <leader>sv :vsplit<CR>
nmap <silent> <leader>sc :close<CR>

" resizing horizontal splits (proportional resize)
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 6/5)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 4/5)<CR>
" resizing vertical splits
nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 4/5)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 6/5)<CR>
"
"
" ----------------------------------------
" Auto Commands
" ----------------------------------------

if has("autocmd")
  " No formatting on o key newlines
  autocmd BufNewFile,BufEnter * set formatoptions-=o

  " No more complaining about untitled documents
  autocmd FocusLost silent! :wa

  " When editing a file, always jump to the last cursor position.
  " This must be after the uncompress commands.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line ("'\"") <= line("$") |
        \   exe "normal! g`\"" |

  " for python, use 4-char indents
  autocmd BufEnter *.py,*.pyw set smartindent smarttab cinwords=if,while,def,class,else,elif,except,finally,for,try,do,switch sw=4

endif

" ---------------
" Vundle
" ---------------
nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bi! :BundleInstall!<CR>
nmap <Leader>bu :BundleInstall!<CR> " Because this also updates
nmap <Leader>bc :BundleClean<CR>



