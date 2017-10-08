set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin(‘~/some/path/here‘)
Bundle 'VundleVim/Vundle.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'EnhCommentify.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'flazz/vim-colorschemes'
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'tpope/vim-fugitive'
Bundle 'easymotion/vim-easymotion'
Bundle 'delimitMate.vim'
Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'
Bundle 'junegunn/vim-easy-align'

call vundle#end()            " required
filetype plugin indent on    " required
"color scheme
syntax enable
"set background=dark
"colorscheme gruvbox
"colorscheme hybrid-light
"colorscheme bubblegum-256-light
"colorscheme lightcolors
"colorscheme LightDefaultGrey
colorscheme lightning
"colorscheme solarized

"crtlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'



set nocompatible
"ycm config
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

"Nerdtree settings
let NERDTreeWinPos='right'
let NERDTreeWinSize=31
let NERDTreeChDirMode=1
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 0 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Set leader
let mapleader=","
let g:mapleader=","
nmap<silent><F3> ,x
vmap<silent><F3> ,x
imap<silent><F3> ,x

"Syntastic
let g:syntastic_cpp_checkers= ['g++']
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11' 
let g:ycm_show_diagnostics_ui = 0

"vim airline
"https://www.zhihu.com/question/25219546 set the front from zhihu
set guifont=DroidSansMonoSlashed\ 12
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_powerline_fonts = 1
"tabline
let g:airline#extensions#tabline#enabled = 1

"airlie theme
let g:airline_theme='molokai'

"back space delete everything including indent
set backspace=indent,eol,start
"ctags
set tags=tags;/
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
map<silent> <F9> :TlistToggle<cr>
"set relativenumber
set number
set softtabstop=4 tabstop=4 shiftwidth=4
set expandtab
set autoindent
set smartindent
set cindent
set hlsearch
"set mouse=a
set cursorline
set noerrorbells
set clipboard=unnamed
syntax on

imap jk <ESC>
imap jf jkla
"imap jf <S-Tab>
"inoremap {<cr> {<cr>}<c-o>O<tab>
imap <C-L> <RIGHT>
"nmap 1 ^h 
"brackets
inoremap {<cr> {<cr>}<c-o>O
"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i

"Compile F7
map <F7> :w <CR> :!clear; g++ -g -std=c++14 %&& ./a.out <CR>
imap <F7> <Esc>:w <CR> :!clear; g++ -g -std=c++14 %&& ./a.out <CR>
map <F12> :w <CR> :source .vimrc <CR>
imap <F12> <Esc>:w <CR> :source .vimrc <CR>

"easy motion
map <silent> <leader><leader>w <Plug>(easymotion-bd-w)
map <silent> <leader><leader>e <Plug>(easymotion-bd-e)
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

set list listchars=tab:→\ ,trail:·
nnoremap <leader>q :bp<cr>:bd #<cr>


"use the color scheme in tmux
set term=screen-256color

" make YCM compatible with UltiSnips (using supertab)
 let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
 let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
 let g:SuperTabDefaultCompletionType = '<C-n>'

"better key bindings for UltiSnipsExpandTrigger
"http://codefor.life/ultisnips/
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/ultisnips/UltiSnips"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>""
let g:UltiSnipsEditSplit="vertical"
nmap <leader>ue :UltiSnipsEdit<cr>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
