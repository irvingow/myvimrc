let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>p p`]
"下面是为vundle插件的部分
set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'
"用来选中多个光标可以同时运动
Plugin 'terryma/vim-multiple-cursors'
"在两端加上,修改,删除匹配的括号"
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
"状态栏增强插件
Plugin 'bling/vim-airline'
"状态栏增强插件
Plugin 'Valloric/YouCompleteMe'
"自动补全括号插件
Plugin 'jiangmiao/auto-pairs'
"注释工具
Plugin 'scrooloose/nerdcommenter'
" 自动对齐格式插件
Plugin 'Chiel92/vim-autoformat'
" 有超多vim背景颜色的仓库
Plugin 'flazz/vim-colorschemes'
" 来自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
Plugin 'SingleCompile'
"自动补全剩下的括号
"Plugin 'AutoClose'
"Plugin 'L9'
" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
"Plugin 'git://git.wincent.com/command-t.git'
" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
""Plugin 'file:///home/gmarik/path/to/plugin'
" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
""Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
""Plugin 'ascenator/L9', {'name': 'newL9'}

" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
filetype plugin on
"
" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后

"下面是youcompleteme的部分
set runtimepath+=~/.vim/bundle/YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0							"关闭加载.ycm_extra_conf.py提示
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"             "回车即选中当前项
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>     "跳转到定义处
let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项
"YouCompleteMe结束

"下面是SingleCompile的部分
nmap <F5> :SCCompileAF -std=c++11<CR>
nmap <C-F5> :SCCompileRunAF -std=c++11<CR>
"end of SingleCompile

"下面是quickfix的快捷键和SingleCompile相关联
nmap <Leader>cn :cn<CR>
nmap <Leader>cp :cp<CR>
nmap <Leader>cw :cw<CR>
"end of quickfix

"下面是nerdcomment的部分
let g:NERDSPaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDelims_java = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
"end

"AutoFormat part
"F3一键对齐格式
noremap <F3> :Autoformat<CR>
let g:autoformat_verbosemode = 1
let g:formatdef_custom_cfamily = '"--sytle=ansi --pad-oper"'
let g:formatters_c = ['custom_cfamily']
let g:formatters_cpp = ['custom_cfamily']
"code will be formated upon saved
"au BufWrite * :Autoformat
"end of AutoFormat

"下面是vim-multiple-cursors部分
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
"end of vim-multiple-cursors

"下面是vim-colorschemes的部分
"colorscheme evening
"colorscheme desert
"colorscheme molokai
colorscheme deus
"colorscheme crunchbang
"colorscheme moonfly
"colorscheme eclipse
"end of vim-colorschemes



set background=dark
syntax enable
"set t_Co=256
"let g:solarized_termcolors = 256
"colorscheme solarized
"colorscheme molokai
"let g:rehash256 = 1
"let g:molokai_original = 1
"colorscheme phd
" 语法高亮
set syntax=on

"在处理未保存或者只读文件的时候，弹出确认
set confirm

"Tab键的宽度
set tabstop=4

"不要用空格代替制表符
set noexpandtab

"在行和段开始处使用制表符
set smarttab

"显示行号
set number

"历史记录数
set history=1000

"禁止生成临时文件
set nobackup
set noswapfile

"搜索忽略大小写
set ignorecase

"搜索逐字符高亮
set hlsearch
set incsearch

"行内替换
set gdefault


"总是显示状态栏
set laststatus=2
"显示光标当前位置
set ruler
"高亮显示当前行/列
set cursorline
set cursorcolumn

"设置显示字体
set guifont=Yahei\ Consolas\ Hybrid\ 11.5

"禁止折行
set nowrap

"自适应不同语言的智能缩进
filetype indent on
"设置编辑时制表符、格式化时制表符占用空格数
set tabstop=4
set shiftwidth=4
"把连续数量的空格视为一个制表符
set softtabstop=4

"设置插件Indent Guides
"随着vim自启动
let g:indent_guides_enable_on_vim_startup=1
"从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
"色块宽度
let g:indent_guides_size=1
"快捷键i开/关缩进可视化
:nmap <silent><Leader>i <Plug>IndentGuidesToggle

"基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
"启动vim时关闭折叠代码
set nofoldenable

"文本编码方式设置
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

"下面是将-映射为$,避免按下$的麻烦
:noremap - $
"下面是增加<F6>的功能,在选中一段代码之后按下F6可以自动为这段代码加上大括号
:noremap <F6> dO{}<Esc>i<CR><Esc>pgg=G``
"在窗口内移动
noremap <Leader>h  <C-w>h
noremap <C-k> <C-w>k
noremap <C-j> <C-w>j
noremap <Leader>l <C-w>l
