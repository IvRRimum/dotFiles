set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rking/ag.vim'
" Bundle 'fatih/vim-go'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'leafgarland/typescript-vim'
Bundle 'slim-template/vim-slim'
Bundle 'gregsexton/MatchTag'
Bundle 'Valloric/YouCompleteMe'
Bundle 'wikitopian/hardmode'

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

let g:solarized_termcolors = 256
let g:airline_theme='wombat'
let g:netrw_list_hide= '.*\.swp$'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|platforms\|tmp'

" Remap tile swich keys in terminal mode
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l

" Remap tile swich keys in normal mode
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

" Leave Terminal Mode
:tnoremap <Esc> <C-\><C-n>

" If directory
" if fnamemodify(getcwd(), ':t') == "minicredit.lv"
"  :autocmd BufWritePost * execute '!rsync -a /home/karlis/Projects/minicredit/minicredit.lv minicredit:/var/www'
" endif
"

function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p

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
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
