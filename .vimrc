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
"preloaded snips
Bundle 'honza/vim-snippets'
Bundle 'junegunn/vim-easy-align'
"switch between .h and .cpp file
Bundle 'derekwyatt/vim-fswitch'
"require clang-format
Bundle 'rhysd/vim-clang-format' 
Bundle 'kshenoy/vim-signature'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/Conque-GDB'

call vundle#end()            " required
filetype plugin indent on    " required
"color scheme
syntax enable
set background=dark
set cursorline!
set cursorcolumn

set lazyredraw

"set folder method
"za zM zR
set foldmethod=syntax
"set foldmethod=indent
set nofoldenable

"colorscheme gruvbox
"colorscheme hybrid-light
"colorscheme bubblegum-256-light
"colorscheme lightcolors
"colorscheme LightDefaultGrey
"colorscheme lightning
"colorscheme solarized
colorscheme molokai

"sudo update-alternatives --config Vim
set nocompatible

"clang format settings
let g:clang_format#auto_format = 1
"let g:clang_format#auto_format_on_insert_leave = 1

let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

"tagbar
nmap <F1> :TagbarToggle<CR>
"ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c++
"change the path of tags as need be
"set tags+=~/tags;/
set tags=./tags;/
let tagbar_left=1
let tagbar_width=32
let g:tagbar_compact=1
nmap <Leader>tn :tnext<CR>
nmap <Leader>tp :tprevious<CR>

let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

"crtlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode = 'ra'

"ycm config
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

"Nerdtree settings
let NERDTreeWinPos='right'
let NERDTreeWinSize=32
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeChDirMode=1
let NERDTreeAutoDeleteBuffer=1
map <F2> :NERDTreeToggle<CR>
"autocmd bufenter * if (winnr("$") == 0 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Set leader
let mapleader=","
let g:mapleader=","
nmap<silent><F3> ,x
vmap<silent><F3> ,x
imap<silent><F3> ,x

"Syntastic
"let g:syntastic_cpp_checkers= ['g++']
let g:syntastic_cpp_checkers= ['clang++']
"let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler = 'clang++'
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
set cinoptions=g-1
set hlsearch
"set mouse=a
set cursorline
set noerrorbells
set clipboard=unnamed
syntax on

"maps
imap jk <ESC>
imap JK <ESC>
imap jf <Right>
imap JF <Right>
vmap ff <ESC>
vmap FF <ESC>
"imap jf <S-Tab>
"inoremap {<cr> {<cr>}<c-o>O<tab>
imap <C-L> <RIGHT>
"nmap 1 ^h 
"brackets
inoremap {<cr> {<cr>}<c-o>O
"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i
nmap LB 0
nmap LE $
nmap <silent> <C-K><C-O> :FSHere<CR>
vnoremap <Leader>y "+y
vnoremap <Leader>p "+p
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>nw <C-W><C-W>
nnoremap <Leader>lw <C-W>l
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>kw <C-W>k
nnoremap <Leader>jw <C-W>j
nmap <Leader>noh :noh<CR>

"vnoremap <Leader>y :%w !xclip -i -sel c
"nmap<Leader>p :r !xclip -o -sel -c 



"Compile F7
map <F5> :w <CR> :!clear; clang++ -g -std=c++11 %&& ./a.out <CR>
imap <F5> <Esc>:w <CR> :!clear; clang++ -g -std=c++11 %&& ./a.out <CR>
map <F6> :w <CR> :!clear; g++ -g -std=c++11 %&& ./a.out <CR>
imap <F6> <Esc>:w <CR> :!clear; g++ -g -std=c++11 %&& ./a.out <CR>
map <F7> :w <CR> :!clear; clang++ -g -std=c++14 %&& ./a.out <CR>
imap <F7> <Esc>:w <CR> :!clear; clang++ -g -std=c++14 %&& ./a.out <CR>
map <F8> :w <CR> :!clear; g++ -g -std=c++14 %&& ./a.out <CR>
imap <F8> <Esc>:w <CR> :!clear; g++ -g -std=c++14 %&& ./a.out <CR>
map<F9> :ConqueGdb a.out <CR>
imap<F9> <Esc>:ConqueGdb a.out <CR>
map <F12> :w <CR> :source ~/.vimrc <CR>
imap <F12> <Esc>:w <CR> :source ~/.vimrc <CR>

"easy motion
map <silent> <leader><leader>w <Plug>(easymotion-bd-w)
map <silent> <leader><leader>e <Plug>(easymotion-bd-e)
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

set list listchars=tab:→\ ,trail:·
"nnoremap <leader>q :bp<cr>:bd #<cr>


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
"let g:UltiSnipsEditSplit="vertical"
"nmap <leader>ue :UltiSnipsEdit<cr>

"xmap ga <Plug>(EasyAlign)
"nmap ga <Plug>(EasyAlign)

" copy (write) highlighted text to .vimbuffer
vmap <c-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
" paste from buffer
map <C-v> :r ~/.vimbuffer<CR>

"Conque GDB
let g:ConqueTerm_Color = 2
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_StartMessages = 0


