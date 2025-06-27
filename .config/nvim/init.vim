"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      General Settings                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=UTF-8         " Set UTF8 as standard encoding and en_US as the standard language.
set nocompatible           " Disable vi compatible mode.
set hidden                 " Buffer option
set clipboard=unnamedplus  " Single clipboard for vim and outer space.
set ignorecase             " Case insensetive search.
filetype plugin on         " Sets different options for different filetypes.
let mapleader = "\<Space>" " Setting leader key.
set shellcmdflag=-ic       " Access aliases from vim shell (act as interactive calls).
set noswapfile             " Disable swap file.
set updatetime=300         " Default is 4000. For faster coc-nvim's CursorHold.

" Indentaion rules.
filetype plugin indent on
set tabstop=4     " Number of spaces to tab.
set shiftwidth=4  " Number of spaces inserted for indentation.
set expandtab     " Insert spaces when tab is pressed.
" set smarttab      " Inserts blanks according to rules.
" set smartindent   " Autoindenting when starting a new line.

" Fold rules.
set foldmethod=indent " Fold based on indentaion levels.
set foldlevel=999     " Do not fold by default.
set foldclose=all     " Automatically close after leaving (not used).

" Edit text even if in russian layout.
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Disable autocomment on next line.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufNewFile,BufRead *.mdx set filetype=markdown



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Plugins Declaration                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')

" Motions.
Plug 'tpope/vim-surround'                 " Surround motions.
Plug 'vim-scripts/ReplaceWithRegister'    " Replace motions.
" Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'tpope/vim-commentary'               " Comments motions.

" Text objects.
Plug 'kana/vim-textobj-user'              " Plugin to add objects.
Plug 'kana/vim-textobj-indent'            " Indent object.
Plug 'kana/vim-textobj-line'              " Line object.
Plug 'kana/vim-textobj-entire'            " Whole file object.
" Plug 'bps/vim-textobj-python'             " Python functions and classes objects.
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" Visual changes.
Plug 'preservim/nerdtree'                 " File browser.
Plug 'jistr/vim-nerdtree-tabs'            " Nerdtree tabs fixer.
Plug 'Xuyuanp/nerdtree-git-plugin'        " Git status flags for NERDTree
Plug 'vim-airline/vim-airline'            " Status line.
Plug 'junegunn/goyo.vim'                  " Zen mode.
Plug 'edkolev/tmuxline.vim'               " Make tmux look like airline.
Plug 'Yggdroot/indentLine'                " Indent line.
Plug 'tpope/vim-fugitive'                 " Git wrapper (used in airline).
Plug 'airblade/vim-gitgutter'         " Git diff in the sign column
" Plug 'taketwo/vim-ros'                    " ROS syntax highlight.
" Plug 'wfxr/minimap.vim'                   " Minimap.

" Color changes.
Plug 'ryanoasis/vim-devicons'             " Adding icons support (NerdTree).
Plug 'rafi/awesome-vim-colorschemes'      " Color schemes.
Plug 'tomasiser/vim-code-dark'            " VSCode dark theme.
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'mboughaba/i3config.vim'             " Syntax highlight for i3 config
" Plug 'TovarishFin/vim-solidity'           " Syntax highlight for Solitidity
Plug 'pangloss/vim-javascript'            " Syntax highlight and indentation for JavaScript
Plug 'leafgarland/typescript-vim'         " Syntax highlight for TypeScript
Plug 'maxmellon/vim-jsx-pretty'           " Syntax highlight for JSX
Plug 'aklt/plantuml-syntax'               " Syntax highlight for PlantUML
" Plug 'gko/vim-coloresque'                 " Highlight color text with it's color.

" Editing.
" Plug 'github/copilot.vim'                 " Suggestions.
Plug 'chrisbra/csv.vim'                   " csv editing.
Plug 'ojroques/vim-oscyank'               " Copy from ssh sessions.
" Plug 'ervandew/supertab'                  " Autocompletion on tab
Plug 'AndrewRadev/tagalong.vim'           " HTML tags editing.
Plug 'alvan/vim-closetag'                 " Automatically close HTML tags.
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Completions engine.
Plug 'pasky/claude.vim'                   " Claude copilo
" Plug 'puremourning/vimspector'            " Debugger.
" Plug 'rhysd/vim-clang-format'             " Prettier cpp.
" Plug 'davidhalter/jedi-vim'               " Python autocompletion.

