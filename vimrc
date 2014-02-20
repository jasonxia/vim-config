function! InitJavaScript()
  autocmd FileType javascript set tabstop=2
endfunction

function! InitGroovy()
  autocmd BufNewFile,BufRead *.gradle setf groovy
endfunction

function! InitMarkdown()
  autocmd BufNewFile,BufRead *.md setf markdown
endfunction

function! InitFreeMarker()
  autocmd BufNewFile,BufRead *.ftl setf ftl
endfunction

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Use Vundle to manage plugins
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
" vim-scripts repos
Bundle 'L9'

" original repos on github
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mattn/zencoding-vim'
Bundle 'godlygeek/tabular'
Bundle 'msanders/snipmate.vim'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'gregsexton/gitv'
Bundle 'kchmck/vim-coffee-script'
Bundle 'bogado/file-line'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'hallison/vim-ruby-sinatra'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-vividchalk'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rake'
Bundle 'vim-scripts/grep.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'vim-scripts/matchit.zip'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'derekwyatt/vim-scala'
Bundle 'chaquotay/ftl-vim-syntax'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'skammer/vim-css-color'
Bundle 'mhinz/vim-signify'
filetype plugin indent on

call InitJavaScript()
call InitGroovy()
call InitMarkdown()
call InitFreeMarker()
call yankstack#setup()

"Colorscheme options
colorscheme vividchalk
syntax on
set t_Co=256

set autoread "Set to auto read when a file is changed from the outside
set wrap
set cmdheight=2 "command bar is 2 high
set backspace=indent,eol,start "set backspace function
set hlsearch "highlight searched things
set incsearch "incremental search
set ignorecase "ignore case
set textwidth=0
set ruler "show current position
set number "show line number
set showmatch "show maching braces
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set autoindent
"Other Options
set wildmode=longest,list,full
set wildmenu
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set nobackup
set nocompatible
set mouse=a
"set paste
set list
set listchars=tab:=»,trail:·

"Set Mapleader
let g:mapleader = ","

map <Leader>, :NERDTreeToggle<cr>
map <Leader>/  <plug>NERDCommenterToggle<cr>
map <Leader>b :BufExplorerHorizontalSplit<cr>
"Copy the file path to buffer
map <silent> <Leader>c :let @+ = expand("%")<cr>
map <Leader>d orequire 'ruby-debug'; debugger<esc>
map <Leader>p ouse Data::Dumper; print STDERR '' . Dumper('');<esc>
"Grep.vim
map <Leader>f :Grep<cr>
"Format JSON - filter the file through Python to format it
map <Leader>j :%!python -m json.tool<cr>
"Reveal file in NerdTree
map <Leader>R :NERDTreeFind<cr>
"Show ctags - TagList plugin
map <leader>t :TlistToggle<cr>
"Build ctags (requires exuberant-ctags)
map <leader>T :!ctags -R .<cr>
"window movement/operations
map <leader>+ <c-w>+
map <leader>- <c-w>-
map <leader>= <c-w>=
map <leader>_ <c-w>_
"Yankstack plugin
nmap <leader>o <Plug>yankstack_substitute_older_paste
nmap <leader>i <Plug>yankstack_substitute_newer_paste

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

"set global variable
let g:Powerline_symbols = 'unicode'
let g:Tlist_Show_One_File = 1
let g:Tlist_Use_Right_Window = 1
let g:Tlist_GainFocus_On_ToggleOpen = 1
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_user_command = {
 \ 'types': {
	 \ 1: ['.git/', 'cd %s && git ls-files'],
	 \ 2: ['.hg/', 'hg --cwd %s locate -I .'],
	 \ },
 \ 'fallback': 'find %s -type f'
 \ }

" grep.vim settings
let Grep_Default_Options = '-ir'

" zen-coding settings
let g:user_zen_expandabbr_key = '<c-e>'
imap <C-Space> <C-e>
let g:use_zen_complete_tag = 1
let g:user_zen_settings = {
  \  'haml' : {
  \    'filters' : 'haml',
  \  }
  \}

" signify
let g:signify_disable_by_default = 1

if has("gui_running")
  set guioptions=aAce
  set showtabline=2
  set guifont=Monaco:h13
endif
