"-------basic setting------
set termencoding=utf-8
set encoding=utf-8
set nocompatible
set noerrorbells
set novisualbell
syntax enable
set number
set ruler
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set backspace =indent,eol,start
set cot-=preview    "设置不显示函数属性buffer
set nowrap          "设置不自动换行
set showmatch       "高亮括号匹配
set matchtime=2     "高亮括号时间是十分之n秒
set scrolloff=3     "光标移动到buffer的顶部和底部时保持3行距离
set nobackup        "禁止生成临时文件
set nowb
set noswapfile      "禁止生成交换文件
set autowriteall
set modified
set autoread
set showtabline=2  "0,1,2显示标签栏
set tabpagemax=15  "设置标签栏最大值
"set signcolumn=yes  "强制显示侧边栏
set history=600     "多少次历史操作
set lazyredraw
set magic
set wildmenu
set hlsearch
set incsearch
set ignorecase
set smartcase


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
if (g:iswindows)
    set linespace=8 "6 8
    set guifont=Hack:h12 "Consolas Fira_Code Hack
    set renderoptions=type:directx,renmode:5,taamode:1 "启用directx 渲染
    autocmd GUIEnter * simalt ~x "启动最大化
    let g:completor_python_binary = '~/AppData/Local/Programs/Python/Python36/python.exe'
    "let g:completor_gocode_binary = '~/go/bin/gocode.exe'
    cd ~\OneDrive\Code\
elseif (g:ismac)
    cd ~/code/
    set linespace=5
    set guifont=Hack:h16
    let g:completor_python_binary = '/Library/Frameworks/Python.framework/Versions/3.7/bin/python3'
    let g:completor_clang_binary = '/usr/bin/clang'
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
set background=dark
nmap \vd :set background=dark<cr>
nmap \vl :set background=light<cr>

"-------keymapping------
nmap ' :
nmap = :tabclose<CR>
nmap + :tabclose!<CR>
nmap \v :tabedit ~/.vimrc<CR>
nmap \c :%s/\s\+$//e<cr>
nmap - :bd<CR>
nmap _ :bd!<CR>
nmap <space> :nohlsearch<CR>
nmap <F1> :below term<cr>
nmap <F2> :below term python<cr>
nmap <C-h>  :tabfirst<CR>
nmap <C-j>  :tabnext<CR>
nmap <C-k>  :tabprev<CR>
nmap <C-l>  :tablast<CR>
nmap <C-o>  :tabonly<CR>
nmap <C-n>  :tabedit<Space>
nmap <F8> :call FormatCode()<CR>
nmap <F6> :make<CR>
nmap <F5> :call Run()<CR>


if(g:ismac)
    set macmeta
endif

if(g:iswindows || g:ismac)
    tnoremap ` <c-\><c-n><c-w>k
    tnoremap `` <c-\><c-n>
    tnoremap <c-q> exit<cr>
    tnoremap <c-Q> exit()<cr>
    tnoremap <c-z> <c-z><cr>
    tnoremap <c-p> python<Space>
    nmap <M-w> :w<CR>
    nmap <M-q> :q<CR>
    nmap <M-Q> :qa!<CR>
    nmap <M-j> <c-w>j
    nmap <M-k> <c-w>k
    nmap <M-h> <c-w>h
    nmap <M-l> <c-w>l
    nmap <M-p> :bp<cr>
    nmap <M-n> :bn<cr>
    nmap <M-v> :cw<CR>
    nmap <M-c> :ccl<CR>
    nmap <M-f> :call FormatCode()<CR>
    nmap <M-b> :make<CR>
    nmap <M-r> :call Run()<CR>
endif
if(islinux)
    nmap <ESC>w :w<CR>
    nmap <ESC>q :q<CR>
    nmap <ESC>Q :qa!<CR>
    nmap <ESC>j <c-w>j
    nmap <ESC>k <c-w>k
    nmap <ESC>h <c-w>h
    nmap <ESC>l <c-w>l
    nmap <ESC>p :bp<cr>
    nmap <ESC>n :bn<cr>
    nmap <ESC>v :cw<CR>
    nmap <ESC>c :ccl<CR>
    nmap <ESC>f :call FormatCode()<CR>
    nmap <ESC>b :make<CR>
    nmap <ESC>r :call Run()<CR>
endif

"-------autocomplete and completor setting------
set complete=.,w,b,u
let g:completor_completion_delay = 800
let g:completor_complete_options = 'menuone,noselect'

"-------autorun------
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

augroup makejava
    autocmd!
    autocmd FileType java set makeprg=javac\ %
augroup END

augroup makec
    autocmd!
    autocmd FileType c set makeprg=gcc\ %\ -o\ %<
augroup END

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
            exec "below term python %"
        elseif(g:ismac)
            exec "below term python3 %"
        elseif(g:islinux)
            exec "!clear&&python3 %"
        endif
    endif
    if &filetype=="sh"
        exec "w"
        exec "!./%"
    endif
    if &filetype=="c"
        exec "!./%<"
    endif
    if &filetype=="java"
        exec "below term java %<"
    endif
endfunc
"-------autorun------


"-------vim-plug------
call plug#begin('~/.vim/plugged')
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'maralla/completor.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'Yggdroot/LeaderF'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree', {'on':'NERDTreeToggle'}
Plug 'w0rp/ale'
Plug 'justinmk/vim-sneak'
"Plug 'fatih/vim-go',{'do': ':GoUpdateBinaries'}
call plug#end()
"-------vim-plug------


"--------------plugin_setting----------------------------------
"------indent line
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

"------superTab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

"------NERDTree
"autocmd vimenter * NERDTree
map <c-t> :NERDTreeToggle<CR>

"------ale
let g:ale_linters = {'c': ['gcc'],'python': ['pylint'],'java':['javac'],'bash': ['shell']}
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 800
let g:ale_echo_delay = 200
let g:ale_lint_delay = 500
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

"------LeaderF
let g:Lf_ShortcutF = '<leader>\'

"--------------plugin_setting---------------------------------
