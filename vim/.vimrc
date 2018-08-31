set nu
syntax on
set ts=4
set expandtab
set autoindent
set mouse=a
set shiftwidth=4
set smartindent
set backspace=2

" Disable backups and .swp files
set nobackup
set noswapfile
set splitright
set splitbelow

" Ignore case when searching
set ignorecase
set smartcase

" Set terminal window title
set title

set encoding=utf-8
set laststatus=2
let mapleader=","

" Vundle related configuration
set nocompatible              " be iMproved, required
filetype on                  " required
filetype plugin on 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe' " 自动完成
Plugin 'tell-k/vim-autopep8' " python pep8 标准检测
Plugin 'scrooloose/nerdtree' " 文件浏览
Plugin 'powerline/powerline' " 状态栏升级 new
"Plugin 'scrooloose/syntastic' " 代码静态语法检测
Plugin 'majutsushi/tagbar' " 符号表
Plugin 'SirVer/ultisnips' " 代码片段
Plugin 'honza/vim-snippets'  " 片段集合
Plugin 'Raimondi/delimitMate' " 括号自动匹配
Plugin 'scrooloose/nerdcommenter' " 注释
Plugin 'bling/vim-airline' " Powerful statusline
Plugin 'octol/vim-cpp-enhanced-highlight' " C++ 语法增强
Plugin 'derekwyatt/vim-fswitch' " 头文件和实现文件切换
Plugin 'easymotion/vim-easymotion' "快速移动
Plugin 'Chiel92/vim-autoformat' "autoformat"
Plugin 'rhysd/vim-clang-format'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'w0rp/ale'
 let g:ale_fix_on_save = 1
 let g:ale_completion_enabled = 1
 let g:ale_sign_column_always = 1
 let g:airline#extensions#ale#enabled = 1

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_strings=1
let g:ycm_python_binary_path='/usr/local/bin/python'
set completeopt=longest,menuone

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1

" mapping keys
nnoremap <leader>jd :YcmCompleter GoTo<CR>

map <F5> :Autopep8<CR> :w<CR> :call RunPython()<CR>
function RunPython()
      let mp = &makeprg
      let ef = &errorformat
      let exeFile = expand("%:t")
      setlocal makeprg=python\ -u
      set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
      silent make %
      copen
      let &makeprg = mp
      let &errorformat = ef
endfunction

" Powerline
set guifont=Inconsolata\ for\ Powerline:h12

set t_Co=256
let g:indentLine_enabled = 1
let g:autopep8_disable_show_diff = 1
let g:Powerline_symbols = 'fancy'

"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '\.pyo$', '\.o$', '\.svn$']
"窗口大小"
let NERDTreeWinSize=25

" delimitMate
" for python docstring 
au FileType python let b:delimitMat_nesting_quotes=['"']

" tagbar
nnoremap <F10> :TagbarToggle<CR>
let g:tagbar_width=35
let g:tagbar_autofocus = 1


" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1

" Syntastic
set statusline +=%#warningmsg#
set statusline +=%{SyntasticStatuslineFlag()}
set statusline +=%*
let g:syntastic_always_populate_loc_list=1

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ' '
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" cpp-enhanced
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1

" fswitch
nmap <slient> <Leader>sw :FSHere<cr>

" UltiSnips 与 Ycm的tab键冲突
let g:UltiSnipsExpandTrigger="<leader><tab>"

" clang format
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
nmap <Leader>cf :ClangFormat<cr>
