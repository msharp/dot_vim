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

" Navigation
Bundle 'FuzzyFinder'
Bundle 'ZoomWin'
" UI Additions
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'dickeyxxx/status.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'myusuf3/numbers.vim'
" Commands
Bundle 'tpope/vim-fugitive'
" Automatic Helpers
" Bundle 'Valloric/YouCompleteMe'
Bundle 'IndexedSearch'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
" Bundle 'ervandew/supertab'
" Language Additions
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'itspriddle/vim-jquery'
Bundle 'tpope/vim-rails'
Bundle 'mutewinter/taskpaper.vim'
Bundle 'leshill/vim-json'
Bundle 'mutewinter/nginx.vim'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-markdown'
Bundle 'vim-scripts/sql.vim--Stinson'
Bundle 'oscarh/vimerl'
Bundle 'elixir-lang/vim-elixir'
Bundle 'Keithbsmiley/rspec.vim'
Bundle 'lambdatoast/elm.vim'
" Libraries
Bundle 'L9'
Bundle 'tpope/vim-repeat'
" Shell in a buffer
Bundle 'pthrasher/conqueterm-vim'
" colourscheme
Bundle 'altercation/vim-colors-solarized'
" fancy status bar
Bundle 'bling/vim-airline'

filetype plugin indent on  " Automatically detect file types. (must turn on after Vundle)

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=","

" ----------------------------------------
" Platform Specific Configuration
" ----------------------------------------

if has('win32') || has('win64')
  " Windows
  source $VIMRUNTIME/mswin.vim
  set guifont=Consolas:h10:cANSI
  set guioptions-=T " Toolbar
  set guioptions-=m " Menubar

  " Set height and width on Windows
  set lines=60
  set columns=120

  " Windows has a nasty habit of launching gVim in the wrong working directory
  cd ~
elseif has('gui_macvim')
  " MacVim
  " set guifont=Menlo\ Regular:h12

  set encoding=utf-8 " Necessary to show Unicode glyphs
  set nocompatible   " Disable vi-compatibility
  set laststatus=2   " Always show the statusline
  " let g:Powerline_symbols = 'unicode'
  " set guifont=Menlo\ Regular\ For\ Powerline:h15

  " from : https://coderwall.com/p/yiot4q
  let g:Powerline_symbols = 'fancy'
  set guifont=Inconsolata\ for\ Powerline:h15
  set t_Co=256
  set fillchars+=stl:\ ,stlnc:\
  set term=xterm-256color
  set termencoding=utf-8

  " Hide Toolbar in MacVim
  if has("gui_running")
    set guioptions=egmrt
  endif
endif

" ----------------------------------------
" Regular Vim Configuartion (No Plugins Needed)
" ----------------------------------------

" ---------------
" Color
" ---------------
set background=dark
colorscheme solarized " from plugin
" colorscheme slate " built-in

" airline/powerline fonts
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" hack to handle solarized in terminal, from
" http://stackoverflow.com/questions/14093554/vim-solarized-on-os-x-terminal-app-incorrect-colors
if !has('gui_running')
   " Compatibility for Terminal
   let g:solarized_termtrans=1
   " Make Solarized use 16 colors for Terminal support
   let g:solarized_termcolors=16
endif

" Conditionally Set colorscheme
"if has('unix') && !has('gui_macvim')
"  if $TERM == 'xterm-256color'
"    " Neato, 256 color terminal. We can use ir_black_mod
"    colorscheme ir_black_mod
"  else
"    " We can't use ir_black_mod :(
"    let g:CSApprox_verbose_level=0
"    colorscheme slate
"  endif
"else
  " We're good if not on unix or in MacVim
"  colorscheme ir_black_mod
"endif

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
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
if $TMUX == ''         " fix for tmux yanking (http://stackoverflow.com/questions/11404800/fix-vim-tmux-yank-paste-on-unnamed-register)
  set clipboard+=unnamed " Yanks go on clipboard instead.
endif
set autowrite          " Writes on make/shell commands
set timeoutlen=350     " Time to wait for a command (after leader for example)
set foldlevelstart=99  " Remove folds
set formatoptions=crql

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
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase " Non-case sensitive search
set incsearch
set hlsearch

" ---------------
" Visual
" ---------------
set showmatch  " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" ---------------
" Mouse
" ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

