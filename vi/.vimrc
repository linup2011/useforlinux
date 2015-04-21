
"设置<leader>
let mapleader=";"
"开启文件类型监测
filetype on
"根据监测到的不同类型加载对应的插件
filetype plugin on

"定义快捷键到行首和行尾
nmap <Leader>b ^
nmap <Leader>e $
"设置快捷键将选中文本块复制到系统剪贴版
vnoremap <Leader>y "+y
"将剪贴版内容粘贴至vim
nmap <Leader>p "+p
"关闭当前分割窗口
nmap <Leader>q :q<CR>
"保存当前窗口
nmap <Leader>w :w<CR>
"保存并退出
nmap <Leader>WQ :wa<CR>:q<CR>
"直接退出
nmap <Leader>Q :qa!<CR>
"一次遍历子窗口
nnoremap <Leader>nw <C-W><C-W>
"跳转至右方窗口
"nnoremap <Leader>lw <C-W>l
"nnoremap <Leader>hw <C-W>h
"nnoremap <Leader>jw <C-W>j
"nnoremap <Leader>kw <C-W>k

nmap <Leader>pa %

"开启实时搜索
set incsearch
set ic
set nocompatible
"vim自身命令行智能补全
set wildmenu

runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

"配色方案
set background=dark
"colorscheme solarized
"colorscheme molokai
colorscheme phd

"禁止光标闪烁
set gcr=a:block-blinkon0

set laststatus=2
"set ruler
set cursorline
"set cursorcolumn
set hlsearch

set guifont=YaHei\ Consolas\ Hybrid\ 11.5
"禁止折行
set nowrap
"设置状态栏风格
let g:Powerline_colorscheme='solarized256'

syntax enable
syntax on

filetype indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"缩进显示,plug:https://github.com/nathanaelkane/vim-indent-guides 
"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_start_level=1
"let g:indent_guides_guide_size=1
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
"折叠za打开和关闭折叠 zM关闭所有折叠zR打开所有折叠
set foldmethod=indent
set foldmethod=syntax
set nofoldenable

"正向遍历同名标签
nmap <Leader>tn :tnext<CR>
nmap <Leader>tp :tprevious<CR>

"使用indexer自动生成ctags
let g:indexer_ctagsCommandLineOptions="-R --c-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c"

"标签列表https://github.com/majutsushi/tagbar
" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=1 
" 设置显示／隐藏标签列表子窗口的快捷键。速记：tag list 
nnoremap <Leader>tl :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 设置 ctags 对哪些代码元素生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
        \ 'd:macros:1',
        \ 'g:enums',
        \ 't:typedefs:0:0',
        \ 'e:enumerators:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:global:0:0',
        \ 'x:external:0:0',
        \ 'l:local:0:0'
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

nnoremap <Leader>sp :CtrlSF<CR>
nnoremap <Leader>co :CtrlSFOpen<CR>

"set the space red
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
