"-------basic setting------
set shortmess=atI
set termencoding=utf-8
set encoding=utf-8
set nocompatible              " be iMproved, required
set noerrorbells                "设置没有错误提示音
set novisualbell
syntax enable
set number
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
let autosave=6

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
    set linespace=8 "6 5
    set guifont=Hack:h12 "Consolas Fira_Code_Retina Hack
    set renderoptions=type:directx,renmode:5,taamode:1 "启用directx 渲染
    "autocmd GUIEnter * simalt ~x "启动最大化
endif
if (g:iswindows)
    "let g:completor_python_binary = '~/programs/Python/Python36/python.exe' "notbook
    let g:completor_python_binary = '~/AppData/Local/Programs/Python/Python36/python.exe' "desktop
    cd ~\OneDrive\Code\
endif

"set for linux mac OSX
if (g:iswindows==0)
    cd ~/code/
    set linespace=5
    set guifont=Hack:h16
    "set guifont=Roboto\ Mono\ Medium\ for\ Powerline:h16
    let g:completor_python_binary = '/usr/local/bin/python'
endif

"set for gui
if (g:isgui)
    set background=dark
    colorscheme gruvbox "desert
    set guioptions-=r
    set guioptions-=L
    set guioptions-=m
    set guioptions-=T
endif

"set for cterm
if (g:isgui==0)
    colorscheme atom-dark-256
    highlight CursorColumn term=NONE ctermbg=black
    highlight CursorLine term=NONE ctermbg=black
    "highlight VertSplit ctermbg=darkgrey ctermfg=darkgrey
    "highlight LineNr ctermfg=black
    "highlight TabLineFill ctermfg=Black
    "highlight TabLine ctermfg=grey ctermbg=black
endif


"-------airline_setting------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme="luna" "molokai or deus or luna


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
nmap <space> :nohlsearch<CR>
nmap ] :bn<cr>
nmap [ :bp<cr>


"-------split managerment------
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


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
autocmd FileType python nmap <F5> :w<cr>:exec "!python %"<cr>
map <F2> :call FormatCode()<CR>
func! FormatCode()
    exec "w"
    if &filetype == 'python'
        exec "!autopep8 --in-place --aggressive %"
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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"-------PluginInstall------
