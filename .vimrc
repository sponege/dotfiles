set nocompatible
filetype off

packloadall

call plug#begin()
" For Github, just author/repo

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-prettier']
" Prettify files on save
let g:coc_user_config = {
\ 'coc.preferences': {
  \ 'formatOnSaveFiletypes': ['*']
  \ }
\ }

" File Tree
Plug 'preservim/nerdtree'
" Sexy Bottom Bar
Plug 'itchyny/lightline.vim'
" Rainbow-colored Parenthesis
Plug 'kien/rainbow_parentheses.vim'
" Sublime Text Theme
Plug 'ErichDonGubler/vim-sublime-monokai'
" Formatting
Plug 'pangloss/vim-javascript'
" Discord Rich Presence
Plug 'vimsence/vimsence'
let g:vimsence_client_id = '439476230543245312'
let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Working on: {}'
let g:vimsence_file_explorer_text = 'In NERDTree'
let g:vimsence_file_explorer_details = 'Looking for files'
" let g:vimsence_custom_icons = {'filetype': 'iconname'}

" Prettify Code
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" Plug 'neoclide/coc.nvim'
" Plug 'ayu-theme/ayu-vim'
" Plug 'dense-analysis/ale'

Plug 'editorconfig/editorconfig-vim'
call plug#end()
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
inoremap {<CR> {<CR>}<C-c>O
inoremap [<CR> [<CR>]<C-c>O
inoremap (<CR> (<CR>)<C-c>O

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
