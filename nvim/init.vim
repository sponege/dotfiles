" first off holy fuck we need an easy way to escape terminal windows
" lets use ctrl+L
tnoremap <silent> <C-l> <C-\><C-n>

" lets also move around arrows with alt+<arrow keys>
tnoremap <A-Left> <C-\><C-N><C-w>h
tnoremap <A-Down> <C-\><C-N><C-w>j
tnoremap <A-Up> <C-\><C-N><C-w>k
tnoremap <A-Right> <C-\><C-N><C-w>l
inoremap <A-Left> <C-\><C-N><C-w>h
inoremap <A-Down> <C-\><C-N><C-w>j
inoremap <A-Up> <C-\><C-N><C-w>k
inoremap <A-Right> <C-\><C-N><C-w>l
nnoremap <A-Left> <C-w>h
nnoremap <A-Down> <C-w>j
nnoremap <A-Up> <C-w>k
nnoremap <A-Right> <C-w>l 

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

" Vim-Plug, install from github and then run :PlugInstall
call plug#begin()
" For Github, just author/repo

" Copilot!
Plug 'github/copilot.vim'

" Prettier (in a sense)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-prettier', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-pairs']
" Prettify files on save
let g:coc_user_config = {
\ 'coc.preferences': {
  \ 'formatOnSaveFiletypes': ['*']
  \ }
\ }

" File Tree
Plug 'preservim/nerdtree'
" this first one isnt useful to me but it might be to you
nnoremap <silent> <leader>n :NERDTreeFocus<CR>
" ctrl+n to toggle nerd tree, ctrl+f to open current file path in nerd tree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :NERDTreeFind<CR>

" Sexy Bottom Bar
Plug 'itchyny/lightline.vim'

" Rainbow-colored Parenthesis
Plug 'kien/rainbow_parentheses.vim'

" Sublime Text Theme
Plug 'ErichDonGubler/vim-sublime-monokai'

" Formatting
Plug 'pangloss/vim-javascript'
" Discord Rich Presence
Plug 'andweeb/presence.nvim'
" Prettify Code
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

Plug 'ayu-theme/ayu-vim'
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

filetype plugin indent on

" Enable Themeing
syntax on
colorscheme sublimemonokai

" syntax enable
set notermguicolors
let ayucolor="dark" " mirage looks cool too
colorscheme ayu 

let g:scheme = 'ayu'

function! ToggleTheme()
	if &termguicolors
		if g:scheme == 'ayu'
			let g:scheme = 'sublimemonokai'
			colorscheme sublimemonokai
		else
			let g:scheme = 'ayu'
			colorscheme ayu
			set notermguicolors
		endif
	else
		set termguicolors
	endif
endfunction

nnoremap <silent> <C-s> :call ToggleTheme()<CR>
nnoremap <silent> <C-d> :call ToggleTheme()<CR>

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

" easily switch from insert mode to normal mode by jkjlkjasdflkjasldkjf-ing
" https://stackoverflow.com/questions/9221769/whats-the-meaning-of-inoremap-in-vimrc
" keyboard mashing is fun and easier than reaching to the escape key
inoremap fj <ESC>
inoremap jf <Esc>

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

" Set the cursor shape to a line in insert mode.
" this is for vim backwards capability

" insert mode
let &t_SI = "\e[5 q"
" everywhere else
let &t_EI = "\e[2 q"

" message for myself :)
" echo "Welcome, sponege."
