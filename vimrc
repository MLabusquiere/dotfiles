""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              

filetype off                  " required by vundle

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-pathogen'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'trotter/autojump.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'fatih/vim-go'
Plugin 'itchyny/calendar.vim'
Plugin 'tfnico/vim-gradle'
Plugin 'elzr/vim-json'
call vundle#end()            " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
" Set to auto read when a file is changed from the outside
set autoread
" Be smart when using tabs ;)
set smarttab
" line numbers
set number
" Don't redraw while executing macros (good performance config)
set lazyredraw 
" Zsh like autocompletion
set wildmode=longest,list,full
set wildmenu

filetype plugin indent on    

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open automatically NERDTree and change the focus on the 
" previous file (ie : not in NERDTree)
" autocmd VimEnter * NERDTree | wincmd p

" Close automatically 
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect()
call pathogen#helptags()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Research
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spelling
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocompletion for word
set complete+=kspell
" ss will activate/deactivate spelling
map <leader>ss :setlocal spell!<cr>

autocmd BufRead,BufNewFile *.md setlocal spell spelllang=fr
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

autocmd FileType gitcommit setlocal spell spelllang=en

autocmd FileType sh highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd FileType sh match OverLength /\%81v.\+/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Calendar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