" Cursor AI completions
" Plug 'yetone/avante.nvim', { 'do': 'make' }
" Plug 'nvim-tree/nvim-web-devicons'
" Plug 'stevearc/dressing.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'MunifTanjim/nui.nvim'
" Plug 'MeanderingProgrammer/render-markdown.nvim'
" Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'echasnovski/mini.nvim'  " If you use the mini.nvim suite
" Or use one of these instead of mini.nvim:
" Plug 'echasnovski/mini.icons'  " If you use standalone mini plugins
" Plug 'nvim-tree/nvim-web-devicons'  " If you prefer nvim-web-devicons


" Etc.
Plug 'kenn7/vim-arsync'                   " Sync files with remote.
Plug 'prabirshrestha/async.vim'           " arsync dependency
Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf' } " In case of conflicts with local fzf installation.
Plug 'junegunn/fzf.vim'                   " Fuzzy finder.
Plug 'tyru/open-browser.vim'              " Open browser. Required for weirongxu/plantuml-previewer.vim.
Plug 'weirongxu/plantuml-previewer.vim'   " Preview plantuml files.
Plug 'mpas/marp-nvim'                     " md to html
" Plug 'tpope/vim-obsession'                " Save session for tmux restoring.
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}       " Previewing md files.

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  Plugins Configuration                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimspector_enable_mappings = 'HUMAN'

