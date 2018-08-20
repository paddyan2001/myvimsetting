"-------basic setting------
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
let g:ismac=0
let g:islinux=0
let g:isgui=0
if(has("win32") || has("win64"))
    let g:iswindows=1
elseif(has("mac"))
    let g:ismac=1
elseif(has("unix"))
    let g:islinux=1
endif
if has("gui_running")
    let g:isgui=1
endif

"set for windows
if (g:iswindows && g:isgui)
    set linespace=5 "6 5
    set guifont=Hack:h12 "Consolas Fira_Code Hack
    set renderoptions=type:directx,renmode:5,taamode:1 "启用directx 渲染
    autocmd GUIEnter * simalt ~x "启动最大化
    "let g:completor_python_binary = '~/programs/Python/Python36/python.exe' "notebook
    let g:completor_python_binary = '~/AppData/Local/Programs/Python/Python36/python.exe' "desktop
    cd ~\OneDrive\Code\
elseif (g:ismac)
    cd ~/code/
    set linespace=5
    set guifont=Hack:h16
    let g:completor_python_binary = '/Library/Frameworks/Python.framework/Versions/3.7/bin/python3'
elseif (g:islinux)
    cd ~/code/
    set linespace=5
    set guifont=Fira_Code:h16
    let g:completor_python_binary = '/usr/bin/python3'
endif

if (g:isgui)
    set guioptions-=r
    set guioptions-=L
    set guioptions-=m
    set guioptions-=T
    set guioptions-=e
endif

"-------scheme change-------
colorscheme gruvbox "desert solarized gruvbox
nmap \vd :call SetDarkScheme()<cr>
nmap \vl :call SetLightScheme()<cr>
func! SetDarkScheme()
    "let g:airline_theme="luna" "molokai or deus or luna
    set background=dark
endfunc
func! SetLightScheme()
    "let g:airline_theme="solarized"
    set background=light
endfunc

let g:usedarkscheme=1
if (g:usedarkscheme)
    call SetDarkScheme()
else
    call SetLightScheme()
endif


"-------keymapping------
nmap ' :
nmap \q :q<CR>
nmap \Q :q!<CR>
nmap = :tabclose<CR>
nmap + :x<CR>
nmap \w :w<CR>
nmap \v :tabedit ~/.vimrc<CR>
nmap - :bd<CR>
nmap _ :bd!<CR>
nmap [ :tabp<cr>
nmap ] :tabn<cr>
nmap \[ :bp<cr>
nmap \] :bn<cr>
nmap <space> :nohlsearch<CR>
nmap <F3> :below term<cr>
nmap \t :below term<cr>
nmap <F4> :below term python<cr>
nmap \y :below term python<cr>
if(g:islinux==0)
    tnoremap ` <c-\><c-n><c-w>k
    tnoremap `` <c-\><c-n>
    tnoremap <c-q> exit<cr>
    tnoremap <c-z> <c-z><cr>
    tnoremap <c-p> python
endif

"-------split managerment------
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l


"-------search------
set hlsearch
set incsearch


"-------autocomplete and completor setting------
set complete=.,w,b,u
let g:completor_completion_delay = 1200
let g:completor_complete_options = 'menuone,noselect'


"-------autorun------
nmap <F8> :call FormatCode()<CR>
nmap \F :call FormatCode()<CR>
nmap <F5> :call Run()<CR>
nmap \r :call Run()<CR>
func! FormatCode()
    exec "w"
    if &filetype == "python"
        exec "!autopep8 --in-place --aggressive %"
    endif
endfunc
func! Run()
    exec "w"
    if &filetype == "python"
        if (g:iswindows)
            exec "below term python %"
        elseif(g:ismac)
            exec "below term python3 %"
        elseif(g:islinux)
            exec "!clear&&python3 %"
        endif
    endif
    if &filetype=="sh"
        exec "!clear&&bash %"
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
"Plugin 'tpope/vim-vinegar'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'maralla/completor.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'Yggdroot/LeaderF'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'w0rp/ale'
"Plugin 'rust-lang/rust.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"-------PluginClean------


"--------------plugin_setting----------------------------------

"------airline_setting
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1

"------indent line
let g:indent_guides_enable_on_vim_startup = 1

"------superTab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

"------NERDTree
autocmd vimenter * NERDTree
map <c-n> :NERDTreeToggle<CR>
"--------------plugin_setting---------------------------------
