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
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'morhetz/gruvbox'
Plugin 'haya14busa/incsearch.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

fu RunProgram()
	if &filetype ==# 'python'
		! python3 %
	elseif &filetype ==# 'javascript'
		! node %	
	elseif &filetype ==# 'c'
		! gcc %; ./a.out; rm a.out
	elseif &filetype ==# 'cpp'
		! gcc %; ./a.out; rm a.out
	else
		echom "un supported filetype"
	endif
endfu
fu GetTerm()
		terminal
		wincmd x
		res 60
endfu
fu GetCommitLog()
		wincmd h
		sp
		wincmd j
		GlLog
		q
		wincmd k
		res 60
		wincmd l
endfu
fu Get()
		call GetCommitLog()
		call GetTerm()
endfu

let NERDTreeShowHidden=1
let g:auto_save = 1
let g:ctrlp_show_hidden = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostics_signs = 1
let g:ycm_echo_current_diagnostic = 1
let g:airline_theme='gruvbox'

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on

set backspace=indent,eol,start " backspace over everything
set smartcase
set incsearch
set autowrite
set number 			"Displays line numbers
set autoindent
set smartindent
set tabstop=4
set nowrap
set hidden			"makes unsaved files hidden when a new file is open
set encoding=UTF-8
set wildmenu		"wildmenu and wildmode affect tab completion
set wildmode=list:longest,full
set mouse=n
colorscheme gruvbox
set background=dark " for the dark version

" Highlight Search Options
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Tab changing
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
" Window Changing
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <c-w>l
" Buffer List navigation from Practical Vim 2nd Edition p.85
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
" Shortcut for getting directory of active buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" NERDTree shortcuts
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
