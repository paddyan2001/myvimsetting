" =========================================
" 环境设置
" =========================================
silent function! OSX()
    return has('macunix')
endfunction
silent function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! WINDOWS()
    return  (has('win32') || has('win64'))
endfunction
if !WINDOWS()
    cd ~/code
    set guifont=\12
endif
if WINDOWS()
    "默认工作文件夹
    cd d:/code
    "设置字体
    set guifont=Consolas:h11
endif
" 自动切换到文件当前目录
set autochdir
" =========================================
" pathogen设置
" =========================================
execute pathogen#infect()
" =========================================
" jedi-vim设置
" =========================================
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<leader>v"
let g:jedi#rename_command = "<leader>r"
autocmd FileType python setlocal completeopt-=preview
let g:jedi#show_call_signatures = "0"
" =========================================
" vim-indent-guides设置
" =========================================
""let g:indent_guides_guide_size = 2
let g:indent_guides_enable_on_vim_startup = 1
"==========================================
" General Settings 基础设置
"==========================================
"界面设置
if has("gui_running") 
    set guioptions-=m   " 关闭菜单栏
    set guioptions-=T    " 关闭工具栏
    set guioptions-=l   " 关闭左边滚动条
    set guioptions-=L   " 关闭垂直分隔窗口左边滚动条
    set guioptions-=r   " 关闭右边滚动条
    set guioptions-=R   " 关闭垂直分隔窗口右边滚动条
endif
" 开启语法高亮
syntax on
" history存储容量
set history=500
" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on
" 文件修改之后自动载入
set autoread
" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI
" 取消备份。 视情况自己改
set nobackup
" 关闭交换文件
set noswapfile
" 启用鼠标
set mouse=a
" Hide the mouse cursor while typing
set mousehide
" 去掉输入错误的提示声音
set novisualbell
set noerrorbells
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=h,l
" 显示当前的行号列号
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode
" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=5
" 状态栏设置
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2
" 显示行号
set number
" 取消换行
set nowrap
" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch
" 设置文内智能搜索提示
" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase
" 代码折叠
set foldenable
" 缩进配置
" Smart indent
set smartindent
" 打开自动缩进
set autoindent
" tab相关变更
" 设置Tab键的宽度        [等同的空格个数]
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround
" Automatically write a file when leaving a modified buffer
set autowrite     
"==========================================
" FileEncode Settings 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8
" Use Unix as the standard file type
set ffs=unix,dos,mac
" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B
"==========================================
" others 其它设置
"==========================================
" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu
" 增强模式中的命令行自动完成操作
set wildmenu
" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"==========================================
" HotKey Settings  自定义快捷键设置
"==========================================
" 主要按键重定义
"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

inoremap <leader>\ <Esc>
inoremap ;; <Esc>

" F1 - F6 设置
nnoremap <F1> <Esc>
inoremap <F1> <Esc>
" F3 显示可打印字符开关
nnoremap <F3> :set list! list?<CR>
" F4 换行开关
nnoremap <F4> :set wrap! wrap?<CR>
" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

" Go to home and end using capitalized directions
noremap H ^
noremap L $

" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"插入模式下定义退格键
inoremap <C-BS> <C-w>
inoremap <S-BS> <C-u>

"插入模式下定义删除键
inoremap <S-Del> <Esc><right>d$

"插入模式下定义回车键
inoremap <S-CR> <Esc>o
inoremap <C-CR> <Esc>o<BS>

" 搜索相关
map <space> /

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" tab/buffer相关

" 切换前后buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
" 使用方向键切换激活窗口
noremap <C-left> <C-w>h
noremap <C-right> <C-w>l
noremap <C-up> <C-w>k
noremap <C-down> <C-w>j

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()

" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

" 滚动Speed up scrolling of the viewport slightly
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>



" Quickly close the current window
nnoremap <leader>q :q!<CR>
nnoremap Q :q<CR>
nnoremap q :w<CR>

" 交换 ' `, 使得可以快速使用'跳到marked位置
"nnoremap ' `
"nnoremap ` '

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" 保存python文件时删除多余空格
function <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

"==========================================
" Theme Settings  主题设置
"==========================================

" theme主题
"colorscheme onedark
"colorscheme jellybeans
"colorscheme desert
colorscheme molokai
"设置标记一列的背景颜色和数字一行颜色一致
"hi! link SignColumn   LineNr
"hi! link ShowMarksHLl DiffAdd
"hi! link ShowMarksHLu DiffChange
"
"" for error highlight，防止错误整行标红导致看不清
"highlight clear SpellBad
"highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
"highlight clear SpellCap
"highlight SpellCap term=underline cterm=underline
"highlight clear SpellRare
"highlight SpellRare term=underline cterm=underline
"highlight clear SpellLocal
"highlight SpellLocal term=underline cterm=underline
"
"
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"==========================================
"括号补全
"==========================================
" 插入匹配括号
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
"设置跳出自动补全的括号
function SkipPair()  
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'  
        return "\<ESC>la"  
    else  
        return ")"  
    endif  
endfunction
" 将右括号绑定为跳出括号  
inoremap ) <c-r>=SkipPair()<CR>

"==========================================
"" 代码折叠
"==========================================
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键 <leader>z
let g:FoldMethod = 0
map <leader>z :call ToggleFold()<cr>
function ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfunction

"==========================================
"切换tab
"==========================================
" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

"全选 select all
map <Leader>sa ggVG

"==========================================
"自动运行
"==========================================
map <F5> :call CompileRunGcc()<CR>
function CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "! python %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!chrome %.html &"
    endif
endfunction
"==========================================
"自动格式化设置 autopepe8
"==========================================
let g:autopep8_disable_show_diff=1