let g:coc_global_extensions = ['coc-json', 'coc-pyright', 'coc-tsserver', '@yaegassy/coc-tailwindcss3', 'coc-prettier', 'coc-css', 'coc-sh', 'coc-sumneko-lua', 'coc-rust-analyzer', 'coc-clangd', '@yaegassy/coc-nginx', '@nomicfoundation/coc-solidity']
" 'coc-eslint',
let g:coc_user_config = {
\   'coc.source.around.enable': v:false,
\   'coc.preferences.formatOnSaveFiletypes': ["python", "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "json", "markdown", "html", "rust", "c", "cpp"],
\   "coc.preferences.willSaveHandlerTimeout": 2000,
\   'suggest.filetypeBlacklist': ['markdown'],
\   'languageserver': {
\       'dockerfile': {
\           'command': 'docker-langserver',
\           'filetypes': ['dockerfile'],
\           'args': ['--stdio']
\       },
\       'dockercompose': {
\           'command': "docker-compose-langserver",
\           'args': ['--stdio'],
\           'filetypes': ['dockercompose'],
\           'rootPatterns': [".git", ".env", "docker-compose.yml", "compose.yml"]
\       }
\   },
\   'python.formatting.provider': 'black',
\   "python.sortImports.path": "isort",
\   'pyright.organizeimports.provider': 'isort',
\   'prettier.proseWrap': 'never',
\   'clangd.fallbackFlags': ['-xc']
\ }
"\   'eslint.autoFixOnSave': v:true,


let g:copilot_filetypes = {
\ 'markdown': v:false,
\ }

" Filetypes for dockercompose language server
au FileType yaml if bufname("%") =~# "docker-compose.yml" | set ft=yaml.docker-compose | endif
au FileType yaml if bufname("%") =~# "compose.yml" | set ft=yaml.docker-compose | endif
let g:coc_filetype_map = {
\   'yaml.docker-compose': 'dockercompose',
\ }

autocmd CursorHold * silent call CocActionAsync('highlight')

" autocmd BufWritePre *.py silent! :call CocAction('runCommand', 'python.sortImports')

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.md'

let g:tagalong_additional_filetypes = ['javascript', 'typescript']

let g:minimap_highlight_search = 1

let g:indentLine_enabled = 0

let g:oscyank_term = 'default' " fix copy from tmux
let g:oscyank_silent = v:true  " do not show copy msg
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankRegister "' | endif

let g:mkdp_browser = 'brave' " specify browser for markdown preview page

let g:prettier#autoformat_require_pragma = 0 " do not require vim-prettier annotation to prettify

let NERDTreeShowHidden=1 " show hidden files NerdTree

let b:csv_arrange_align = 'l*' " csv.vim arrange columns to left.

autocmd BufNewFile,BufRead *.hql set syntax=sql " hightlight .hql same as .sql

let g:airline#extensions#tabline#enabled = 1               " enable tabline
let g:airline#extensions#tabline#formatter = 'unique_tail' " Display only filename.
let g:airline#extensions#tabline#enabled = 1               " enable airline tabline
let g:airline#extensions#tabline#show_close_button = 0     " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#tabs_label = ''           " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''        " can put text here like TABS to denote tabs (I clear it so nothing is shown)
let g:airline#extensions#tabline#show_tab_count = 0        " dont show tab numbers on the right
let g:airline#extensions#tabline#show_buffers = 0          " dont show buffers in the tabline
let g:airline#extensions#tabline#tab_min_count = 2         " minimum of 2 tabs needed to display the tabline
let g:airline#extensions#tabline#show_splits = 0           " disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_tab_nr = 0           " disable tab numbers
let g:airline#extensions#tabline#show_tab_type = 0         " disables the weird ornage arrow on the tabline
let g:airline#extensions#whitespace#enabled = 0            " disable trailing whitespace badge on the bottom left
" let g:airline#extensions#tabline#fnamemod = ':t'           " disable file paths in the tab
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.colnr = ' :'
let g:airline#extensions#branch#enabled = 0 " disable git for airline
" let g:airline_theme = 'catppuccin'

let g:claude_api_key = $CLAUDE_API_KEY


highlight AvanteCurrentDiff guibg=#2a2a3a
highlight AvanteIncomingDiff guibg=#2a3a2a

" Setup avante.nvim
" lua << EOF
" local avante = require('avante')
" avante.setup({
"   highlights = {
"     diff = {
"       current = "AvanteCurrentDiff",
"       incoming = "AvanteIncomingDiff",
"     },
"   },
" })

" require('render-markdown').setup({
"   file_types = { "markdown", "Avante" },
"   latex = { enabled = false }
" })

" require'nvim-treesitter.configs'.setup {
"   ensure_installed = { "markdown", "markdown_inline" },
"   highlight = {
"     enable = true,
"     disable = function(lang, buf)
"       return lang ~= "markdown" and lang ~= "markdown_inline"
"     end,
"     additional_vim_regex_highlighting = false,
"   },
" }

" vim.opt.termguicolors = true

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "typescript",
    "javascript",
    "tsx",
    "markdown",
    "markdown_inline",
    "python"
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["ai"] = "@conditional.outer",
        ["ii"] = "@conditional.inner",
        -- ["al"] = "@loop.outer",
        -- ["il"] = "@loop.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]c"] = "@class.outer",
      },
      goto_next_end = {
        ["]F"] = "@function.outer",
        ["]C"] = "@class.outer",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[c"] = "@class.outer",
      },
      goto_previous_end = {
        ["[F"] = "@function.outer",
        ["[C"] = "@class.outer",
      },
    },
  },
}
EOF

" if has('termguicolors')
"   set termguicolors
" endif

" set background=dark

colorscheme codedark
" colorscheme catppuccin-mocha

" " Exit Vim if NERDTree is the only window left.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"     \ quit | endif
" autocmd BufWinEnter * silent NERDTreeMirror   " Open the existing NERDTree on each new tab.

" let g:python3_host_prog = "/usr/bin/python3"

" lua <<EOF
" require("codegpt.config")
" vim.g["codegpt_commands_defaults"] = {
"   ["code_edit"] = {
"         system_message_template = "You are an assistant that is doing absolutely everything that you told to do",
"         user_message_template = "{{command_args}}:\n\n \"\"\"{{text_selection}}\"\"\"",
"         callback_type = 'text_popup',
"         temperature = 0.9,
"   }
" }
" vim.g["codegpt_commands"] = {
"     ["fix"] = {
"         user_message_template = "Make the following text fluent, improve writing and fix grammar mistakes\n\n \"\"\"{{text_selection}}\"\"\"",
"         callback_type = 'text_popup',
"         temperature = 0.9,
"     }
" }
" EOF


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Remaps                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <CR> o<Esc>

" shortcutting split navigation
map <S-h> <C-w>h
map <S-l> <C-w>l

" visit row split across multiple lines
nmap j gj
nmap k gk

