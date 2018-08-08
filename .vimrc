set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

""""""""""通用配置"""""""""""
"括号补全"
Plugin 'Raimondi/delimitMate'
"显示对齐线"
Plugin 'Yggdroot/indentLine'
"自动补全"
Plugin 'Valloric/YouCompleteMe'
"配色"
Plugin 'fatih/molokai'
"airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"""""""""""""""""""""""""""""
"syntastic
Plugin 'w0rp/ale'

"MarkDown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"toml json
Plugin 'cespare/vim-toml'
Plugin 'elzr/vim-json'
""""""""""""""""""""""""""""

""""""""""C/C++""""""""""
"Ctags使用"
" Plugin 'szw/vim-tags'
Plugin 'taglist.vim'
"C++高亮"
Plugin 'octol/vim-cpp-enhanced-highlight'
"""""""""""""""""""""""""""""

""""""""""golang"""""""""
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'SirVer/ultisnips'
"go tags
Plugin 'majutsushi/tagbar'
"GoDecls GoDeclsDir
Plugin 'ctrlpvim/ctrlp.vim'
"""""""""""""""""""""""""""""

""""""""""python"""""""""
Plugin 'python-mode/python-mode'
"""""""""""""""""""""""""

" Git plugin not hosted on GitHub
Plugin 'git://github.com/scrooloose/nerdtree.git'
Plugin 'git://git.wincent.com/command-t.git'

" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
" filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""YouCompleteMe""""""""""""""""
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

set completeopt=longest,menu  
let g:ycm_key_list_previous_completion=['<Down>']  
let g:ycm_key_list_previous_completion=['<Up>']  
let g:ycm_collect_identifiers_from_tags_files=1   
let g:ycm_min_num_of_chars_for_completion=2  
let g:ycm_seed_identifiers_with_syntax=1  
  
let g:ycm_complete_in_comments=1  
let g:ycm_complete_in_strings=1  
let g:ycm_collect_identifiers_from_comments_and_strings=0
let g:ycm_show_diagnostics_ui=0

let python_highlight_all = 1

" 配色
colorscheme molokai
let g:rehash256 = 1
let g:molokai_original = 1

" 基本设置
set nu
set autoindent
set hlsearch
set tabstop=4
set shiftwidth=4
set ruler
set ignorecase
set mouse=a
set history=50
" 突出显示当前列
set cursorcolumn
" 突出显示当前行
set cursorline
" 折叠
set foldenable  
set foldlevel=99
set foldmethod=syntax

set encoding=utf-8  
set fileencoding=utf-8  
set fileencodings=utf-8,gbk,gb2312,big58


" 文件设置
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.go exec ":call SetTitle()"
func SetTitle()
	if &filetype == 'sh'
		call setline(1, "\#!/bin/bash") 
	endif
	autocmd BufNewFile * normal G
endfunc


"""""""""""""" 键盘命令""""""""""""""""""""
" 映射全选+复制 ctrl+a
map <C-A> ggVGY
" 去空行
nnoremap <F2> :g/^\s*$/d<CR>
" 打开树状文件目录
nnoremap <silent> <F3> :NERDTree<CR>
" Tagbar
nnoremap <F4> :Tagbar<CR>

""""""""ctags and Taglist""""""""""""  
let Tlist_WinWidth=33 
let Tlist_Auto_Open=0 
" let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1 
let Tlist_Use_SingleClick=1 
let Tlist_Use_Right_Window=1 
let Tlist_File_Fold_Auto_Close=1 
let Tlist_Auto_Update=1

""""""""lookup manpage"""""""""""""""
"runtime! ftplugin/man.vim
"nmap <C-K> :Man 2 <cword><CR>
"nmap <C-L> :Man 3 <cword><CR>

"""""""""go tag""""""""""""""""""""""
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

""""""""vim-go"""""""""""""""""""""""
set autowrite
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_addtags_transform = "camelcase"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
set updatetime=100
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
let g:go_highlight_operators = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_trailing_whitespace_error = 1
map <F12> :GoDebugStart<CR>
map <C-F12> :GoDebugStop<CR>
map <C-S-F12> :GoDebugRestart<CR>
map <C-F10> :GoDebugStep<CR>
""""""""ale""""""""""""""""""""""""""
let g:ale_sign_column_always = 1
"
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['✗ %d', '⚠ %d', '✔ OK']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"
"let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
"
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1
let g:ale_list_window_size = 5
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\	'cpp': ['clang-format', 'remove_trailing_lines', 'trim_whitespace'],
\	'c': ['clang-format', 'remove_trailing_lines', 'trim_whitespace'],
\	'go': ['gofmt', 'goimports', 'remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'cpp': ['gcc'],
\   'c': ['gcc'],
\   'python': ['pylint'],
\	'go':['golint', 'gofmt', 'govet'],
\}
let g:airline#extensions#ale#enabled = 1

""""""""airline""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1

""""""""toml json""""""""""""""""""""
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

""""""""python mode""""""""""""""""""
let g:pymode_python = 'python3'
let g:pymode_lint = 0  " ALE
let g:pymode_folding = 0  " SimplyFold
let g:pymode_run = 0
let g:pymode_breakpoint = 0
let g:pymode_options = 0
let g:pymode_doc = 0
let g:pymode_rope = 0
let g:pymode_debug = 0
