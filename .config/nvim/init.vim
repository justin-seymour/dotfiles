
set showmatch
set ignorecase
"set smartcase
set mouse=a
set nu rnu
set ts=4 sw=4
set expandtab

au BufEnter * set fo-=c fo-=r fo-=o

"Auto install plugins
if empty(glob('~/.local/share/nvim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.local/share/nvim/autoload/plug.vim --create-dirs 
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin()

"Plugins here
Plug 'justin-seymour/vim-code-dark'
Plug 'NLKNguyen/papercolor-theme'
Plug 'cocopon/iceberg.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

"FZF Window at bottom of screen
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1, 'border': 'none' } }

"COC mappings
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" remap for complete to use tab and <cr>
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1):
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

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

"Handy maps
nnoremap <leader>n :bnext <CR>
nnoremap <leader>p :bprev <CR>

nnoremap <leader>f :Files<CR>
nnoremap <leader>g :Buffers<CR>

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

" Keeping as backup
"nnoremap <leader>k :wincmd k<CR>
"nnoremap <leader>j :wincmd j<CR>
"nnoremap <leader>h :wincmd h<CR>
"nnoremap <leader>l :wincmd l<CR>
"nnoremap <leader>= :resize +2<CR>
"nnoremap <leader>- :resize -2<CR>
"nnoremap <leader>. :vertical resize +5<CR>
"nnoremap <leader>, :vertical resize -5<CR>

"set background=dark
colo iceberg

"Configure lightline
let g:lightline = {
  \ 'colorscheme': 'codedark',
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

"Functions
"Fairly rudimentary function to comment a line
function! CommentLine()
    execute "normal yypk0d^"
    let line = getline('.')
    execute "normal dd"

    if (&filetype == "c" || &filetype == "cpp" || &filetype == "java")
        if (strpart(line, 0, 2) == "//")
            execute "normal ^xx"
        else
            execute "normal ^i/\/\<ESC>"
        endif
    elseif (&filetype == "tex")
        if (strpart(line, 0, 1) == "%")
            execute "normal ^x"
        else
            execute "normal ^i%"
        endif
    elseif (&filetype == "vim")
        if (strpart(line, 0, 1) == "\"")
            execute "normal ^x"
        else
            execute "normal ^i\""
        endif
    endif
endfunction

"Bind functions
nnoremap <leader>; :call CommentLine()<CR>

