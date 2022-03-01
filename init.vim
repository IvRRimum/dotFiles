set nocompatible
filetype plugin on
let g:polyglot_disabled = ['jsx', 'vue']
let mapleader = "C-w"

call plug#begin()
" Plugins
Plug 'mileszs/ack.vim'
Plug 'sainnhe/sonokai'
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
" Plug 'RRethy/vim-illuminate'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'google/vim-searchindex'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-visual-star-search'
Plug 'nicwest/vim-camelsnek'
Plug 'tpope/vim-rails'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'chrisbra/csv.vim'
Plug 'github/copilot.vim'
Plug 'f-person/git-blame.nvim'

call plug#end()

set shell=/bin/zsh

let g:csv_autocmd_arrange = 1
let g:csv_autocmd_arrange_size = 1024*1024
let g:gitblame_enabled = 0

" Remaps
tnoremap <Esc> <C-\><C-n>
set clipboard=unnamedplus
"set clipboard+=unnamedplus
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

nnoremap <silent><C-w>a :MaximizerToggle<CR>
vnoremap <silent><C-w>a :MaximizerToggle<CR>gv
inoremap <silent><C-w>z <C-o>:MaximizerToggle<CR>
nnoremap <C-p> :FuzzyOpen<CR>

let g:go_def_mode = "gopls"                                                    
let g:python3_host_prog = '/usr/bin/python3'
let g:UltiSnipsExpandTrigger="<c-b>"

nnoremap <C-w>cd :cd %:p:h<CR>
set completeopt=menu,menuone,preview

" coc config
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set shortmess+=c
set signcolumn=yes

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <C-w>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>p  <Plug>(coc-codeaction-selected)
nmap <leader>p  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

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

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

imap <C-l> <Plug>(coc-snippets-expand)

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

"if fnamemodify(getcwd(), ':t') == "folder"
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

" Important!!
if has('termguicolors')
  " set termguicolors
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
