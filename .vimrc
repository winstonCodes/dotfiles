set incsearch 
set ignorecase
set smartcase
set cindent 
set number
set relativenumber
set wildmenu
set autoread
set linebreak
set scrolloff=1
set cursorline
set visualbell
set title
set background=dark
set termguicolors
set path+=**
set splitright
set splitbelow
" set term=xterm

set nocompatible
filetype plugin on
syntax on


cab numb set number! relativenumber!
cab noh :nohlsearch

nnoremap <leader>ev :vsplit ~/.vimrc<cr><C-w>r
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>l :nohlsearch<CR><C-L>

nnoremap <leader>g :Goyo<CR>
nnoremap <leader>gg :Limelight!!<CR>

nnoremap <leader>f :FZF<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>x :bd!<CR>

nnoremap <leader>s :set spell!<CR>

nnoremap <leader>t :terminal<CR>

nnoremap <leader>r :registers<CR>

nnoremap <leader>, <C-w>w

nnoremap <leader><leader> "+

nnoremap <leader>b :buffers<CR>:buffer<Space>

"nnoremap , <C-w>w

"nnoremap <Space> @@
nnoremap <Space> @

nnoremap D dd

nnoremap j gj
nnoremap k gk

nnoremap <C-j> i<CR><ESC>

inoremap jk <esc>

tnoremap <Esc> <c-\><c-n>

map <C-n> :NERDTreeToggle<CR>

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css,*.json,*.txt
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set smarttab

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'
    Plug 'mattn/emmet-vim'
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'prettier/vim-prettier', {
          \ 'do': 'yarn install',
          \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
    Plug 'machakann/vim-sandwich'
    Plug 'vim-syntastic/syntastic'
    Plug 'craigemery/vim-autotag'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'urbainvaes/vim-tmux-pilot'
    Plug 'psliwka/vim-smoothie'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'xolox/vim-colorscheme-switcher'
    Plug 'xolox/vim-misc'
    Plug 'ap/vim-css-color'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'mileszs/ack.vim'
    Plug 'tpope/vim-unimpaired'
    Plug 'vimwiki/vimwiki'
    " -----Color Schemes-----
    Plug 'arzg/vim-colors-xcode'
    " Plug 'hardselius/warlock'
    " Plug 'jacoborus/tender.vim'
    " Plug 'haishanh/night-owl.vim'
    " Plug 'Rigellute/shades-of-purple.vim'
    " Plug 'liuchengxu/space-vim-dark'
    " Plug 'marcopaganini/termschool-vim-theme'
    " Plug 'AlessandroYorba/Sierra'
    " Plug 'junegunn/seoul256.vim'
    Plug 'whatyouhide/vim-gotham'
    " Plug 'zacanger/angr.vim'
    Plug 'danilo-augusto/vim-afterglow'
    " Plug 'mhartington/oceanic-next'
    " Plug 'mhinz/vim-janah'
    Plug 'morhetz/gruvbox'
    " Plug 'arcticicestudio/nord-vim'
    " Plug 'dracula/vim', { 'as': 'dracula' }


call plug#end()

let g:user_emmet_leader_key='\'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

 
let NERDTreeShowHidden=1

let g:goyo_linenr = 1
 
let g:gruvbox_contrast_dark = 'hard'
let g:sierra_Twilight = 1
" autocmd Colorscheme janah highlight Normal ctermbg=235
let g:seoul256_background = 234
let g:space_vim_dark_background = 234

color gotham256

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-python', 
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages 
set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-c> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <c-k> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Goyo config
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

let g:colorscheme_switcher_exclude_builtins = 1
let g:colorscheme_switcher_exclude = ['OceanicNextLight', 'seoul256-light', 'gotham', 'space-vim-dark', 'xcodelight', 'gruvbox']


" Prettier Config
" disable semi-colons
let g:prettier#config#semi = 'false'
" single quotes over double
let g:prettier#config#single_quote = 'true'
" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'

"python.jediEnabled": false
