set enc=utf-8
set nocompatible
set backspace=indent,eol,start
set viminfo+=!
set hidden

call pathogen#infect()
syntax on
autocmd BufEnter * :syntax sync fromstart
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd QuickFixCmdPost *grep* cwindow

" Silence
set noeb vb t_vb=

if has('gui_running')
  colorscheme mustang-mod
  "colorscheme badwolf 
  if has("gui_gtk2")
    "set guifont=Inconsolata-dz\ for\ Powerline\ 9
    "set guifont=Liberation\ Mono\ for\ Powerline\ 9
    "set guifont=Consolas\ for\ Powerline\ 10
    "set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 9
    set guifont=Envy\ Code\ R\ for\ Powerline\ 10
  else
    set gfn=Consolas:h12
  endif
else
  set t_Co=256
  colorscheme jellybeans
endif

set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

filetype on
filetype plugin on

set ruler
set guioptions-=T
set completeopt-=preview
set gcr=a:blinkon0

set number
set cmdheight=2

set laststatus=2
set statusline=[%l,%c\ %P%M]\ %f\ %r%h%w 
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

set guitablabel=%N/\ %t\ %M

let g:Gitv_OpenHorizontal = 1
let g:easytags_auto_highlight = 0
let g:cssColorVimDoNotMessMyUpdatetime = 1
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:Powerline_symbols = 'fancy'

set list
set listchars=tab:▸\ ,eol:¬

set smarttab
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
inoremap <Silent> <Tab> <C-R>=(col('.') > (matchend(getline('.'), '^\s*') + 1))?'<C-V><C-V><Tab>':'<Tab>'<CR>

" Ruby
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2

" HTML, ERB
let html_no_rendering=1
autocmd FileType html setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd BufNewFile,BufRead *.rhtml setlocal ft=eruby

" JavaScript
let javascript_enable_domhtmlcss=1

" CoffeeScript
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" NERDTree-tabs
let g:nerdtree_tabs_open_on_gui_startup=0

" Key mappings
let mapleader = "\\"
map <leader>n :tabnew<CR>
map <leader>w :tabclose<CR>
map <leader>o :NERDTreeTabsToggle<CR>
map <leader>t :CtrlP<CR>
map <leader>a :Ack 

let i = 1
while i <= 9
  execute 'nnoremap <leader>' . i . ' ' . i . 'gt'
  let i = i + 1
endwhile
