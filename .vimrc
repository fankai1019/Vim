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

call vundle#end()            " required
filetype plugin indent on    " required
"color scheme
syntax enable
set background=dark
colorscheme gruvbox

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

set nu
set softtabstop=4 tabstop=4 shiftwidth=4
set expandtab
set autoindent
set smartindent
set cindent
"set hlsearch
"set mouse=a
set cursorline
set noerrorbells
set clipboard=unnamed
syntax on

imap jk <ESC>
imap <C-L> <RIGHT>
nmap 1 ^h 

let s:pairs={
            \'<': '>',
            \'{': '}',
            \'[': ']',
            \'(': ')',
            \'«': '»',
            \'„': '“',
            \'“': '”',
            \'‘': '’',
        \}
call map(copy(s:pairs), 'extend(s:pairs, {v:val : v:key}, "keep")')
function! InsertPair(left, ...)
    let rlist=reverse(map(split(a:left, '\zs'), 'get(s:pairs, v:val,v:val)'))
    let opts=get(a:000, 0, {})
    let start   = get(opts, 'start',   '')
    let lmiddle = get(opts, 'lmiddle', '')
    let rmiddle = get(opts, 'rmiddle', '')
    let end     = get(opts, 'end',     '')
    let prefix  = get(opts, 'prefix',  '')
    let start.=prefix
    let rmiddle.=prefix
    let left=start.a:left.lmiddle
    let right=rmiddle.join(rlist,'').end
    let moves=repeat("\<Left>",len(split(right, '\zs')))
    return left.right.moves
endfunction
noremap! <expr> ,f InsertPair('{')
noremap! <expr> ,h InsertPair('[')
noremap! <expr> ,s InsertPair('(')
noremap! <expr> ,u InsertPair('<')

"Compile F7
map <F7> :w <CR> :!g++ -g -std=c++14 %&& ./a.out <CR>
map <F12> :w <CR> :source .vimrc <CR>

"map <leader>r "+gp  
"map <leader>q "+y

set list listchars=tab:→\ ,trail:·
nnoremap <leader>q :bp<cr>:bd #<cr>
