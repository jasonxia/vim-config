scriptencoding utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

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

function! InitTypeScript()
  autocmd BufNewFile,BufRead *.ts setf typescript
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
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
" vim-scripts repos
Plugin 'L9'

" original repos on github
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
Plugin 'msanders/snipmate.vim'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'gregsexton/gitv'
Plugin 'kchmck/vim-coffee-script'
Plugin 'bogado/file-line'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'hallison/vim-ruby-sinatra'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-vividchalk'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rake'
Plugin 'vim-scripts/grep.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'vim-scripts/matchit.zip'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'derekwyatt/vim-scala'
Plugin 'chaquotay/ftl-vim-syntax'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'skammer/vim-css-color'
Plugin 'mhinz/vim-signify'
Plugin 'genoma/vim-less'
Plugin 'slim-template/vim-slim'
Plugin 'vim-scripts/Vim-R-plugin'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'airblade/vim-gitgutter'
Plugin 'leafgarland/typescript-vim'

call vundle#end()
filetype plugin indent on

call InitJavaScript()
call InitGroovy()
call InitMarkdown()
call InitFreeMarker()
call InitTypeScript()
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
set cursorline
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
map <Leader>d orequire 'byebug'; byebug<esc>
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
" move line up and down
nnoremap <S-Up>   :<C-u>silent! move-2<CR>==
nnoremap <S-Down> :<C-u>silent! move+<CR>==
xnoremap <S-Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
xnoremap <S-Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv

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

" Emmet settings
let g:user_emmet_leader_key = '<C-Space>'

" signify
let g:signify_disable_by_default = 1

if has("gui_running")
  set guioptions=aAce
  set showtabline=2
  set guifont=Monaco:h13
endif
