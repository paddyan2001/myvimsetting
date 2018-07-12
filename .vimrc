"-------basic setting------
"sys.
set shortmess=atI
set termencoding=utf-8
set encoding=utf-8
set nocompatible              " be iMproved, required
set noerrorbells                "设置没有错误提示音
set novisualbell
syntax enable
set number
set relativenumber
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set backspace =indent,eol,start
set cot-=preview    "设置不显示函数属性buffer
set cursorline      "设置行高亮
set cursorcolumn    "设置列高亮
set nowrap          "设置不自动换行
set showmatch       "高亮括号匹配
set matchtime=2     "高亮括号时间是十分之n秒
set scrolloff=3     "光标移动到buffer的顶部和底部时保持3行距离
set nobackup        "禁止生成临时文件
set noswapfile      "禁止生成交换文件
set autowriteall
set modified
set autoread

"-------os change------
let g:iswindows=0
let g:isgui=0
if(has("win32") || has("win64"))
    let g:iswindows=1
endif
if has("gui_running")
    let g:isgui=1
endif

"set for windows
if (g:iswindows && g:isgui)
    set linespace=6 "6 5
    set guifont=Fira_Code:h12 "Consolas Fira_Code Hack
    set renderoptions=type:directx,renmode:5,taamode:1 "启用directx 渲染
    autocmd GUIEnter * simalt ~x "启动最大化
    let g:completor_python_binary = '~/programs/Python/Python36/python.exe' "notbook
    "let g:completor_python_binary = '~/AppData/Local/Programs/Python/Python36/python.exe' "desktop
    cd ~\OneDrive\Code\
endif

"set for linux mac OSX
if (g:iswindows==0)
    cd ~/code/
    set linespace=5
    set guifont=Fira_Code:h16
    "let g:completor_python_binary = '/usr/local/bin/python'
    let g:completor_python_binary = '/Library/Frameworks/Python.framework/Versions/3.7/bin/python3'
endif

"set for gui
if (g:isgui)
    set guioptions-=r
    set guioptions-=L
    set guioptions-=m
    set guioptions-=T
endif

"-------airline_setting------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"-------scheme change-------
colorscheme gruvbox "desert solarized gruvbox 
let g:usedarkscheme=0
if (g:usedarkscheme)
    set background=dark
    let g:airline_theme="luna" "molokai or deus or luna
else
    set background=light
    let g:airline_theme="solarized" "molokai or deus or luna
endif


"-------keymapping------
nmap ; :
vmap q <esc>
nmap \q :q<CR>
nmap \Q :q!<CR>
nmap \w :w<CR>
nmap \W :w!<CR>
nmap \v :tabedit ~/.vimrc<CR>
nmap , :bd<CR>
nmap \, :bd!<CR>
nmap \x :tabclose<CR>
nmap \n :tabn<cr>
nmap \p :tabp<cr>
nmap <space> :nohlsearch<CR>
nmap <F3> :rightbelow vert term<cr>
nmap \t :rightbelow vert term<cr>
nmap <F4> :rightbelow vert term python<cr>
nmap \y :rightbelow vert term python<cr>
tnoremap <m-q> <c-\><c-n>


"-------split managerment------
nmap <m-j> <c-w>j
nmap <m-k> <c-w>k
nmap <m-h> <c-w>h
nmap <m-l> <c-w>l
inoremap <m-j> <esc><c-w>j
inoremap <m-k> <esc><c-w>k
inoremap <m-h> <esc><c-w>h
inoremap <m-l> <esc><c-w>l


"-------search------
set hlsearch
set incsearch


"-------autocomplete and completor setting------
set complete=.,w,b,u
let g:completor_completion_delay = 0
let g:completor_auto_close_doc = 0


"superTab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"


"-------autorun------
nmap <F8> :call FormatCode()<CR>
nmap 'f :call FormatCode()<CR>
nmap <F5> :call Run()<CR>
nmap 'r :call Run()<CR>
func! FormatCode()
    exec "w"
    if &filetype == "python"
        exec "!autopep8 --in-place --aggressive %"
    endif
endfunc
func! Run()
    if &filetype == "python"
        exec "w"
    if (g:iswindows)
        exec "rightbelow vert term python %"
    endif
    if (g:iswindows==0)
        exec "rightbelow vert term python3 %"
        "!clear&&python3 %
    endif
endfunc

"-------autocommands------
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END


"-------PluginInstall------
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'w0rp/ale'
Plugin 'maralla/completor.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'Yggdroot/LeaderF'
"Plugin 'rust-lang/rust.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"-------PluginInstall------
