" =========================================
" pathogen����
" =========================================
execute pathogen#infect()
" =========================================
" jedi-vim����
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
" vim-indent-guides����
" =========================================
""let g:indent_guides_guide_size = 2
let g:indent_guides_enable_on_vim_startup = 1
"==========================================
" General Settings ��������
"==========================================
"Ĭ�Ϲ����ļ���
cd d:/code
"��������
set guioptions-=m   " �رղ˵���
set guioptions-=T    " �رչ�����
"set guioptions-=l   " �ر���߹�����
"set guioptions-=L   " �رմ�ֱ�ָ�������߹�����
"set guioptions-=r   " �ر��ұ߹�����
"set guioptions-=R   " �رմ�ֱ�ָ������ұ߹�����
" �����﷨����
syntax on
" history�洢����
set history=500
" ����ļ�����
filetype on
" ��Բ�ͬ���ļ����Ͳ��ò�ͬ��������ʽ
filetype indent on
" ������
filetype plugin on
" �����Զ���ȫ
filetype plugin indent on
" �ļ��޸�֮���Զ�����
set autoread
" ������ʱ����ʾ�Ǹ�Ԯ���ڸɴ��ͯ����ʾ
set shortmess=atI
" ȡ�����ݡ� ������Լ���
set nobackup
" �رս����ļ�
set noswapfile
" �������
set mouse=a
" Hide the mouse cursor while typing
set mousehide
" ȥ������������ʾ����
set novisualbell
set noerrorbells
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=h,l
" ��ʾ��ǰ���к��к�
set ruler
" ��״̬����ʾ�������������
set showcmd
" ���½���ʾ��ǰvimģʽ
set showmode
" �������ƶ����ʱ�������Ϸ����·����ٻᱣ����ʾ������
set scrolloff=5
" �����У���״̬���£��ĸ߶ȣ�Ĭ��Ϊ1��������2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=1
" ��ʾ�к�
set number
" ȡ������
set nowrap
" ����������, ��ת������һ��ƥ�������
set showmatch
" ������������������ʾ
" ����search���е��ı�
set hlsearch
" ����������ģʽ,���ż��뼴ʱ����
set incsearch
" ����ʱ���Դ�Сд
set ignorecase
" ��һ�������ϴ�д��ĸʱ�Դ�Сд����
set smartcase
" �����۵�
set foldenable
" ��������
" Smart indent
set smartindent
" ���Զ�����
set autoindent
" tab��ر��
" ����Tab���Ŀ��        [��ͬ�Ŀո����]
set tabstop=4
" ÿһ��������Ӧ�Ŀո���
set shiftwidth=4
" ���˸��ʱ����һ��ɾ�� 4 ���ո�
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop ���˸��ʱ����һ��ɾ�� 4 ���ո�
set smarttab
" ��Tab�Զ�ת���ɿո�[��Ҫ����������Tab��ʱ��ʹ�� Ctrl+V + Tab]
set expandtab
" ����ʱ��ȡ�� use multiple of shiftwidth when indenting with '<' and '>'
set shiftround
" Automatically write a file when leaving a modified buffer
set autowrite     
"==========================================
" FileEncode Settings �ļ�����,��ʽ
"==========================================
" �������ļ��ı���Ϊ UTF-8
set encoding=utf-8
" �Զ��жϱ���ʱ�����γ������±��룺
set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" �������ֻӰ����ͨģʽ (��ͼ�ν���) �µ� Vim
set termencoding=utf-8
" Use Unix as the standard file type
set ffs=unix,dos,mac
" ����Unicodeֵ����255���ı������صȵ��ո�������
set formatoptions+=m
" �ϲ���������ʱ�������м�ӿո�
set formatoptions+=B
"==========================================
" others ��������
"==========================================
" �Զ���ȫ����
" ��Vim�Ĳ�ȫ�˵���Ϊ��һ��IDEһ��(�ο�VimTip1228)
set completeopt=longest,menu
" ��ǿģʽ�е��������Զ���ɲ���
set wildmenu
" ���Զ���λ�����༭��λ��, ��Ҫȷ�� .viminfo ��ǰ�û���д
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"==========================================
" HotKey Settings  �Զ����ݼ�����
"==========================================
" ��Ҫ�����ض���
"Treat long lines as break lines (useful when moving around in them)
"se swap֮��ͬ����������ֱ����
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

inoremap <leader>\ <Esc>
inoremap ;; <Esc>

" F1 - F6 ����
nnoremap <F1> <Esc>
inoremap <F1> <Esc>
" F3 ��ʾ�ɴ�ӡ�ַ�����
nnoremap <F3> :set list! list?<CR>
" F4 ���п���
nnoremap <F4> :set wrap! wrap?<CR>
" F6 �﷨���أ��ر��﷨���Լӿ���ļ���չʾ
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

" Go to home and end using capitalized directions
noremap H ^
noremap L $

" Map ; to : and save a million keystrokes ���ڿ��ٽ���������
nnoremap ; :

" ������ģʽ��ǿ��ctrl - a�����ף� -e ����β
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"����ģʽ�¶����˸��
inoremap <C-BS> <C-w>
inoremap <S-BS> <C-u>

"����ģʽ�¶���ɾ����
inoremap <S-Del> <Esc><right>d$

"����ģʽ�¶���س���
inoremap <S-CR> <Esc>o
inoremap <C-CR> <Esc>o<BS>

" �������
map <space> /

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" tab/buffer���

" �л�ǰ��buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
" ʹ�÷�����л������
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

" �½�tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

" ����Speed up scrolling of the viewport slightly
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>



" Quickly close the current window
nnoremap <leader>q :q!<CR>
nnoremap Q :q<CR>
nnoremap q :w<CR>

" ���� ' `, ʹ�ÿ��Կ���ʹ��'����markedλ��
"nnoremap ' `
"nnoremap ` '

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" ����python�ļ�ʱɾ������ո�
function <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

"==========================================
" Theme Settings  ��������
"==========================================
set guifont=Consolas:h11

" theme����
"colorscheme onedark
"colorscheme jellybeans
"colorscheme desert
colorscheme molokai
"���ñ��һ�еı�����ɫ������һ����ɫһ��
"hi! link SignColumn   LineNr
"hi! link ShowMarksHLl DiffAdd
"hi! link ShowMarksHLu DiffChange
"
"" for error highlight����ֹ�������б�쵼�¿�����
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
"����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"==========================================
"���Ų�ȫ
"==========================================
" ����ƥ������
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
"���������Զ���ȫ������
function SkipPair()  
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'  
        return "\<ESC>la"  
    else  
        return ")"  
    endif  
endfunction
" �������Ű�Ϊ��������  
inoremap ) <c-r>=SkipPair()<CR>

"==========================================
"" �����۵�
"==========================================
set foldenable
" �۵�����
" manual    �ֹ��۵�
" indent    ʹ��������ʾ�۵�
" expr      ʹ�ñ��ʽ�����۵�
" syntax    ʹ���﷨�����۵�
" diff      ��û�и��ĵ��ı������۵�
" marker    ʹ�ñ�ǽ����۵�, Ĭ�ϱ���� {{{ �� }}}
set foldmethod=indent
set foldlevel=99
" �����۵��Զ����ݼ� <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
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
"�л�tab
"==========================================
" normalģʽ���л���ȷ�е�tab
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

"ȫѡ select all
map <Leader>sa ggVG

"==========================================
"�Զ�����
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
"�Զ���ʽ������ autopepe8
"==========================================
let g:autopep8_disable_show_diff=1
