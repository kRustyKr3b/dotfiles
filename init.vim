filetype plugin on
set more number modifiable incsearch cursorline showmatch ignorecase smartcase smartindent termguicolors 
set pastetoggle=<F11>
set shiftwidth=4
set softtabstop=4
set tabstop=4 
set undodir=~/.config/nvim/undodir
set undofile

"let &t_8f = "\e[38;2;%lu;%lu;%lum"
"let &t_8b = "\e[38;2;%lu;%lu;%lum"

let mapleader="\<Space>"
nmap <silent> <leader>r "=nr2char(getchar())<cr>P
nmap <leader>p :Glow<CR>
map j gj
map k gk
map <leader>y "+Y
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
nnoremap <M-,> <C-W>5<
nnoremap <M-.> <C-W>5>
nnoremap <M--> <C-W>5-
nnoremap <M-=> <C-W>5+


call plug#begin('/home/shaolinrus/.local/share/nvim/site/autoload')
	Plug 'Valloric/YouCompleteMe'
	Plug 'itchyny/lightline.vim'
	Plug 'preservim/nerdtree'
	Plug 'mboughaba/i3config.vim'
	Plug 'justmao945/vim-clang'
	Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
	Plug 'npxbr/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'}

	Plug 'navarasu/onedark.nvim'
	Plug 'dylanaraps/wal.vim'
	Plug 'whatyouhide/vim-gotham'
	Plug 'w0ng/vim-hybrid'
	Plug 'NLKNguyen/papercolor-theme'

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
	let g:onedark_style = 'darker'
	
	colorscheme gotham256
