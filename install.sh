#!/bin/sh
set -x
# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# installing node for ubuntu
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# arch
# pacman -S nodejs npm

mkdir -p ~/.config/nvim
cat << EOF >> ~/.config/nvim/init.vim
call plug#begin()
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-rooter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-syntastic/syntastic'
call plug#end()

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

try
  colorscheme gruvbox
catch
endtry
set background=dark

nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-references)
nnoremap <C-p> :GFiles<CR>

set relativenumber number
"saddistic mode
set backspace=""
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

nnoremap <SPACE> " "

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set termguicolors

set listchars=eol:¬,tab:>█,trail:─,extends:»,precedes:«,space:·
set list

" set syntastic configs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" set syntastic configs

set tabstop=8
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set cindent
"stop indenting when pasting with the mouse
set pastetoggle=<F5>
EOF

# alias -s vim=nvim
alias vim=nvim
echo "alias vim=nvim" >> ~/.bashrc
echo "alias vim=nvim" >> ~/.zshrc
vim -c ":PlugInstall"