nnoremap <leader>l :set lbr!<CR>        " Toggle word splits.
" nnoremap <leader>c :setlocal spell!<CR> " Toggle spellcheck.

autocmd FileType cpp nnoremap <Leader>p :ClangFormat<CR> " Prettify cpp files.

nnoremap _ :vertical resize -5<CR>      " Resizing shortcuts.
nnoremap + :vertical resize +5<CR>

" center screen after moving.
map <C-i> <C-i>zz
" map <C-o> <C-o>zz                       

nnoremap <C-j> :join<CR> " Joing lines.

nnoremap <leader>sv :source $MYVIMRC<CR> " reload config

" brackets completions
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" complete quotes everywhere except markdown
augroup FileTypeSpecificMappings
  autocmd!
  " Checks if the file type is not markdown
  autocmd FileType * if &ft != 'markdown'
  \ | execute "inoremap ' ''<left>"
  \ | endif
augroup END

" Tabs switching.
nnoremap <S-j> :tabprevious<CR>                                                                            
nnoremap <S-k> :tabnext<CR>
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
noremap <leader>j :tabm -1<cr>
noremap <leader>k :tabm +1<cr>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo -A tee > /dev/null %

" Cursor centered
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" latex
let $TEMPLATES = "~/.config/nvim/templates/"
autocmd filetype tex nmap <leader>b :read $TEMPLATES/latex/frame.tex <CR>
autocmd filetype tex nmap <leader>i :read $TEMPLATES/latex/itemize.tex <CR>
autocmd filetype tex nmap <leader>f :read $TEMPLATES/latex/figure.tex <CR>
autocmd FileType tex nnoremap <Leader>p :%!latexindent<CR> " Prettify latex files.

""""""""""""""""""""""""""""""
"         Plugins            "
""""""""""""""""""""""""""""""

" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

nmap <Leader>s :ARsyncUp<CR>

nnoremap <Leader>n <plug>NERDTreeTabsToggle<CR>

nnoremap <silent> <Leader>m :MinimapToggle<CR>


" Function to open file in existing tab if open, otherwise open in new tab
function! OpenFileInTab(files)
    " Ensure we have a list of files
    if type(a:files) == type('')
        let files = [a:files]
    else
        let files = a:files
    endif

    for file in files
        let filename = fnamemodify(file, ':p')
        let bufnr = bufnr(filename)
        if bufnr != -1 && buflisted(bufnr)
            " Buffer exists, now check if it's open in a tab
            let found = 0
            for tabnr in range(1, tabpagenr('$'))
                let buflist = tabpagebuflist(tabnr)
                if index(buflist, bufnr) != -1
                    " Found the buffer in tab tabnr
                    execute 'tabnext' tabnr
                    " Switch to window with the buffer
                    for winnr in range(1, tabpagewinnr(tabnr, '$'))
                        if tabpagebuflist(tabnr)[winnr - 1] == bufnr
                            execute winnr . 'wincmd w'
                            break
                        endif
                    endfor
                    let found = 1
                    break
                endif
            endfor
            if !found
                " Buffer is loaded but not displayed, open in new tab
                execute 'tabnew' fnameescape(filename)
            endif
        else
            " Buffer is not loaded, open file in new tab
            execute 'tabnew' fnameescape(filename)
        endif
    endfor
endfunction

" Function to open file(s) in current buffer
function! OpenFileInCurrentBuffer(files)
    " Ensure we have a list of files
    if type(a:files) == type('')
        let files = [a:files]
    else
        let files = a:files
    endif

    " Open the last selected file in the current buffer
    execute 'edit' fnameescape(files[-1])
    
    " Optionally, you can open multiple files in splits if desired
    " for file in files
    "     execute 'edit' fnameescape(file)
    " endfor
endfunction


" Set up custom actions for fzf
let g:fzf_action = {
    \ 'enter': function('OpenFileInTab'),
    \ 'ctrl-e': function('OpenFileInCurrentBuffer'),
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }


let $AG_OPTIONS = '--ignore *.lock --ignore package-lock.json --ignore yarn.lock --ignore Gemfile.lock'
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>a :Ag<CR>

nnoremap g[ [pfzz " Go to next function with python textobj plugin.
nnoremap g] ]pfzz " Go to previous function with python textobj plugin.

