if v:version >= 800
  source $VIMRUNTIME/defaults.vim
endif
filetype plugin indent on
" Remap F1 to ESC in both modes because I commonly hit F1 by mistake,
" especialyl with some keyboard layouts
nmap <F1> <ESC>
imap <F1> <ESC>

" http://www.fritzmahnke.com/2013/03/12/use-vim-to-convert-mixed-tabs-and-4-space-indents-to-2-space-indentation/
function! TwoSpace()
  setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
  %retab! " Convert the 4 space indents to tabs
  setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  %retab  " Convert all tabs to 2 space indents
endfunction

function! FourSpace()
  setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
  %retab! " Convert the 2 space indents to tabs
  setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
  %retab  " Convert all tabs to 4 space indents
endfunction

" Disable compatiblity mode, sort of redundant
set nocompatible

" copy indent from previous line
set autoindent

" Allow switching between buffers without forcing a save
set hidden

" Tabs and spaces
set tabstop=2 " number of spaces the tab key inserts
set softtabstop=2 " DOCUMENT: I really don't understand this
set shiftwidth=2 " number of spaces for indent
set expandtab " insert spaces instead of tabs
set smarttab " DOCUMENT
filetype indent on
set showmatch " show matching bracket briefly
set guioptions-=T " show the toolbar
set vb t_vb= " disable the visual bell

" Status line and ruler
set laststatus=2
set ruler
set rulerformat=%l,%c%V%=%P
" http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
set statusline=%t       " tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, " file encoding
set statusline+=%{&ff}] " file format
set statusline+=%h      " help file flag
set statusline+=%m      " modified flag
set statusline+=%r      " read only flag
set statusline+=%y      " filetype
set statusline+=%=      " left/right separator
set statusline+=%c,     " cursor column
set statusline+=%l/%L   " cursor line/total lines
set statusline+=\ %P    " percent through file

" Set line numbers
set number " show line numbers
set numberwidth=3 " minimal line number width is 3

" Searching
set incsearch " highlight where the pattern so far matches

" Syntax Highlighting
syntax enable

set t_Co=256 " Use 256 colours
set scrolloff=5 " Keep 5 lines above or below visible
set history=500 " 500 commands in history

set textwidth=0 " First part of disabling automatic line wrapping
set wrapmargin=0 " Second part of disabling automatic line wrapping

" Language and filetype specific features
autocmd BufRead,BufNewFile Makefile*,*.mk,*.mk.in,*.go set noexpandtab
autocmd BufRead,BufNewFile *py,*pyw set filetype=python
autocmd BufNewFile * set fileformat=unix

" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set equalalways " Make windows equally sized

" FONT INFORMATION:
" https://github.com/Lokaltog/powerline-fonts/tree/master/DroidSansMono
" https://powerline.readthedocs.org/en/latest/fontpatching.html#usage
" Windows doesn't work quite right
if ! has("win32")
  let g:airline_powerline_fonts = 1
endif
set background=dark

"set background=light
"GUI Options
if has("gui_running")
    set cursorline
    colorscheme solarized
    if has("gui_gtk")
        set guifont=Source\ Code\ Pro\ for\ Powerline\ 11
        " set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 11
        " set guifont=Liberation\ Mono\ 10
    elseif has("gui_macvim")
        set fuoptions=maxhorz,maxvert
        set guifont=Menlo:h12
        " set guifont=ProggySquare:h11
        set guifont=Sauce\ Code\ Powerline:h12
    elseif has("gui_win32")
        set guifont=Consolas:h10
    endif
endif
