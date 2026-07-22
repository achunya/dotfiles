" --- Basic Settings ---
set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=
set completeopt-=preview
set expandtab

" --- Cool Built-in Features ---
set termguicolors   
set cursorline     
set ignorecase    
set smartcase    
set splitbelow  
set splitright  
set scrolloff=8  
set updatetime=300  
set signcolumn=yes  

" --- Plugins ---
call plug#begin()

" File tree + icons
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-tree/nvim-web-devicons' 

" Colors
Plug 'ap/vim-css-color'
Plug 'rafi/awesome-vim-colorschemes'

" Status bar (Lualine)
Plug 'nvim-lualine/lualine.nvim'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Intellisense & Autocomplete (CoC)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" --- Theme ---
colorscheme iceberg 

" --- Keybindings ---
nnoremap <C-p> :PlugInstall<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-b> :NERDTreeToggle<CR>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-Left> <C-w>h
nnoremap <C-Right> <C-w>l

" --- Lualine & Treesitter Setup (Lua) ---
lua << EOF
require('lualine').setup {
  options = {
    theme = 'iceberg_dark', 
    section_separators = {'', ''},
    component_separators = {'', ''},
  }
}

require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
}
EOF

autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" --- CoC Tab Autocomplete Setup ---
" Tab: если меню открыто — подтвердить выбор (Confirm). Если нет — вставить табуляцию.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#confirm() :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" Shift-Tab: перемещение вниз по списку подсказок
inoremap <silent><expr> <S-TAB>
      \ coc#pum#visible() ? coc#pum#next(1) : "\<S-Tab>"

" Исправленная функция (добавлен '=' и убраны лишние пробелы)
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction
