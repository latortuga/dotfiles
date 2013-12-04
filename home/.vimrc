" Use vim defaults, better than vi.
set nocompatible

filetype off " required per vundle docs

set rtp+=~/.vim/bundle/powerline/bindings/vim

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let vundle manage vundle, required from vundle docs
Bundle 'gmarik/vundle'

" Ack, super fast code search
Bundle 'mileszs/ack.vim'
" File browser so easy!
Bundle 'kien/ctrlp.vim'
" Easily match structures for many languages
Bundle 'tmhedberg/matchit'

" Ruby refactoring commands
Bundle 'ecomba/vim-ruby-refactoring'

" MiniTest assertion coloring
Bundle 'sunaku/vim-ruby-minitest'

" NERDTree Filebrowser
Bundle 'scrooloose/nerdtree'

" Manage sessions by name
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'


" === Tim Pope is the man
" Rails for the win
Bundle 'tpope/vim-rails'
" Git integration
Bundle 'tpope/vim-fugitive'
" Auto-add end structures in ruby, C++, VB, lua, more
Bundle 'tpope/vim-endwise'
" Easily change things surrounding, e.g. ", ', (), [], (), etc
Bundle 'tpope/vim-surround'
" Repeat custom actions (e.g. things added by surround.vim)
Bundle 'tpope/vim-repeat'
Bundle 'stefanoverna/vim-i18n'

" Fun extra stuff
"
" Super fast auto-complete plugin
Bundle 'Valloric/YouCompleteMe'
" Statusline of sexyness
Bundle 'Lokaltog/vim-powerline'
" Coffeescript highlighting, kill me
Bundle 'kchmck/vim-coffee-script'
" Various JS library syntax highlighting, AngularJS, Backbone.js, jQuery,
" underscore.js, Require.js, CoffeeScript, JS, TypeScript, LiveScript, more.
Bundle 'othree/javascript-libraries-syntax.vim'
" Comment things flexibly
Bundle 'tomtom/tcomment_vim'
"Bundle 'vim-scripts/VimClojure'
Bundle 'hallison/vim-markdown'
" Run a vim command in a tmux split pane
"Bundle 'kikijump/tslime.vim'
"Bundle 'benmills/vimux'

" THEMES
Bundle 'latortuga/tomorrow-theme', {'rtp': 'vim/'}
" Base16 theme
Bundle 'chriskempson/base16-vim'

filetype plugin indent on " required from vundle docs

" OLD PLUGIN THING, tpope's pathogen which I think I like
" better but w/e, vundle seems okay too.
" Load everything from .vim/bundle with pathogen
"call pathogen#infect()

"--------------------
" Syntax highlighting
"--------------------
if has("syntax")
  syntax on " turn on syntax highlighting
endif

"--------------------
" General vim options
"--------------------

set smartindent
set autoindent " New lines copy the indent of the previous line
set shiftwidth=2
set tabstop=2
set expandtab " expand tabs to spaces
set smarttab " tab and backspace are smrter
set ruler " row,col in the lower right
set showcmd " show command prefixes as they are typed (4dd, etc)
set hlsearch " highlight search items
set incsearch " search as you type
set ignorecase " search case-insensitive...
set smartcase " ...unless there's a capital letter, then make it case sensitive
set showmode " Show --- INSERT --- in insert mode, etc.
set scrolloff=6 " Jump when 5 lines away from edge of screen
set scrolljump=1 " Jump 1 line at a time when running out of screen
set visualbell " don't beep at me all the time, vim!
set wildmenu " show all available commands when hitting tab
set wildmode=list:longest " tab complete to point of ambiguity
set backspace=indent,eol,start " In insert mode, backspace over everything
set foldmethod=indent " Code folding set to fold around indent and do so on file open
set foldlevel=100
set nobackup " get rid of temp files!
set nowritebackup
set noswapfile
set nospell
set wrap
set number " show line numbers

"filetype on
"filetype plugin indent on

" --------------
"  Undo
" --------------

set undodir=~/.vim_undo
set undofile
set undolevels=1000  "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload"

"----------------------------
" Revised and New Keybindings
"----------------------------

