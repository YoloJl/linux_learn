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
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'Yggdroot/indentLine'
Plugin 'Valloric/YouCompleteMe'
Plugin 'octol/vim-cpp-enhanced-highlight'
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


"""""""""""""""syntastic"""""""""""""""""""
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='►'

let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0


"""""""""" vim-powerline"""""""""""""""""""
set laststatus=2 
set t_Co=256
let g:Powerline_symbols='unicode'

let python_highlight_all = 1


" 配色
colorscheme molokai


" 基本设置
set nu
set autoindent
set hlsearch
set tabstop=4
set shiftwidth=4
set ruler
set ignorecase



" 折叠
set foldenable  
set foldlevel=99
set foldmethod=syntax

set encoding=utf-8  
set fileencoding=utf-8  
set fileencodings=utf-8,gbk,gb2312,big58


" 文件设置
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.go exec ":call SetTitle()"
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

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
" 去空行
nnoremap <F2> :g/^\s*$/d<CR>
" 比较文件
nnoremap <C-F2> :vert diffsplit

" 新建标签
map <M-F2> :tabnew<CR>
" 打开树状文件目录
nnoremap <silent> <F4> :NERDTree<CR>


" C，C++ 按F8调试

map <F8> :call Rungdb()<CR>

func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc


" C, C++ 按F5编译 F6运行

map <F5> :call CompileCode()<CR>
map <F6> :call RunResult()<CR>

func! CompileGcc()
	exec "w"
	let compilecmd="!gcc "
	let compileflag="-o %< "
	if search("mpi\.h") != 0
		let compilecmd = "!mpicc "
	endif
	if search("glut\.h") != 0
		let compileflag .= " -lglut -lGLU -lGL "
	 endif
	if search("cv\.h") != 0
		let compileflag .= " -lcv -lhighgui -lcvaux "
	endif
	if search("omp\.h") != 0
		let compileflag .= " -fopenmp "
    endif
	if search("math\.h") != 0
		let compileflag .= " -lm "
	endif
	exec compilecmd." % ".compileflag
endfunc

func! CompileGpp()
	exec "w"
	let compilecmd="!g++ -std=c++11"
	let compileflag="-o %< "
	if search("mpi\.h") != 0
		let compilecmd = "!mpic++ "
	endif
	if search("glut\.h") != 0
		let compileflag .= " -lglut -lGLU -lGL "
	endif
	if search("cv\.h") != 0
		let compileflag .= " -lcv -lhighgui -lcvaux "
	endif
	if search("omp\.h") != 0
		let compileflag .= " -fopenmp "
	endif
	if search("math\.h") != 0
		let compileflag .= " -lm "
	endif
	exec compilecmd." % ".compileflag
endfunc

func! RunPython()
	exec "!python333333333333333333333333333333333 %"
endfunc

func! CompileJava()
	exec "!javac %"
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
	endif
endfunc

func! RunResult()
	exec "w"
	if search("mpi\.h") != 0
		exec "!mpirun -np 4 ./%<"
	elseif &filetype == "cpp"
		exec "! ./%<"
	elseif &filetype == "c"
		exec "! ./%<"
	elseif &filetype == "python"
		exec "call RunPython"
	elseif &filetype == "java"
		exec "!java %<"
	endif
endfunc