" Better complete options to speed it up
set complete=.,w,b,u,U

" ----------------------------------------
" Bindings
" ----------------------------------------
" Fixes common typos
command W w
command Q q
map <F1> <Esc>
imap <F1> <Esc>

" Removes doc lookup binding because it's easy to fat finger
nmap K k
vmap K k

" Make line completion easier
imap <C-l> <C-x><C-l>

" Scrolling (Less RSI)
if has('mac') || has('macunix') || has('gui_macvim')
  nmap <D-j> <C-f>
  nmap <D-k> <C-b>
else
  nmap <M-j> <C-f>
  nmap <M-k> <C-b>
endif

" Don't enter 'Ex' mode
nnoremap Q <nop>

" Use ; for : in normal and visual mode, fewer keystrokes
nnoremap ; :
vnoremap ; :
" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" toggle line numbers mode within myusuf3/numbers.vim plugin
nnoremap <F3> :NumbersToggle<CR>

" ---------------
" Leader Commands

" resizing horizontal splits (proportional resize)
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 6/5)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 4/5)<CR>
" resizing vertical splits
nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 4/5)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 6/5)<CR>

" ---------------

" Toggle spelling mode with ,s
nmap <silent> <leader>s :set spell!<CR>
" Edit vimrc with ,v
nmap <silent> <leader>v :e ~/.vim/vimrc<CR>

" open a zsh shell in h-split
nmap <silent> <leader>zsh :ConqueTermSplit zsh<CR>
" open an irb console in v-split
nmap <silent> <leader>irb :ConqueTermVSplit irb<CR>
" open a python console in v-split
nmap <silent> <leader>python :ConqueTermVSplit python<CR>

" set syntax mode
nmap <silent> <leader>sql :set syntax=sql<CR>

" start substitute command with the regex search
nmap <silent> <leader>r :%s///g<Left><Left><Left>

" Window Movement
nmap <silent> <leader>h :wincmd h<CR>
nmap <silent> <leader>j :wincmd j<CR>
nmap <silent> <leader>k :wincmd k<CR>
nmap <silent> <leader>l :wincmd l<CR>
" Previous Window
nmap <silent> <leader>wp :wincmd p<CR>
" Equal Size Windows
nmap <silent> <leader>w= :wincmd =<CR>

" Window Splitting
nmap <silent> <leader>sh :split<CR>
nmap <silent> <leader>sv :vsplit<CR>
nmap <silent> <leader>sc :close<CR>

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

  "" for python, use 4-char indents
  autocmd BufEnter *.py,*.pyw set smartindent smarttab cinwords=if,while,def,class,else,elif,except,finally,for,try,do,switch sw=4

endif
" ----------------------------------------
" Plugin Configuration
" ----------------------------------------

" ---------------
" SuperTab
" ---------------
" Set these up for cross-buffer completion (something Neocachecompl has a hard
" time with)
let g:SuperTabDefaultCompletionType="<c-x><c-n>"
let g:SuperTabContextDefaultCompletionType="<c-x><c-n>"

" ---------------
" Neocachecompl
" ---------------
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_auto_select=1 "Select the first entry automatically
let g:neocomplcache_enable_cursor_hold_i=1
let g:neocomplcache_cursor_hold_i_time=300
let g:neocomplcache_auto_completion_start_length=1

" Tab / Shift-Tab to cycle completions
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Ctrl-K to complete and advance snippet
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)


" ---------------
" Syntastic
" ---------------
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" Platform-specific config files
if has('win32') || has('win64')
  let g:syntastic_jsl_conf=$HOME.'/.vim/config/windows/syntastic/jsl.conf'
  let g:syntastic_disabled_filetypes=['sh'] " Disable .sh on Windows
endif

" ---------------
" FuzzyFinder
" ---------------
let g:fuf_modesDisable=['mrucmd'] " Enables FufMruFile
if has('mac') || has('macunix') || has('gui_macvim')
  nnoremap <silent><D-y> :FufMruFile<CR>
  nnoremap <silent><D-u> :FufFileWithCurrentBufferDir<CR>
else
  nnoremap <silent><M-y> :FufMruFile<CR>
  nnoremap <silent><M-u> :FufFileWithCurrentBufferDir<CR>
end
nnoremap <leader>fu :FufFileWithCurrentBufferDir<CR>
nnoremap <leader>ff :FufFile<CR>
nnoremap <leader>fy :FufMruFile<CR>
nnoremap <leader>fb :FufBuffer<CR>

