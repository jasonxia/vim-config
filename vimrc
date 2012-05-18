function! InitJavaScript() 
	autocmd FileType javascript set tabstop=2
endfunction

"Set Mapleader
let g:mapleader = ","

""Turn filetype plugin on
filetype plugin on

"Set to auto read when a file is changed from the outside
set autoread

set wrap
set autoindent
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

filetype plugin indent on
syntax on

map <Leader>, :NERDTreeToggle<cr>
map <Leader>b :BufExplorerHorizontalSplit<cr>

call pathogen#infect() 
call InitJavaScript()

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
