set nocompatible              " be iMproved, required
filetype off                  " required


call plug#begin()


Plug 'https://github.com/sainnhe/sonokai'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/glepnir/indent-guides.nvim'
Plug 'https://github.com/seandewar/nvimesweeper'
Plug 'https://github.com/ThePrimeagen/vim-apm'
Plug 'https://github.com/karb94/neoscroll.nvim'
Plug 'https://github.com/dstein64/nvim-scrollview'
Plug 'https://github.com/tjdevries/train.nvim'
Plug 'https://github.com/jbyuki/instant.nvim'
Plug 'mbbill/undotree'

Plug 'https://github.com/preservim/nerdtree'

Plug 'https://github.com/elzr/vim-json'
Plug 'jiangmiao/auto-pairs'
Plug 'davidhalter/jedi-vim'
Plug 'hdima/python-syntax'
Plug 'vim-scripts/c.vim'

call plug#end()

" Important!!
if has('termguicolors')
	set termguicolors
endif

" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'atlantis'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai


syntax on
set number
autocmd BufNewFile *.cpp 0r ~/.vim/templates/temp.cpp
autocmd BufNewFile *.mk 0r ~/.vim/templates/temp.mk
set showmode
set backspace=indent,eol,start

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p


" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif



nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
