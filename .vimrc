execute pathogen#infect()
" useful plugins: 

set number

set t_Co=256
colorscheme desert
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=darkcyan
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_color_change_percent = 10
" let g:indent_guides_guide_size=1
 
syntax on

filetype plugin on

" Autoindent
set autoindent

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" " Don't redraw while executing macros (good performance config)
" set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

set expandtab
set tabstop=2

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
set shiftwidth=2
