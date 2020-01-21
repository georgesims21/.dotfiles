" Set ',' as <leader> 
let mapleader = ","

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
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sainnhe/gruvbox-material'
Plugin 'scrooloose/nerdtree'
Plugin 'vimwiki/vimwiki'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets' 
"Plugin 'Shougo/neocomplete.vim' 
"Plugin 'rentalcustard/exuberant-ctags' 
"Plugin 'vim-syntastic/syntastic' 
Plugin 'Townk/vim-autoclose' 
Plugin 'scrooloose/nerdcommenter'

call vundle#end()
filetype plugin indent on 

" Latex-live-preview
"autocmd Filetype tex setl updatetime=1

" -------------------------
" BASICS
" -------------------------

" Used to open vim buffer (tabs) without needing to save on quit
set hidden

" Autosaves file when buffer is hidden
set autowriteall

" Theme used, -soft, -hard or none is available
colorscheme gruvbox-material-soft

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

" Allows for cursor to stay in middle of screen while scrolling.. doesn't
" function as hoped
" set scrolloff=10

" -------------------------
" PLUGIN MODS
" -------------------------

" before changing to MD
let g:vimwiki_list = [{'path': '~/', 'path_html': '~/vimwiki_html/'}]
"let g:vimwiki_list = [{ 'path': '~/',
"       \ 'syntax':'markdown', 'ext': '.md' }]
" leaves colorscheme and md snippets alone
"autocmd FileType vimwiki set ft=markdown

" Let Vim-wiki fold 
"let g:vimwiki_folding='expr'
" Let Vim-wiki use .md only within the wiki
"let g:vimwiki_global_ext = 0

" Assign ,p to preview markdown documents
"let g:livepreview_previewer = 'open -a okular'
"
" Enable auto-save on Vim startup
let g:auto_save = 1

" Theme for vim-airline bar
let g:airline_theme='base16'

" neocomplete autostart
let g:neocomplete#enable_at_startup = 1


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
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Refresh freshly edited .vimrc without exiting (must still :w) ,rv (,RefreshVim)
nnoremap <leader>rv :source $MYVIMRC<cr>

" To uppercase just written word 
inoremap <c-u> <esc>bgUawea

" To move to next buffer
nnoremap <leader>t :bn<CR>

" To move to previous buffer
nnoremap <leader>r :bp<CR>

" Move around split screens
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l
nnoremap <leader>k <c-w>k
nnoremap <leader>j <c-w>j

nnoremap <leader>n :NERDTreeToggle<CR>

nnoremap <expr> <Leader>z 0 == &scrolloff ? ':setlocal scrolloff=999<CR>' : ':setlocal scrolloff=0<CR>'


