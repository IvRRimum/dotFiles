set nocompatible
filetype off

call plug#begin()
" Plugins
Plug 'jksainnhe/sonokai'
Plug 'cloudhead/neovim-fuzzy'
Plug 'neoclide/coc.nvim'
Plug 'Raimondi/delimitMate'
Plug 'chr4/nginx.vim'
Plug 'bfredl/nvim-miniyank'
Plug 'blueyed/smarty.vim'
Plug 'gcmt/taboo.vim'
Plug 'wellle/targets.vim'
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kchmck/vim-coffee-script'
Plug 'wsdjeg/vim-fetch'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'szw/vim-maximizer'
Plug 'RRethy/vim-illuminate'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'google/vim-searchindex'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-visual-star-search'


call plug#end()

" highlight Pmenu ctermfg=225 ctermbg=227 guifg=#ffffff guibg=#ffffff

" Remaps
tnoremap <Esc> <C-\><C-n>
set clipboard=unnamed
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

nnoremap <silent><C-w>a :MaximizerToggle<CR>
vnoremap <silent><C-w>a :MaximizerToggle<CR>gv
inoremap <silent><C-w>z <C-o>:MaximizerToggle<CR>
nnoremap <C-p> :FuzzyOpen<CR>

let g:go_def_mode = "gopls"                                                    
let g:python3_host_prog = '/usr/bin/python3'
let g:UltiSnipsExpandTrigger="<c-b>"

" Press Ctrl+c and then g
nnoremap <C-c>g :YcmCompleter GoTo<CR>
nnoremap <C-w>cd :cd %:p:h<CR>

set completeopt=menu,menuone,preview

" coc config
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set shortmess+=c
set signcolumn=yes

"if fnamemodify(getcwd(), ':t') == "some proj name"
"  set tabstop=4 softtabstop=0 expandtab shiftwidth=4
"else
"  
"endif

filetype plugin indent on
set tabstop=2 
set softtabstop=2 
set expandtab 
set shiftwidth=2 
set smarttab 
set autoindent

syntax enable
set mouse=a
set number

let g:polyglot_disabled = ['jsx']

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Configuration custom vim mapping
nnoremap <space>e :CocCommand explorer<CR>

" COC-Prettier thingy 
command! -nargs=0 Prettier :CocCommand prettier.formatFile

command Tabe tabe
command Term term

command CacheClearP CtrlPClearAllCaches

command BashProfile e ~/.bash_profile
command Utilssh e ~/.utils.sh
command SshConfig e ~/.ssh/config
command Vimrc e ~/.config/nvim/init.vim
command Notes e ~/.notes.txt

command FormUK e ~/Projects/formuk/access.txt

" Important!!
if has('termguicolors')
  set termguicolors
endif

" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
let g:airline_theme = 'sonokai'

colorscheme sonokai

" tab oo config
let g:taboo_tab_format = " %N %f %x "

term
tabe
tabNext