" ---------------
" NERDTree
" ---------------
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2 " Change the NERDTree directory to the root node
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ---------------
" Indent Guides
" ---------------
let g:indent_guides_auto_colors=1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_color_change_percent=5

if has('unix') && !has('gui_macvim')
  if $TERM == 'xterm-256color'
    " Make the guides smaller since they will be crazy visible in 256color mode
    let g:indent_guides_guide_size=1
  else
    " Turn off the guides when 256color mode isn't available
    let g:indent_guides_enable_on_vim_startup=0
  endif
endif

" ---------------
" Session
" ---------------
let g:session_autosave=0
let g:session_autoload=0
nnoremap <leader>os :OpenSession<CR>

" ---------------
" status.vim
" ---------------
let g:statusline_fugitive=1
let g:statusline_fullpath=0
" Everything must be after Right Separator for BufStat
let g:statusline_order=[
      \ 'Filename',
      \ 'Encoding',
      \ 'Help',
      \ 'Filetype',
      \ 'Modified',
      \ 'Fugitive',
      \ 'RVM',
      \ 'TabWarning',
      \ 'Syntastic',
      \ 'Paste',
      \ 'ReadOnly',
      \ 'RightSeperator',
      \ 'CurrentHighlight',
      \ 'CursorColumn',
      \ 'LineAndTotal',
      \ 'FilePercent']

" ---------------
" Tabular
" ---------------
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
nmap <Leader>t, :Tabularize /,\zs<CR>
vmap <Leader>t, :Tabularize /,\zs<CR>
nmap <Leader>t> :Tabularize /=>\zs<CR>
vmap <Leader>t> :Tabularize /=>\zs<CR>

" ---------------
" Fugitive
" ---------------
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gp :Git push<CR>
 " Mnemonic, gu = Git Update
nmap <Leader>gu :Git pull<CR>
nmap <Leader>gd :Gdiff<CR>
" Exit a diff by closing the diff window
nmap <Leader>gD :wincmd h<CR>:q<CR>

" ---------------
" Zoomwin
" ---------------
" Zoom Window to Full Size
nmap <silent> <leader>wo :ZoomWin<CR>

" ---------------
" Vundle
" ---------------
nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bi! :BundleInstall!<CR>
nmap <Leader>bu :BundleInstall!<CR> " Because this also updates
nmap <Leader>bc :BundleClean<CR>

" ----------------------------------------
" Functions
" ----------------------------------------

" ---------------
" Fix Trailing White Space
" ---------------
map <leader>ws :%s/\s\+$//e<CR>
command! FixTrailingWhiteSpace :%s/\s\+$//e

" ---------------
" Quick spelling fix (first item in z= list)
" ---------------
function! QuickSpellingFix()
  if &spell
    normal 1z=
  else
    " Enable spelling mode and do the correction
    set spell
    normal 1z=
    set nospell
  endif
endfunction

command! QuickSpellingFix call QuickSpellingFix()
nmap <silent> <leader>z :QuickSpellingFix<CR>set nocompatible " be iMproved

" ---------------
"  extra config to avoid annoyances
"  when working with ionic/angular
"  source code
" ---------------

"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
let g:syntastic_auto_loc_list=1
"don't care about warnings
let g:syntastic_quiet_messages = {'level': 'warnings'}

"allow for ionic html attributes
let g:syntastic_html_tidy_blocklevel_tags = [
  \'ion-checkbox',
  \'ion-content',
  \'ion-delete-button',
  \'ion-footer-bar',
  \'ion-header-bar',
  \'ion-infinite-scroll',
  \'ion-item',
  \'ion-list',
  \'ion-modal-view',
  \'ion-nav-back-button',
  \'ion-nav-bar',
  \'ion-nav-buttons',
  \'ion-nav-view',
  \'ion-option-button',
  \'ion-pane',
  \'ion-popover-view',
  \'ion-radio',
  \'ion-refresher',
  \'ion-reorder-button',
  \'ion-scroll',
  \'ion-side-menu',
  \'ion-side-menus',
  \'ion-side-menu-content',
  \'ion-slide',
  \'ion-slide-box',
  \'ion-tab',
  \'ion-tabs',
  \'ion-toggle',
  \'ion-view',
  \]
