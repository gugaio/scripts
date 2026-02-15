"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

set number
set nocompatible
filetype off


call plug#begin('~/.config/nvim/plugged')
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'preservim/nerdtree'


Plug 'vim-airline/vim-airline'
Plug 'nvim-lua/plenary.nvim' " Dependência obrigatória
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'github/copilot.vim'
Plug 'rcarriga/nvim-notify'
Plug 'stevearc/oil.nvim'
Plug 'mfussenegger/nvim-lint'

Plug 'neovim/nvim-lspconfig'           " Configurações básicas do LSP
Plug 'williamboman/mason.nvim'          " Instalador de servidores
Plug 'williamboman/mason-lspconfig.nvim' " Ponte entre os dois
Plug 'hrsh7th/nvim-cmp'                 " Engine de autocompletar
Plug 'hrsh7th/cmp-nvim-lsp'             " Fonte do LSP para o nvim-cmp
Plug 'hrsh7th/cmp-buffer'       " Fonte de palavras do buffer atual
Plug 'hrsh7th/cmp-path'         " Fonte para caminhos de arquivos
Plug 'L3MON4D3/LuaSnip'         " Engine de Snippets (obrigatório para o cmp)
Plug 'saadparwaiz1/cmp_luasnip' " Fonte de snippets para o nvim-cmp
call plug#end()

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_show_hidden = 1

nnoremap <silent> <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> <cmd>Telescope find_files<cr>
nnoremap <C-s> <cmd>Telescope live_grep<cr>
nnoremap <C-b> <cmd>Telescope buffers<cr>

" Lista funções, variáveis e métodos do arquivo atual
nnoremap <silent> <leader>fs <cmd>Telescope lsp_document_symbols<cr>

lua require('config')
autocmd VimEnter * Telescope find_files

colorscheme catppuccin