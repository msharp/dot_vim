call plug#begin('~/.vim/plugged')
" ---------------
" plugins
" ---------------
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
" UI Additions
Plug 'myusuf3/numbers.vim'
" Language Additions
Plug 'elixir-lang/vim-elixir'
" searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" colourscheme
Plug 'altercation/vim-colors-solarized'
" fancy status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" remove bad whitespace
Plug 'bitc/vim-bad-whitespace'
" linter
Plug 'w0rp/ale'

" Initialize plugin system
call plug#end()

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=","

" theme from airline-themes
let g:airline_theme='atomic'
let g:airline_powerline_fonts=1

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

" toggle indentation when pasting text
set pastetoggle=<F2>

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

" Split resizing?
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 5/4)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 4/5)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 4/5)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 5/4)<CR>

" --------------
"  fzf
" --------------
nmap <Leader>f :FZF<CR>

" --------------
"  vim-plug
" --------------
nmap <Leader>pi :PlugInstall<CR>
nmap <Leader>pu :PlugUpdate<CR>


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

" ruby path if you are using rbenv
" (https://stackoverflow.com/questions/3848137/do-ruby-plugins-make-starting-vim-very-slow/12141652#12141652)
" let g:ruby_path = system('echo $HOME/.rbenv/shims')
set re=1
