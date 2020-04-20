"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=UTF-8        " Set UTF8 as standard encoding and en_US as the standard language.
set nocompatible          " Disable vi compatible mode.
set hidden                " Buffer option
filetype plugin on        " Sets different options for different filetypes.
set clipboard=unnamedplus " Single clipboard for vim and outer space.
set ignorecase            " Case insensetive search.

" Edit text even if in russian layout.
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Motions.
Plug 'tpope/vim-surround'                 " Surround motions.
Plug 'vim-scripts/ReplaceWithRegister'    " Replace motions.
Plug 'tpope/vim-commentary'               " Comments motions.

" Text objects.
Plug 'kana/vim-textobj-user'              " Plugin to add objects.
Plug 'kana/vim-textobj-indent'            " Indent object.
Plug 'kana/vim-textobj-line'              " Line object.
Plug 'kana/vim-textobj-entire'            " Whole file object.
Plug 'bps/vim-textobj-python'             " Python functions and classes objects.

" Visual changes.
Plug 'preservim/nerdtree'                 " File browser.
Plug 'vim-airline/vim-airline'            " Status line.
Plug 'junegunn/goyo.vim'                  " Zen mode.

" Color changes.
Plug 'ryanoasis/vim-devicons'             " Adding icons support (NerdTree).
Plug 'gko/vim-coloresque'                 " Highlight color text with it's color.
Plug 'mboughaba/i3config.vim'             " Coloring i3 config.

" Editing.
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }   " Prettifying web files.

call plug#end()

" Plugins settings.
let g:prettier#autoformat_require_pragma = 0  " Do not require vim-prettier annotation to prettify.
let NERDTreeShowHidden=1                      " Show hidden files NerdTree.
" Close NerdTree when it's only window left.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif  

" Plugin remaps.
nmap <leader>n :NERDTreeToggle<CR>            " Toggle NerdTree.
nmap g[ [pfzz                                 " Go to next function with python textobj plugin.
nmap g] ]pfzz                                 " Go to previous function with python textobj plugin.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remaps.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Remaps in normal mode.
nmap j gj
nmap k gk
nmap <CR> o<Esc>

" Remaps in insert mode.
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on   " Syntax highlighting.
set relativenumber " Display relative line number.

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow
set splitright

" Hints when entering commands.
set wildmenu                       
set wildmode=list:longest,full

" Changing cursor mode when entering insert mode.
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>" " Setting leader key.

" Disable autocomment on next line.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Indentaion rules.
set expandtab     " Insert spaces when tab is pressed.
set tabstop=4     " Number of spaces to tab.
set shiftwidth=4  " Number of spaces inserted for indentation.
set smarttab      " Inserts blanks according to rules.
set smartindent   " Autoindenting when starting a new line.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML shortcuts.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd filetype html inoremap ,b <b></b><space><++><esc>fbt>i
autocmd filetype html inoremap ,it <em></em><space><++><esc>fet>i
autocmd filetype html inoremap ,1 <h1></h1><enter><enter><++><esc>2kf<i
autocmd filetype html inoremap ,2 <h2></h2><enter><enter><++><esc>2kf<i
autocmd filetype html inoremap ,3 <h3></h3><enter><enter><++><esc>2kf<i
autocmd filetype html inoremap ,p <p></p><enter><enter><++><esc>02kf>a
autocmd filetype html inoremap ,a <a<space>href=""><++></a><space><++><esc>14hi
autocmd filetype html inoremap ,e <a<space>target="_blank"<space>href=""><++></a><space><++><esc>14hi
autocmd filetype html inoremap ,ul <ul><enter><li></li><enter></ul><enter><enter><++><esc>03kf<i
autocmd filetype html inoremap ,li <esc>o<li></li><esc>f>a
autocmd filetype html inoremap ,ol <ol><enter><li></li><enter></ol><enter><enter><++><esc>03kf<i
autocmd filetype html inoremap ,im <img src="" alt="<++>"><++><esc>fcf"a
autocmd filetype html inoremap ,td <td></td><++><esc>fdcit
autocmd filetype html inoremap ,tr <tr></tr><enter><++><esc>kf<i
autocmd filetype html inoremap ,th <th></th><++><esc>fhcit
autocmd filetype html inoremap ,tab <table><enter></table><esc>o
autocmd FileType html inoremap ,gr <font color="green"></font><Esc>F>a
autocmd FileType html inoremap ,rd <font color="red"></font><Esc>F>a
autocmd FileType html inoremap ,yl <font color="yellow"></font><Esc>F>a
autocmd FileType html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
autocmd FileType html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
autocmd FileType html inoremap ,di <div class=""><Enter><Enter></div><enter><enter><++><esc>3kcc
