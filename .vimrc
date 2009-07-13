set enc=utf-8
set nocompatible
set backspace=indent,eol,start
set viminfo+=!
set hidden

syntax on
autocmd BufEnter * :syntax sync fromstart

colorscheme ir_black 
set guifont="Monaco:h9"
set gfn=Monaco\ 9

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

" git-branch-info.vim 
set statusline+=%{GitBranchInfoString()}
let g:git_branch_status_head_current=1 
let g:git_branch_status_nogit="" 
let g:git_branch_status_text=""

set smarttab
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
inoremap <Silent> <Tab> <C-R>=(col('.') > (matchend(getline('.'), '^\s*') + 1))?'<C-V><C-V><Tab>':'<Tab>'<CR>

" Ruby
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2

" HTML, ERB
let html_no_rendering=1
autocmd BufNewFile,BufRead *.rhtml setlocal ft=eruby

" JavaScript
let javascript_enable_domhtmlcss=1

" Key mappings
map <F11> :NERDTreeToggle<CR>
map <F5> :bp<CR>
map <F6> :bn<CR>
map <F7> :bd<CR>:syntax on<CR>
