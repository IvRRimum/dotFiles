set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'

Bundle 'rking/ag.vim'

Bundle 'fatih/vim-go'

Bundle 'vim-scripts/AutoComplPop'

" Bundle 'scrooloose/syntastic'

Bundle 'tpope/vim-fugitive'

Bundle 'vim-airline/vim-airline'

Bundle 'vim-airline/vim-airline-themes'

Bundle 'leafgarland/typescript-vim'

Bundle 'slim-template/vim-slim'


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
set hlsearch
set directory=~/.vim/swapfiles/

command! -nargs=* -bar -bang -count=0 -complete=dir E Explore <args>
command! -nargs=* -bar -bang -count=0 -complete=dir Gs Gstatus <args>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:solarized_termcolors = 256
let g:airline_theme='wombat'
let g:netrw_list_hide= '.*\.swp$'

if fnamemodify(getcwd(), ':t') == "minicredit.lv"
  :autocmd BufWritePost * execute '!rsync -a /home/karlis/Projects/minicredit/minicredit.lv minicredit:/var/www'
endif

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

hi Normal ctermbg=none
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
