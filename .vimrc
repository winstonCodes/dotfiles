set incsearch 
set ignorecase
set smartcase
set cindent 
set number
" set relativenumber
set wildmenu
set autoread
set linebreak
set scrolloff=1
set cursorline
set visualbell
set title
set background=dark
" set termguicolors
set path+=**
set splitright
set splitbelow
" set term=xterm
set thesaurus+=/home/winston/.vim/words.txt
set mouse=a
set hidden
set nojoinspaces

let g:netrw_browsex_viewer = "qutebrowser"

set nocompatible
filetype plugin on
syntax on

nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = "\\"

cab numb set number! relativenumber!
cab noh :nohlsearch

nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>l :nohlsearch<CR><C-L>

nnoremap <leader>F :FZF<CR>!node<SPACE>
nnoremap <leader>f :Np<CR>

nnoremap <leader>w :up<CR>
nnoremap <leader>wa :wa<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader>k :bn<CR>
nnoremap <leader>j :bp<CR>
nnoremap <M-k> :bn<CR>
nnoremap <M-j> :bp<CR>

nnoremap <leader>x :bd!<CR>
nnoremap <leader>b :Buffers<CR>

nnoremap <leader>s :set spell!<CR>

nnoremap <leader>t :terminal<CR>

nnoremap <leader>r :registers<CR>

nnoremap <leader>R :REPLToggle<cr>

nnoremap <leader>, <C-w>w

"nnoremap <leader><leader> "+

nnoremap <leader>B :buffers<CR>:buffer<Space>

nnoremap <leader>y "+yy
nnoremap <leader>' "+

nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>

nnoremap <leader>e :e<Space>

nnoremap <leader>o <C-^>

nnoremap <leader>n :new<CR>

nnoremap <leader>ct :TagbarToggle<CR> 

nnoremap <leader>ce :CocEnable<CR> 
nnoremap <leader>cd :CocDisable<CR> 

nnoremap <leader>* :bufdo bd<CR>

nnoremap <leader>p :Prettier<CR>

nnoremap <leader>dt :diffthis<CR>
nnoremap <leader>do :diffoff<CR>

" nnoremap <leader>- :res -5<CR>
" nnoremap <leader>= :res +5<CR>
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

nnoremap , @
nnoremap ,, @@

nnoremap @ ,

nnoremap Y y$

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" nnoremap <C-j> <C-w>j

inoremap jk <esc>

inoremap jj <C-o>

inoremap <S-Enter> <C-o>O

tnoremap <Esc> <c-\><c-n>

nmap s <Plug>(easymotion-prefix)
nmap s; <Plug>(easymotion-repeat)

au BufNewFile,BufRead *.rb
      \ imap do<CR> do<CR>end<S-Enter>


au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css,*.json,*.txt,*.wiki,*.scss
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set smarttab

au BufNewFile,BufRead *.wiki
    \ set spell

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'
    Plug 'mattn/emmet-vim'
    "Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'prettier/vim-prettier', {
          \ 'do': 'yarn install',
          \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html', 'eruby', 'ruby'] }
    Plug 'machakann/vim-sandwich'
    Plug 'vim-syntastic/syntastic'
    Plug 'craigemery/vim-autotag'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'urbainvaes/vim-tmux-pilot'
    Plug 'psliwka/vim-smoothie'
    "Plug 'xolox/vim-colorscheme-switcher'
    "Plug 'xolox/vim-misc'
    Plug 'ap/vim-css-color'
    Plug 'mileszs/ack.vim'
    Plug 'vimwiki/vimwiki'
    Plug 'majutsushi/tagbar'
    Plug 'mcchrish/nnn.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-rails'
    Plug 'inside/vim-search-pulse'
    Plug 'sillybun/vim-repl'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'ap/vim-buftabline'
    Plug 'easymotion/vim-easymotion'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'itchyny/calendar.vim'
    Plug 'davidhalter/jedi-vim'
    " -----Color Schemes-----
    "Plug 'arzg/vim-colors-xcode'
    " Plug 'hardselius/warlock'
    " Plug 'jacoborus/tender.vim'
    " Plug 'haishanh/night-owl.vim'
    " Plug 'Rigellute/shades-of-purple.vim'
    " Plug 'liuchengxu/space-vim-dark'
    " Plug 'marcopaganini/termschool-vim-theme'
    " Plug 'AlessandroYorba/Sierra'
    " Plug 'junegunn/seoul256.vim'
    "Plug 'whatyouhide/vim-gotham'
    " Plug 'zacanger/angr.vim'
    "Plug 'danilo-augusto/vim-afterglow'
    " Plug 'mhartington/oceanic-next'
    " Plug 'mhinz/vim-janah'
    " Plug 'morhetz/gruvbox'
    " Plug 'arcticicestudio/nord-vim'
    " Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-python', 
  \ 'coc-css', 
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages 
set cmdheight=1 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-c> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <c-s> :call <SID>show_documentation()<CR>

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

" Enable Emmet just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css,eruby,scss EmmetInstall
let g:user_emmet_leader_key = '<Tab>'

let g:nnn#set_default_mappings = 0
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

let g:sendtorepl_invoke_key = "<leader>W"

let g:indent_guides_enable_on_vim_startup = 1
" hi IndentGuidesOdd  ctermbg=darkgrey
" hi IndentGuidesEven ctermbg=black
" hi IndentGuidesOdd  ctermbg=green
" hi IndentGuidesEven ctermbg=cyan
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=black

let g:buftabline_indicators = 1
let g:buftabline_separators = 1
