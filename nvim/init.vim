set nocompatible
filetype on

" line numbers
set number

" no line numbers in terminals
au TermOpen * setlocal listchars= nonumber norelativenumber

" focus terminal
au TermOpen             *        startinsert
au BufWinEnter,WinEnter term://* startinsert

" unfocus search with comma space
nnoremap <silent> ,<space> :nohlsearch<CR>

" copy to system clipboard (use the y command :)
set clipboard^=unnamedplus

" failed idea for clipboard that didnt work feel free to remove :/
" nnoremap y "+y

" dont you just hate holding shift while writing a file
command W :w
command Q :q

packloadall

" BetterCursor
source ~/.config/nvim/better-cursor.vim

call plug#begin()
" For Github, just author/repo

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-prettier', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-python', 'coc-pairs']
" Prettify files on save
let g:coc_user_config = {
\ 'coc.preferences': {
  \ 'formatOnSaveFiletypes': ['*']
  \ }
\ }

" File Tree
" Plug 'preservim/nerdtree'
" Sexy Bottom Bar
Plug 'itchyny/lightline.vim'
" Rainbow-colored Parenthesis
Plug 'kien/rainbow_parentheses.vim'
" Sublime Text Theme
" Plug 'ErichDonGubler/vim-sublime-monokai'
" LennyPhoenix's Theme
Plug 'LennyPhoenix/sweet_dracula_vim', {'as': 'dracula-theme'}
hi! link  VertSplit DraculaCyan
" Formatting
Plug 'pangloss/vim-javascript'
" Discord Rich Presence
Plug 'andweeb/presence.nvim'
" Prettify Code
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" Plug 'neoclide/coc.nvim'
" Plug 'ayu-theme/ayu-vim'
" Plug 'dense-analysis/ale'

" Plug 'editorconfig/editorconfig-vim'
call plug#end()

" sponeges script to install coc extensions: turned out to be unneccesary :/

" function! ExtensionInstall()
"   for extension in g:coc_global_extensions
"     echo extension
"   endfor 
" endfunction

" command ExtensionInstall :call ExtensionInstall()

nnoremap <silent> ,<space>

filetype plugin indent on

" Enable Themeing
syntax on
" colorscheme sublimemonokai

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
" autocmd VimEnter * NERDTree | wincmd p
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"     \ quit | endif


" auto-expansion
" https://www.reddit.com/r/vim/comments/6h0dy7/which_autoclosing_plugin_do_you_use/
" inoremap {<CR> {<CR>}<C-c>O
" inoremap [<CR> [<CR>]<C-c>O
" inoremap (<CR> (<CR>)<C-c>O

" easily switch from insert mode to normal mode by jkjlkjasdflkjasldkjf-ing
" https://stackoverflow.com/questions/9221769/whats-the-meaning-of-inoremap-in-vimrc
inoremap jk <ESC>
inoremap jj <Esc>

filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
set shiftwidth=2
set softtabstop=2



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

" Custom cursor
"   au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
"   au InsertEnter,InsertChange *
"     \ if v:insertmode == 'i' |
"     \   silent execute '!echo -ne "\e[6 q"' | redraw! |
"     \ elseif v:insertmode == 'r' |
"     \   silent execute '!echo -ne "\e[4 q"' | redraw! |
"     \ endif
"   au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
" 0 -> blinking block.
" 1 -> blinking block (default).
" 2 -> steady block.
" 3 -> blinking underline.
" 4 -> steady underline.
" 5 -> blinking bar (xterm).
" 6 -> steady bar (xterm).

" insert mode
let &t_SI = "\e[5 q"
" everywhere else
let &t_EI = "\e[2 q"