" choose suggestion on Enter
inoremap <silent><expr> <CR>
      \ pumvisible() ? coc#_select_confirm() :
      \ "<C-g>u<CR>"

nmap <silent> <Leader>i :call CocActionAsync('doHover')<CR>
nmap <silent> <Leader>d <Plug>(coc-definition)
nmap <silent> <Leader>D :call CocAction('jumpDefinition', 'tabe')<CR>
nmap <silent> <Leader>r <Plug>(coc-references)
nmap <silent> <Leader>t <Plug>(coc-type-definition)
nmap <silent> <Leader>qf <Plug>(coc-fix-current)
nmap <silent> <Leader>c <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gr <Plug>(coc-references)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> <Leader>t <Plug>(coc-format)
" nmap <silent> gt <Plug>(coc-format)
" nmap <leader>ac  <Plug>(coc-codeaction)
" inoremap <silent><expr> <c-space> coc#refresh()
lua vim.keymap.del('n', 'gri')
lua vim.keymap.del('n', 'gra')


" let g:jedi#completions_command = "<C-p>"
" let g:jedi#usages_command = "<leader>u"
" let g:SuperTabDefaultCompletionType = "context" " Trigger jedi vim completion
" let g:jedi#documentation_command = "<leader>q"
" let g:jedi#goto_stubs_command = "<leader>z"

" nnoremap <leader>a :%ArrangeColumn<CR>            " csv.vim arrange columns.
" nnoremap <leader>u :%UnArrangeColumn<CR>          " csv.vim arrange columns.
" nnoremap <leader>m :MarkdownPreview<CR>           " Toggle md preview.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Visuals                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


syntax on          " Syntax highlighting.
set number         " Display current line number.
set relativenumber " Display relative line number.

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

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

set scrolloff=2  " Keep lines before and after cursor when scrolling.
set mousescroll=ver:1,hor:6 " Change scroll speed from default ver:3

" JsonL syntax highlighting
augroup jsonl_syntax
  autocmd!
  autocmd BufNewFile,BufRead *.jsonl setlocal filetype=jsonl
  autocmd FileType jsonl call SetJSONLSyntax()
augroup END

function! SetJSONLSyntax()
  if !exists("main_syntax")
    if exists("b:current_syntax")
      finish
    endif
    let main_syntax = 'jsonl'
  endif
  runtime syntax/json.vim
  syntax clear jsonMissingCommaError
  syntax match   jsonMissingCommaError /\("\|\]\|\d\)\zs\_s\+\ze"/
  syntax match   jsonMissingCommaError /\(\]\|\}\)\_s\+\ze"/ "arrays/objects as values
  syntax match   jsonMissingCommaError /\(true\|false\)\_s\+\ze"/ "true/false as value
endfunction

" " Transparent background.
" highlight Normal     ctermbg=NONE guibg=NONE
" highlight LineNr     ctermbg=NONE guibg=NONE
" highlight SignColumn ctermbg=NONE guibg=NONE


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         Commands                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Execute make watch in current directory.
command Mw execute '!tmux new -d make watch'

" Kill tmux session which was created from make watch.
" command Kt execute '!pkill -f "tmux new"'
command Kt execute '!killall make'

" Open pdf in same folder with same name.
let $NAME = expand('%:r')
command Pdf execute "silent !zathura $NAME.pdf > /dev/null 2>&1 &"
command Comp execute "silent !pandoc $NAME.md -o $NAME.pdf"

" Save file even with no access.
command Ss execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

function! Synctex()
    " remove 'silent' for debugging
    execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
endfunction
nnoremap <C-enter> :call Synctex()<cr>

hi CocFloating ctermbg=238 guibg=#4e4e4e

function! CocClean() abort
  let g:extensions_to_clean = CocAction("loadedExtensions")
      \ ->filter({idx, extension -> extension !~ 'friendly-snippets'})
      \ ->filter({idx, extension -> index(g:coc_global_extensions, extension) == -1})
  if len(g:extensions_to_clean)
    exe 'CocUninstall' join(map(g:extensions_to_clean, {_, line -> split(line)[0]}))
  else
    echo 'Nothing to clean'
  endif
endfunction
command! -nargs=0 CocClean :call CocClean()
" hi CocMenuSel ctermbg=239 guibg=#4e4e4e