" swap ' and `, they do the same thing except that ` jumps to column in
" addition to row so it's more useful.
nnoremap ' `
nnoremap ` '

" change <Leader> to comma, from backslash
let mapleader = ","

" jump to quickfix matches using alt+n and alt+p
nnoremap <M-n> :cn<CR>
nnoremap <M-p> :cp<CR>

" Map Control+s to save a file, this only works in gvim.
" Command line vim works if you remove ctrl+s as the scroll
" interrupt.
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>

" F1 clear current highlighted search
nnoremap #1 :let @/ = ""<CR>

" F2 search for word selected by visual using git grep (via fugitive)
"vnoremap #2 y:execute "noautocmd Ggrep " . escape(@", '\\/') . "/j " <Bar> :cw<CR>
vmap #2 y:execute ":Ack " . escape(@", '\\/') <Bar> :cn<CR>

" F4 search for word under cursor using vimgrep
vnoremap #4 y:execute "noautocmd vimgrep /" . expand("<cword>") . "/j app/**/* lib/**/* config/**/*" <Bar> :cw<CR>

" Search for word selected by visual using F5
" vnoremap #5 y:execute "noautocmd vimgrep /" . escape(@", '\\/') . "/j app/**/*" <Bar> cw<CR>

" gj and gk use lines on screen instead of logical lines
" meaning they don't skip word wrapped lines
nmap j gj
nmap k gk

" Easy buffer navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>v <C-w>v
noremap <leader>s <C-w>s

" wildignore directories
set wildignore+=*/.git/*,*/solr/*

" wildignore filetypes
set wildignore+=*.png,*.exe,*.jpg,*.gif,*.jar,*.class

"-----------------
" ctrlp.vim config
"-----------------

let g:ctrlp_max_height = 20 " Show 20 matches.
let g:ctrlp_working_path_mode = 0 " Do not manage working dir
let g:ctrlp_user_command = "find %s -type f | egrep -v '/\.(git|hg|svn)|doc|solr|tmp|node_modules/' | egrep -v '\.(png|exe|jpg|gif|jar|class|swp|swo|log|gitkep|keepme|so)$'"
"let g:ctrlp_user_command = "ack -g %s"
"let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

map <leader>t :CtrlP<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>r :CtrlPMRU<CR>

" Set the max files
let g:ctrlp_max_files = 10000

" Optimize file searching
"let g:ctrlp_user_command = {'types': {1: ['.git/', 'cd %s && git ls-files']}, 'fallback': 'find %s -type f | head -' . g:ctrlp_max_files }


" Set colors last, make sure my color scheme gets applied
set t_Co=256 " set to 256 colors for command line vim
"let base16colorspace=256  " Access colors present in 256 colorspace
"set background=dark
colorscheme Tomorrow-Night-Eighties
"colorscheme Tomorrow
"let g:solarized_termcolors=256
"colorscheme solarized
"colorscheme base16-railscasts

"--------------------
" vim-clojure
"--------------------
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1

" Better autocomplete bindings
"map <leader>c :complete
"map <leader>o :omnifunc

" Change the arrow keys to do something useful, indent and unindent
nmap <Left> <<
nmap <Right> >>
vmap <Left> <gv
vmap <Right >gv


" Show trailing whitespace in RED. OMFG this drives me crazy.
"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/
"autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" Oh my god what is ex mode disable the hell out of it.
nnoremap Q gq


""""""""""
" NERDTree
"
nmap <leader>nt :NERDTreeToggle<CR>


"""""""""""""
" Zeus config
"
" Run current test file through zeus.
nmap <leader>1 :execute "!zeus test " . bufname("%")<CR>
" Run current single test through zeus
nmap <leader>2 :execute "!zeus test " . bufname("%") . ":" . line(".")<CR>

" Old Vimux integration commands, not used atm
"nmap <leader>3 :call VimuxRunCommand("clear; zeus test " . bufname("%"))<CR>
"nmap <leader>4 :call VimuxRunCommand("clear; zeus test " . bufname("%") . ":" . line("."))<CR>
nmap <leader>3 :execute "!sh .project.sh"<CR>


""""""""""""""
" Vimux config
"
" Close vim tmux runner opened by VimuxRunCommand.
map <leader>vq :VimuxCloseRunner<CR>
" Inspect vimux runner pane - puts into copy mode (scroll mode).
nmap <leader>vi :VimuxInspectRunner<CR>
" Prompt for a command to run in vimux split.
nmap <leader>vp :VimuxPromptCommand<CR>

" Ack.vim changes to use Ag (The Silver Searcher)
let g:ackprg = 'ag --nogroup --nocolor --column'

" Rename leader a and leader z to go to previous and next quickfix. A and Z
" are easier to hit than N/P after hitting comma as leader.
" A is above meaing move up the quick list - previous
" Z is below meaning move down the quick list - next
nnoremap <leader>z :cnext<CR>
nnoremap <leader>a :cprevious<CR>
nnoremap <leader>q :cclose<CR>

" TComment binding
vmap # :TComment<CR>


" Autocorrect common spelling errors
" iab word_with_wrong_spelling correct_word
iab teh the
iab paymetn payment
iab payemnt payment


" exuberant-ctags config
nnoremap <Leader>ct :!ctags-exuberant *<CR>
" per-project private tags file
set tags=.tags
" remap to jump to tag to ,g for GO
nnoremap <Leader>g <C-]>


" vim-i18n bindings
vnoremap <Leader>z :call I18nTranslateString()<CR>

