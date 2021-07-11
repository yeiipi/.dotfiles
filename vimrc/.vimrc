let mapleader=" "

set clipboard=unnamed

syntax enable
filetype plugin on

set scrolloff=999

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set cursorline
highlight CursorLine ctermbg=0 guibg=lightgrey
set cursorcolumn
highlight CursorColumn ctermbg=0 guibg=lightgrey

set ignorecase
set smartcase

set nu
set relativenumber
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

"remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" ========| Go lang |======== "
Plug 'fatih/vim-go'

" ========| utilities |======== "
Plug 'SirVer/ultisnips'
Plug 'tweekmonster/gofmt.vim'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'

" ========| searching |======== "
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ========| files & directories |======== "
Plug 'scrooloose/nerdtree'

" ========| git |======== "
Plug 'idanarye/vim-merginal'
Plug 'tpope/vim-fugitive'

" ========| documentation |======== "
Plug 'vim-utils/vim-man'

" ========| theme |======== "
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'

" ========| LaTeX |======== "
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim'

" ========| autocompletar |======== "
Plug 'vim-scripts/AutoComplPop'
Plug 'Ternjs/tern_for_vim', { 'do' : 'npm install' }
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
set completeopt-=preview

" ========| other |======== "
Plug 'sotte/presenting.vim'

call plug#end()

colorscheme gruvbox
set background=dark

nnoremap <Leader>ps :Rg!<space>
nnoremap <C-f>c :Commits<CR>
nnoremap <C-f>g :GFiles<CR>
nnoremap <C-f>f :Files<CR>
nnoremap <Leader>pf :Files<CR>

nnoremap <leader>u :UndotreeShow<CR>

nnoremap <C-g> :NERDTreeToggle<CR>

nmap <leader>gp ::Git push<CR>
nmap <leader>gc ::Git commit<CR>
nmap <leader>gs :G<CR>
nmap <leader>gt :!git add -p <CR>
nmap <leader>gL :!git log <CR>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:ycm_filetype_blacklist = {
    \ 'tex' : 1
    \}

Plug 'lervag/vimtex'
    let g:tex_flavor='pdftex'
    let g:vimtex_view_general_viewer = 'okular'
    let g:vimtex_view_general_options= '--unique file:@pdf/#src:@line@tex'
    let g:vimtex_view_general_options_latexmk= '--unique'
    let g:vimtex_quickfix_open_on_warning = 0
    let g:vimtex_quickfix_mode = 2


Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none

" create figures "
autocmd FileType tex map <leader>ff :silent execute '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
" edit figures
autocmd FileType tex map <leader>f : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

"Save a file
nnoremap <leader>. : <CR>:w <CR>

"surfing between buffers
nnoremap <leader>0 : <CR>:bd<CR>
nnoremap <leader>1 : <CR>:b1<CR>
nnoremap <leader>2 : <CR>:b2<CR>
nnoremap <leader>3 : <CR>:b3<CR>
nnoremap <leader>4 : <CR>:b4<CR>
nnoremap <leader>5 : <CR>:b5<CR>
nnoremap <leader>6 : <CR>:b6<CR>
nnoremap <leader>7 : <CR>:b7<CR>
nnoremap <leader>8 : <CR>:b8<CR>
nnoremap <leader>9 : <CR>:b9<CR>

"reload actual file
nnoremap <leader>s : <CR>:source %<CR>

"surfing between screens
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"rezise screen
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" json one liner
nnoremap <C-j> v%k<CR>:%j<CR>$w

nmap <leader>, /<++><CR>vf>c

autocmd FileType python map <leader><leader> :!clear & python3 % <CR>
autocmd FileType python map <leader>b :!clear & black % <CR>

autocmd FileType tex map <leader><leader> \ll
" autocmd FileType tex map <leader><leader>  :!pdflatex % & clear<CR>
autocmd FileType tex map <leader>s :!deepin-screenshot &clear<CR>
"autocmd FileType tex map <leader><leader><leader> :!clear & python3 /home/jpi/Desktop/inkscape-shortcut-manager/main.py &<CR>

autocmd FileType r map <leader><leader> :!clear & Rscript % <CR>

autocmd FileType cpp map <leader><leader> :!clear & g++ -std=c++14 -Wall -Wextra -Werror % <CR>
autocmd FileType cpp map <leader><leader><leader> :!clear & ./a.out <CR>

autocmd FileType javascript map <leader><leader> :!clear & node % <CR>

autocmd FileType go map <leader><leader> :!clear & go run % <CR>
autocmd FileType go map <leader><leader><leader> :!clear & go run * <CR>
