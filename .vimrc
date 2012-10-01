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
  au GUIEnter * set lines=50 columns=120
  colorscheme molokai
  if has("gui_gtk2")
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 9
  else
    set gfn=Menlo:h12
    colorscheme Tomorrow
  endif
else
  set t_Co=256

  " Solarized setup
  set background=light
  colorscheme solarized
  let g:Powerline_theme="skwp"
  let g:Powerline_colorscheme="skwp"
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

" NERDTree-tabs
let g:nerdtree_tabs_open_on_gui_startup=0

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
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4

" CoffeeScript
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Rainbow parentheses
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
map <leader>r :RainbowParenthesesToggle<CR>

" Key mappings
let mapleader = "\\"
map <leader>n :tabnew<CR>
map <leader>w :tabclose<CR>
map <leader>o :NERDTreeTabsToggle<CR>
map <leader>t :CtrlP<CR>
map <leader>a :Ack
map <leader>b :TagbarToggle<CR>

let i = 1
while i <= 9
  execute 'nnoremap <leader>' . i . ' ' . i . 'gt'
  let i = i + 1
endwhile

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

fun! v:remaps()
  if !(has("mac") && has("gui_running"))
    " Unmap Waldo and PeepOpen toggles
    nnoremap <leader>f <nop>
    nnoremap <leader>p <nop>
  endif
endfunction

autocmd BufEnter * call v:remaps()

" fish work-around
set shell=/usr/local/bin/bash
