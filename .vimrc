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
""""""""""通用配置""""""""""
"使用git命令"
Plugin 'tpope/vim-fugitive'
"括号补全"
Plugin 'Raimondi/delimitMate'
"显示对齐线"
Plugin 'Yggdroot/indentLine'
"自动补全"
Plugin 'Valloric/YouCompleteMe'
"配色"
Plugin 'fatih/molokai'
""""""""""C/C++配置""""""""""
"Ctags使用"
" Plugin 'szw/vim-tags'
Plugin 'taglist.vim'
"语法检查"
Plugin 'scrooloose/syntastic'
"C++高亮"
Plugin 'octol/vim-cpp-enhanced-highlight'

"go语言配置"
Plugin 'fatih/vim-go'

Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'SirVer/ultisnips'
Plugin 'majutsushi/tagbar'
"GoDecls GoDeclsDir
Plugin 'ctrlpvim/ctrlp.vim'

"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
" Git plugin not hosted on GitHub

Plugin 'git://github.com/Lokaltog/vim-powerline.git'
Plugin 'git://github.com/scrooloose/nerdtree.git'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'git://github.com/hdima/python-syntax'

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

"""""""""""""""syntastic"""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

let g:syntastic_auto_jump = 1

let g:syntastic_cpp_checkers=['gcc']
let g:syntastic_cpp_compiler='g++'
let g:syntastic_cpp_compiler_options='-std=c++11'

let g:syntastic_python_checkers = ['python3']


"""""""""" vim-powerline"""""""""""""""""""
set laststatus=2 
set t_Co=256
let g:Powerline_symbols='unicode'

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
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.go,*.py exec ":call SetTitle()"
func SetTitle()
	if &filetype == 'sh'
		call setline(1,"\#########################################################################")
		call append(line("."), "\# File Name: ".expand("%")) 
		call append(line(".")+1, "\# Author: pengzhi") 
		call append(line(".")+2, "\# mail: pengzhipxz@qq.com") 
		call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "\#########################################################################") 
		call append(line(".")+5, "\#!/bin/bash")
	else
		call setline(1,"\/************************************************************************")
		call append(line("."), "\* File Name: ".expand("%")) 
		call append(line(".")+1, "\* Author: pengzhi") 
		call append(line(".")+2, "\* mail: pengzhipxz@qq.com") 
		call append(line(".")+3, "\* Created Time: ".strftime("%c")) 
		call append(line(".")+4, "\************************************************************************/") 
	call append(line(".")+5, "")
	endif

	autocmd BufNewFile * normal G
endfunc


"""""""""""""" 键盘命令""""""""""""""""""""
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G

" 去空行
nnoremap <F2> :g/^\s*$/d<CR>
" 比较文件
nnoremap <C-F2> :vert diffsplit

" 打开树状文件目录
nnoremap <silent> <F4> :NERDTree<CR>

" C, C++ 按F5编译 F6运行
map <F5> :call CompileCode()<CR>
map <F6> :call RunResult()<CR>

func! CompileGcc()
	exec "w"
	let compilecmd="!gcc "
	let compileflag="-g -o %< "
	exec compilecmd." % ".compileflag
endfunc

func! CompileGpp()
	exec "w"
	let compilecmd="!g++ -std=c++11"
	let compileflag="-g -o %< "
	exec compilecmd." % ".compileflag
endfunc

func! RunPython()
	exec "!python3 %"
endfunc

func! CompileJava()
	exec "!javac %"
endfunc

func! CompileGo()
	exec "!go build %"
endfunc

func! CompileCode()
	exec "w"
	if &filetype == "cpp"
		exec "call CompileGpp()"
	elseif &filetype == "c"
		exec "call CompileGcc()"
	elseif &filetype == "python"
		exec "call RunPython()"
	elseif &filetype == "java"
		exec "call CompileJava()"
	elseif &filetype == "go"
		exec "call CompileGo()"
	endif
endfunc

func! RunResult()
	exec "w"
	if &filetype == "cpp"
		exec "! ./%<"
	elseif &filetype == "c"
		exec "! ./%<"
	elseif &filetype == "python"
		exec "call RunPython()"
	elseif &filetype == "java"
		exec "!java %<"
	elseif &filetype == "go"
		exec "! ./%<"
	endif
endfunc

""""""""ctags and Taglist""""""""""""  
let Tlist_WinWidth=34  
let Tlist_Auto_Open=0  
" let Tlist_Show_One_File=1  
let Tlist_Exit_OnlyWindow=1  
let Tlist_Use_SingleClick=1  
let Tlist_Use_Right_Window=1  
let Tlist_File_Fold_Auto_Close=1  
let Tlist_Auto_Update=1

nmap <F3> :Tlist<CR>

""""""""lookup manpage"""""""""""""""
runtime! ftplugin/man.vim
nmap <C-K> :Man 2 <cword><CR>
nmap <C-L> :Man 3 <cword><CR>

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
let g:go_metalinter_autosave = 1
