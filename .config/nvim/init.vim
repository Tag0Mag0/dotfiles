call plug#begin('~/.local/share/nvim/plugged')
  " Utilities
  Plug 'tpope/vim-repeat'

  " Status line
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'https://github.com/scrooloose/nerdtree'

  " Git
  Plug 'airblade/vim-gitgutter'

  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-git'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-haml'
  Plug 'slim-template/vim-slim'
  Plug 'digitaltoad/vim-pug'
  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-rbenv'
  Plug 'tpope/vim-bundler'
  Plug 'rainerborene/vim-reek'

  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'elixir-editors/vim-elixir'
  Plug 'slashmili/alchemist.vim'

  " Alignment
  Plug 'junegunn/vim-easy-align'

  " Keymappings
  "https://github.com/tpope/vim-unimpaired/blob/master/doc/unimpaired.txt"
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-rsi'

  " Motions
  Plug 'jeetsukumaran/vim-indentwise'

  " Text formatting
  Plug 'tpope/vim-surround'
  Plug 'terryma/vim-multiple-cursors'

  " Comments
  Plug 'tpope/vim-commentary'

  " File navigation
  Plug 'justinmk/vim-dirvish'
  Plug 'pbrisbin/vim-mkdir'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  Plug 'mileszs/ack.vim'

  Plug 'flazz/vim-colorschemes'

  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

let g:deoplete#enable_at_startup = 1

set ttyfast
set directory=~/tmp
set foldmethod=manual
set showcmd
set virtualedit=block
" Basics Settings {{{
scriptencoding utf-8
set encoding=utf-8

let NERDTreeShowHidden=1

filetype indent plugin on

" System clipboard
set clipboard+=unnamedplus

set number
set nowrap

let s:grep_available=0

set autoindent smartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set signcolumn=yes
colorscheme 256-grayvim

" Airline {{{
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_grayscale'
let g:vim_markdown_fenced_languages=['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'rb=ruby']
" }}}

if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  tnoremap <Esc><Esc> <C-\><C-n>
endif

set rtp+=/usr/local/opt/fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

augroup basics_autocmd
	au!
	autocmd FileType ruby set tags=.tags.ruby,.tags.gem,gem.tags,gems.tags,tags;/
	autocmd FileType javascript set tags=.tags.jsx,tags
	autocmd FileType markdown,vim setlocal textwidth=80
	autocmd FileType java,go,hs set autoindent smartindent tabstop=4 shiftwidth=4  noexpandtab
  autocmd BufWritePre *.rb,*.js :%s/ \+$//ge

	" open search results immediately
	autocmd QuickFixCmdPost *grep* cwindow
	autocmd VimResized * let &previewheight=(winheight(0) * 1/3)
augroup END

nnoremap <Space> <Nop>
let mapleader=" "

inoremap <C-@> <C-n>
inoremap kj <ESC>
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
map <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>tt :Tagbar<CR>
nnoremap <Leader>ta :TagbarOpenAutoClose<CR>
nnoremap <Leader><Space> <C-d>
noremap <silent> <Leader>ff :FZF<CR>
noremap <silent> <Leader>b :Buffers<CR>
noremap <silent> <f5> :set paste!<CR>
nnoremap <C-]> g<C-]>
nnoremap <C-w><C-w> <C-w><C-p>
nnoremap <C-w>\ :vertical resize 80<CR>
command! FZFMru call fzf#run({'source': v:oldfiles, 'sink': 'e', 'options': '-m -x +s', 'down': '40%'})
let g:ackprg = 'ag --nogroup --nocolor --column'
map <Leader>a :Ack<Space>

set wildmode=longest,list:longest
set wildignore+=tmp/ios,tmp/android,app/assets/images,public/assets,vendor/assets,bin/classes
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=tags
set wildignore+=*/tmp/*
set wildignore+=*/vendor/*
set wildignore+=*.class
set wildignore+=*/node_modules/*
set wildignore+=*/*.min.js*
set wildignore+=*/bower_components

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
