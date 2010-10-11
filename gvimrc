 "Set Mapleader
 let mapleader = ","
 let g:mapleader = ","

 ""Turn filetype plugin on
 filetype plugin on

 "Set to auto read when a file is changed from the outside
 set autoread

 """"""""""""""""""""""""""""""
 " Statusline
 """"""""""""""""""""""""""""""
 "Always hide the statusline
 set laststatus=2

 "Format the statusline
 set statusline=Line:\ \ %l/%L:%c\ \ \ %F%m%r%h\ %w

 "Fast saving
 nmap <leader>w :w!<cr>

 "Remove the Windows ^M
 map <Leader>m mz:%s/\r$//g<cr>`z

 "Nerd Tree commands and options
 map <Leader>, :NERDTreeToggle<cr>
 map <Leader>t :CommandT<cr>

 "Map hlsearch
 nmap <Leader>hl :set hlsearch!<CR>

 "Smart way to move btw. windows
 map <C-j> <C-W>j
 map <C-k> <C-W>k
 map <C-h> <C-W>h
 map <C-l> <C-W>l


 "GUI Options
 set guioptions=e
 set showtabline=2
 set tabpagemax=15

 "Font info
 set guifont=Menlo:h14
 "set gfn=Monaco:h14:cANSI

 "Colorscheme options
 colorscheme vividchalk 
 
 "Other Options
 set wildmode=longest,list,full
 set wildmenu
 set nobackup
 set nocompatible
 set ruler
 set number
 set nuw=4
 set vb
 set binary noeol
 set backspace=indent,eol,start
 set laststatus=2
 set showmode
 set showmatch
 set ignorecase
 set autoindent
 syntax on

 "Python 
" autocmd BufRead *.py set smartindent
" cinwords=if,elif,else,for,while,try,except,finally,def,class
" set tabstop=4
" set shiftwidth=4
" set expandtab
" set softtabstop=4

" ab teh the
" ab fro for

" set incsearch
" set ignorecase smartcase 

 "Tab maps
 map t1 1gt
 map t2 2gt
 map t3 3gt
 map t4 4gt
 map t5 5gt
 map t6 6gt
 map t7 7gt
 map t8 8gt
 map t9 9gt

 "VCSCommand
 command SVNadd VCSAdd
 command SVNblame VCSAnnotate
 command SVNcommit VCSCommit
 command SVNdelete VCSDelete
 command SVNdiff VCSVimDiff
 command SVNlog VCSLog
 command SVNstatus VCSStatus
 command SVNupdate VCSUpdate
 command SVNup VCSUpdate

 "Status line visual fluff
 set laststatus=2
 set statusline=
 set statusline+=%2*%-3.3n%0* " buffer number
 set statusline+=%f " file name
 set statusline+=%h%1*%m%r%w%0* " flags
 set statusline+=[%{strlen(&ft)?&ft:'none'}, " filetype
 set statusline+=%{&fileformat}] " file format
 set statusline+=%= " right align
 set statusline+=%2*0x%-8B " current char
 set statusline+=%-14.(%l,%c%V%) " offset

 " Only rightscrollbars
 set guioptions-=L
 set guioptions-=l
 set guioptions+=R
 set guioptions+=r
