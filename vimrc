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
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set autoindent
"Other Options
set wildmode=longest,list,full
set wildmenu
set nobackup
set nocompatible
set mouse=a
"set paste
"Colorscheme options
colorscheme vividchalk
set t_Co=256

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

if has("gui_running")
  set guioptions=aAce
  set showtabline=2
  set guifont=Monaco:h13
endif
