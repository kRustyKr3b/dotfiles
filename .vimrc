syntax on
filetype plugin on
set tabstop=4 
set softtabstop=4
set smartindent
set number 
set incsearch
set shiftwidth=4
set showmatch
set smartcase
set modifiable
set pastetoggle=<F11>
set termguicolors
set nocompatible
set wildmenu
set background=dark
set cursorline
set more
set encoding=utf-8


execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"

"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"

let mapleader="\<Space>"
nmap <silent> <leader>r "=nr2char(getchar())<cr>P
map j gj
map k gk
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>v :wincmd v<CR>
nnoremap <leader>s :split<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf


call plug#begin('/home/rus_og/.vim/autoload')
	Plug 'itchyny/lightline.vim'
	Plug 'preservim/nerdtree'
	Plug 'justmao945/vim-clang'
	Plug 'dylanaraps/wal.vim'
	Plug 'mboughaba/i3config.vim'
	Plug 'Valloric/YouCompleteMe'
	Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

call plug#end()

aug i3config_ft_detection
	au!
    au BufNewFile,BufRead /home/shaolinrus/.config/i3/config setfiletype i3config
aug end

    set laststatus=2
    let NERDTreeShowHidden=1
	let g:Hexokinase_highlighters = ['backgroundfull']
	let g:Hexokinase_refreshEvents = ['TextChanged', 'InsertLeave', 'BufRead']
	let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla,colour_names'
	colorscheme one

