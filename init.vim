"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

set number
set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'preservim/nerdtree'

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#python_path = 'python3'


Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'github/copilot.vim'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'rcarriga/nvim-notify'
Plug 'weizheheng/ror.nvim'
call plug#end()

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_show_hidden = 1

nnoremap <silent> <S-f> :GFiles<CR>
nnoremap <silent> <S-c> :Rg<CR>
nnoremap <silent> <expr> <F6> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
nnoremap <S-W> <C-W>
nnoremap <silent> <S-b> :Buffers<CR>

autocmd VimEnter * :Files

colorscheme catppuccin
