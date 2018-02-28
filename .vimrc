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
set autowrite
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
    set linespace=5
    "set guifont=Consolas:h14
    set guifont=Fira_Code_Retina:h13
endif
if (g:iswindows)
    cd ~\OneDrive\Code\
endif

"set for linux mac OSX
if (g:iswindows==0)
    cd ~/code/
    set linespace=5
    set guifont=Menlo:h15
    let g:completor_python_binary = '/usr/local/bin/python'
endif

"set for gui
if (g:isgui)
    set background=dark
    "colorscheme desert
    "colorscheme atom-dark-256
    colorscheme gruvbox
    set guioptions-=r
    set guioptions-=L
    set guioptions-=m
    set guioptions-=T
endif

"set for cterm
if (g:isgui==0)
    set t_CO=256
    colorscheme atom-dark-256
endif



"-------visuallize------
let g:ale_sign_column_always = 1
let g:ale_sign_error = '->'
let g:ale_sign_warning = '--'
highlight VertSplit ctermbg=darkgrey ctermfg=darkgrey
highlight LineNr ctermfg=black
highlight TabLineFill ctermfg=Black
highlight TabLine ctermfg=grey ctermbg=black
highlight CursorLine term=NONE ctermbg=black


"-------airline_setting------
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme="molokai"
let g:airline_theme="deus"
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#formatter = 'default'

"-------keymapping------
nmap ; :
vmap q <esc>
nmap \q :q<CR>
nmap \w :w<CR>
nmap \v :tabedit ~/.vimrc<CR>
nmap \vp :tabedit ~/.vim/plugins.vim<CR>
nmap \b :bd<CR>
nmap \B :bd!<CR>
nmap \x :tabclose<CR>
nmap <space> :nohlsearch<CR>
nmap ] :bn<cr>
nmap [ :bp<cr>

"-------ale_setting------
let g:ale_lint_on_save = 1
"let g:ale_fixers = {'javascript': ['eslint'],}
let g:ale_fixers = {'python': ['yapf'],}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

"-------split managerment------
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"-------search------
set hlsearch
set incsearch

"-------sourcefiles------
source ~/.vim/plugins.vim

"-------autocomplete------
set complete=.,w,b,u

"superTab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

"Complete Options
set completeopt-=longest
set completeopt+=menuone
set completeopt-=menu
if &completeopt !~# 'noinsert\|noselect'
      set completeopt+=noselect
endif

"-------autorun------
autocmd FileType python map \r :w<cr>:exec "!py %"<cr>

"-------autocommands------
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
    autocmd FileType python nnoremap \f :0,$!yapf<CR>
augroup END
