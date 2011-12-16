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

colorscheme solarized
set background=light

" Silence
set noeb vb t_vb=

if has('gui_running')
    colorscheme jellybeans
    set gfn=Inconsolata-dz:h12
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

let g:Gitv_OpenHorizontal = 1

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
autocmd BufNewFile,BufRead *.rhtml setlocal ft=eruby

" JavaScript
let javascript_enable_domhtmlcss=1

" CoffeeScript
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" Key mappings
let mapleader = ","
map <leader>n :tabnew<CR>
map <leader>w :tabclose<CR>
map <leader>t :FuzzyFinderTextMate<CR>
map <leader>a :Ack 

let i = 1
while i <= 9
  execute 'nnoremap <leader>' . i . ' ' . i . 'gt'
  let i = i + 1
endwhile
