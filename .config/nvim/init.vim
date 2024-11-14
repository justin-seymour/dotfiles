
set showmatch
set ignorecase
"set smartcase
set mouse=a
set nu rnu
set ts=4 sw=4
set expandtab

" Trying this out - show whitepspace
set list
" Maybe change listchars later

au BufEnter * set fo-=c fo-=r fo-=o

"Auto install plugins
if empty(glob(stdpath('data') . '/site/autoload/plug.vim'))
  silent execute '!curl -fLo'. stdpath('data') . '/site/autoload/plug.vim' . ' --create-dirs 
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

"Plugins here
Plug 'justin-seymour/vim-code-dark'
Plug 'NLKNguyen/papercolor-theme'
Plug 'cocopon/iceberg.vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/sonokai'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

"Testing plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-obsession'

call plug#end()

"FZF Window at bottom of screen
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1, 'border': 'none' } }

"COC mappings
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : "\<TAB>"
inoremap <silent><expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<S-TAB>"

" Need this to make coc nvim tab complete work
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Already on lightline
set noshowmode

"Fix splits
set splitbelow
set splitright

"Vimtex stuff
let g:tex_flavor = 'latex'
let maplocalleader = "\\" "Good enough?? It's convenient at least
let mapleader = "\<Space>"

" FZF stuff
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :Buffers<CR>

" Window stuff
" Remap because terminal is annoying
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Resize binds
nnoremap <A-=> :resize +2<CR>
nnoremap <A--> :resize -2<CR>
nnoremap <A-.> :vertical resize +5<CR>
nnoremap <A-,> :vertical resize -5<CR>

" QOL Binds
" Handy binds to move around with
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>

" Trying these out - inspired by tpope/unimpaired.vim
" Duplicate line
nnoremap ]a :t.<CR>

" Move line up/down
nnoremap <A-p> :move -2<CR>
nnoremap <A-n> :move +1<CR>

" Open netrc split
nnoremap ]e :Sexplore!<CR>
nnoremap [e :Sexplore<CR>
nnoremap ]E :Explore<CR>
nnoremap [E :Texplore<CR>

" Colours / Status bar
set background=dark
set termguicolors

colo sonokai

"Configure lightline
let g:lightline = {
  \ 'colorscheme': 'sonokai',
  \ 'component_function': {
  \     'spelling': 'GetSpell',
  \ }, }

let g:lightline.active = {
  \ 'left': [ [ 'mode', 'paste' ],
  \           [ 'spelling' ],
  \           [ 'readonly', 'filename', 'modified' ] ],
  \ 'right': [ [ 'bufnum' ],
  \            [ 'lineinfo' ],
  \            [ 'percent' ],
  \            [ 'filetype']
  \            ] } 

"Function to show if spell is on or off
function! GetSpell()
    return &spell ? 'SPELL' : ''
endfunction

let g:lightline.inactive = {
  \ 'left': [ [ 'filename' ] ],
  \ 'right': [ [ 'bufnum' ],
  \            [ 'lineinfo' ],
  \            [ 'percent' ],
  \            [ 'filetype' ] ] }

"Set language for spell
set spelllang=en_au

" Open terminal as split
function SplitTerm()
    execute "split term://bash"
endfunction
nnoremap <localleader>t :call SplitTerm()<CR>

"Use ripgrep if installed
if executable('rg')
    set grepprg=rg\ --hidden\ --vimgrep
endif
