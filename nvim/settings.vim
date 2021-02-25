syntax on

set tabstop=4 softtabstop=4 "set tab-width to 4
set shiftwidth=4 "set width of >> to 4
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set foldmethod=indent "set to fold by indents
set nofoldenable "do not fold by default
set noshowmode "do not show mode on bottom (not needed bc of airline)
set mouse=a
set autoread
set list
set listchars=tab:\|\ ,trail:¤ "highlight trailing characters and add indicator for tabs

"draw a grey bar after 80 characters
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

"highlight line when in insert mode
augroup HLineInsert
  autocmd!
  autocmd InsertEnter * set cul
  autocmd InsertLeave * set nocul
augroup END