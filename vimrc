function! InitJavaScript() 
	autocmd FileType javascript set tabstop=2
endfunction

function! InitGroovy() 
	autocmd BufNewFile,BufRead *.gradle setf groovy
endfunction

" Use Pathogen to keep plugins in bundles
filetype off
call pathogen#infect()
filetype plugin indent on
syntax on

call InitJavaScript()
call InitGroovy()

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
set expandtab
set tabstop=2
set smartindent
set autoindent
"Other Options
set wildmode=longest,list,full
set wildmenu
set nobackup
set nocompatible
set mouse=a
set paste
"Colorscheme options
colorscheme vividchalk
set t_Co=256

"Set Mapleader
let g:mapleader = ","

map <Leader>, :NERDTreeToggle<cr>
map <Leader>/  <plug>NERDCommenterToggle<cr>
"Show ctags - TagList plugin
map <leader>c :TlistToggle<cr>
"Build ctags (requires exuberant-ctags)
map <leader>C :!ctags -R .<cr>
map <leader>d orequire 'ruby-debug'; debugger<esc>

"set global variable
let g:Powerline_symbols='unicode'
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_user_command = {
 \ 'types': {
	 \ 1: ['.git/', 'cd %s && git ls-files'],
	 \ 2: ['.hg/', 'hg --cwd %s locate -I .'],
	 \ },
 \ 'fallback': 'find %s -type f'
 \ }

if has("gui_running")
  set guioptions=aAce
  set showtabline=2
  set guifont=Monaco:h13
endif
