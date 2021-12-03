set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent on
filetype indent on

call plug#begin()


Plug 'https://github.com/sainnhe/sonokai'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/glepnir/indent-guides.nvim'
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

Plug 'https://github.com/tpope/vim-surround'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

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
set ignorecase
set smartcase

set tabstop=4
set shiftwidth=0

set indentexpr
set autoindent

set viewoptions-=options
setlocal foldmethod=indent
set nofoldenable
set foldlevel=99
set fillchars=fold:\ "The backslash escapes a space
set foldtext=CustomFoldText()
function! CustomFoldText()
    let indentation = indent(v:foldstart - 1)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let expansionString = repeat(" ", indentation)
    return expansionString . foldLevelStr . foldSizeStr
endfunction
augroup remember_folds
    autocmd!
    autocmd VimLeave * mkview
    autocmd BufWinEnter * silent! loadview
    autocmd BufWinEnter * silent! 0
augroup END

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p


" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o




nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
