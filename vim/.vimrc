let mapleader = ","
set t_Co=256

"  -------------------------
" PLUGINS
" -------------------------

" :PluginInstall to install plugins, append ! to update
" :PluginClean to delete unused plugins, asks approval first
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/vundle/Vundle.vim
call vundle#begin()
" Alternatively, pass a path where Vundleshould intall plugins:
" call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'sainnhe/gruvbox-material'
Plugin 'rakr/vim-one'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'rhysd/vim-llvm'
Plugin 'vim-syntastic/syntastic' 
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Townk/vim-autoclose' 
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()
filetype plugin indent on 

" -------------------------
" BASICS
" -------------------------

" Used to open vim buffer (tabs) without needing to save on quit
set hidden

" Autosaves file when buffer is hidden
set autowriteall

" Theme used, -soft, -hard or none is available
"colorscheme gruvbox-material

" Line numbers + numbers relative to the current line
set number relativenumber

" Syntax highlighting
syntax on

" Folding
set foldmethod=marker

" Don't shoe --insert--
set noshowmode

" Highlight cursor line
set cursorline

" ** Indentation rules **
" Replace tabs by whitespace
set expandtab
" Set tab length
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

" Show vertical bar at 80 column width
set colorcolumn=80

" Bracket/parantheses matching
" set highlight MatchParen ctermbg=blue huibg=lightblue

" -------------------------
" PLUGIN MODS
" -------------------------

" --- vim-auto-save ---
let g:auto_save = 1

" --- vim-airline-themes ---
let g:airline_theme='deus'

" --- neocomplete --- 
let g:neocomplete#enable_at_startup = 1

" --- cpp-enhanced-highlight ---
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1

" --- gruvbox-material theme ---
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_improved_strings=1
let g:gruvbox_number_column='orange'

" --- ultisnips --- https://jdhao.github.io/2019/01/15/markdown_edit_preview_nvim/
" use <Tab> trigger autocompletion
let g:UltiSnipsExpandTrigger="<tab>"  
let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<C-K>"

" --- vim-markdown --- https://jdhao.github.io/2019/01/15/markdown_edit_preview_nvim/
" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format


" --- vim-wiki --- 
"let g:vimwiki_list = [{'path': '$HOME/github/README.md',
                      "\ 'syntax': 'markdown', 'ext': '.md'}]

" -------------------------
" CURSOR CONTROL
" -------------------------
" https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
" Cursor settings:

"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[6 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" -------------------------
" REMAPPING
" -------------------------

" Disable arrow keys in all modes
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>

" Allows to edit .vimrc from any other document using ,ev (,EditVim)
nnoremap <Leader>v :e $HOME/.vimrc<cr>
" Refresh freshly edited .vimrc without exiting (must still :w) ,rv (,RefreshVim)
nnoremap <Leader>r :source $HOME/.vimrc<cr>

" To move to next buffer
nnoremap <Leader>m :bn<CR>
" To move to previous buffer
nnoremap <Leader>n :bp<CR>
" To quit current buffer
nnoremap <Leader>d :bd<CR>

" Move around split screens
nnoremap <Leader>h <c-w>h
nnoremap <Leader>l <c-w>l
nnoremap <Leader>k <c-w>k
nnoremap <Leader>j <c-w>j

" Toggle NERDTREE
nnoremap <Leader>t :NERDTreeToggle<CR>

" Folding toggle
nnoremap <Leader>k za
