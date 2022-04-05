set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" For Github, just author/repo

" Editor Changes
Plugin 'preservim/nerdtree'
Plugin 'itchyny/lightline.vim'
" Plugin 'neoclide/coc.nvim'
Plugin 'kien/rainbow_parentheses.vim'
" Plugin 'ayu-theme/ayu-vim'
Plugin 'ErichDonGubler/vim-sublime-monokai'
" Formatting
Plugin 'pangloss/vim-javascript'

" Plugin 'dense-analysis/ale'
Plugin 'editorconfig/editorconfig-vim'
call vundle#end()
filetype plugin indent on

" Enable Themeing
syntax on
colorscheme sublimemonokai

" syntax enable
" set termguicolors
" let ayucolor="dark" " mirage looks cool too
" colorscheme ayu 
" set number

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Lightline setup
set laststatus=2
set noshowmode
let g:lightline = {
	\ 'colorscheme': 'wombat'
	\ }

" RainbowParenthesesToggle
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" NERDTree
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


" auto-expansion
" https://www.reddit.com/r/vim/comments/6h0dy7/which_autoclosing_plugin_do_you_use/
inoremap (; (<CR>);<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap {<CR> {<CR>}<C-c>O
inoremap [; [<CR>];<C-c>O
inoremap [, [<CR>],<C-c>O

" easily switch from insert mode to normal mode by jkjlkjasdflkjasldkjf-ing
" https://stackoverflow.com/questions/9221769/whats-the-meaning-of-inoremap-in-vimrc
inoremap jk <ESC>
inoremap jj <Esc>

filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" vim:fdm=marker

" Editor basics {{{
" Behave like Vim instead of Vi
set nocompatible

" Show a status line
set laststatus=2

" Show the current cursor position
set ruler

" Enable syntax highlighting
syn on
" }}}
" Mouse {{{
" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2
" }}}
