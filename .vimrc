set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'

Bundle 'rking/ag.vim'

Bundle 'fatih/vim-go'

Bundle 'vim-scripts/AutoComplPop'

Bundle 'scrooloose/syntastic'

Bundle 'tpope/vim-fugitive'

Bundle 'vim-airline/vim-airline'

Bundle 'vim-airline/vim-airline-themes'


filetype plugin indent on
colorscheme gruvbox
set background=dark
set t_Co=256

set runtimepath^=~/.vim/bundle/ctrlp.vim
set tabstop=2
set expandtab
set shiftwidth=2
set number
set background=dark
set spell spelllang=en_us
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2

command! -nargs=* -bar -bang -count=0 -complete=dir E Explore <args>
command! -nargs=* -bar -bang -count=0 -complete=dir Gs Gstatus <args>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:solarized_termcolors = 256
let g:airline_theme='wombat'


function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

vnoremap <silent> <expr> p <sid>Repl()

syntax enable
