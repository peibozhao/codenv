" ***********vim config
"let mapleader="\<Space>"
syntax on
set number  " 行号
set relativenumber
set smartindent " 对齐
set cindent
set cinoptions=g0h2 " 不使用谷歌规范
set formatoptions=ql
set tabstop=2 " tab
set shiftwidth=2
set softtabstop=2
set expandtab " 将tab转换为space
autocmd FileType make set noexpandtab
set backspace=indent,eol,start  " 删除,干啥的来着。。。
set mouse=a " 鼠标操作
set encoding=utf-8  " 编码
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set nocompatible  " 兼容vi
set autowrite " 切换buff自动保存
set cursorline  " UI
"hi cursorline cterm = NONE ctermbg = darkcyan ctermfg = black
"hi cursorColumn cterm = NONE ctermbg = darkred ctermfg = white
set nohlsearch
set fillchars=vert:│
"set splitbelow    " 把 preview window 弄到下面，总是颤抖
"set completeopt=menu,preview
colorscheme darkblue
highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE " 分割线的样式
highlight colorcolumn cterm=NONE ctermfg=NONE ctermbg=DarkGray " 行字符限制
highlight OverLength ctermbg=Red ctermfg=white " 字符限制
highlight ExtraWhitespace ctermbg=red guibg=red " 结尾的空白字符
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
" autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/
" set colorcolumn=80
" match OverLength /\%81v.\+/ " 80 字符限制
cnoremap <C-A> <Home> " 命令行的按键映射
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
" 终端快捷键
cnoremap <C-T> sp term://bash<CR>A
" 会影响fzf的关闭
" tnoremap <Esc> <C-\><C-n> " 使esc在 terminal中也有相同的表现
if has("nvim")
  au TermOpen * tnoremap <Esc> <C-\><C-n>
  au FileType fzf tunmap <Esc>
endif
nnoremap <leader>ls :ls<CR>:b<space>
filetype plugin indent on
au BufRead,BufNewFile *.hcc set filetype=cpp
if has("autocmd")  " 自动跳转到上次退出的位置
	au BufReadPost * if line("'\"")>1 && line("'\"")<=line("$") | exe "normal! g'\"" | endif
endif
" let g:loaded_python3_provider=0 " python 总是加载错误
let g:python3_host_prog='/usr/local/miniconda3/bin/python' " 指定python3的执行程序


" **************PLUGIN NERDTree
let NERDChristmasTree = 1
let NERDTreeAutoCenter = 1
let NERDTreeMouseMode = 2
let NERDTreeWinSize = 31
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swp']
let NERDTreeWinSize = 30
nnoremap <silent> <leader>tr :NERDTreeToggle<CR>
" au VimEnter * NERDTree " 自动打开


" ***********PLUGIN project
"let g:proj_flags = "imsStg"


" ***************PLUGIN vim-snippet
let g:UltiSnipsExpandTrigger = "<C-f>"
let g:UltiSnipsListSnippets = "<C-x>"
let g:UltiSnipsJumpForwardTrigger = "<C-f>"
let g:UltiSnipsJumpBackwardTrigger = "<C-b>"


" ********************PLUGIN Plug
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-scripts/a.vim'

Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'
" 已经不再维护
" Plug 'vim-scripts/Mark'

" Plug 'vim-scripts/ctrlp.vim'
Plug 'Yggdroot/LeaderF'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Plug 'vim-scripts/The-NERD-tree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'scrooloose/nerdcommenter'

" Plug 'vim-scripts/repmo.vim'

Plug 'vim-airline/vim-airline'

Plug 'kassio/neoterm'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

Plug 'mileszs/ack.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'Yggdroot/indentLine'
Plug 'Yggdroot/hiPairs'

call plug#end()


" *****************PLUGIN snippet
let g:UltiSnipsExpandTrigger='<C-f>'
let g:UltiSnipsListSnippets='<C-x>'
let g:UltiSnipsJumpFrowardTrigger='<C-f>'
let g:UltiSnipsJumpBackwardTrigger='<C-b>'


" *****************PLUGIN a.vim
let g:alternateExtensions_h='c,cpp,cxx,cc,CC,hcc'
let g:alternateExtensions_hcc='h,hpp'
" 即使在buffer里也会特别卡
" let g:alternateSearchPath='sfr:../source,sfr:../src,sfr:../include,sfr:../inc,reg:/include/src//,reg:/src/include//,reg:/inc/src//,reg:/src/inc//'
let g:alternateNoDefaultAlternate=1

" **************** PLUGIN ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" **************** PLUGIN vim-session
let g:session_autosave = 'no'
let g:session_autoload = 'no'
let g:session_directory = '~/.config/nvim/sessions/'

" **************** PLUGIN Doxygen
" let g:DoxygenToolkit_commentType = 'C++'
let g:DoxygenToolkit_anthorName = 'zpb, zpb_1992@126.com'

" **************** PLUGIN nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left' " 受formatoptions影响
nnoremap <leader>cls O/********************  *******************/<Esc>20<Left>i
nnoremap <leader>cle O/***********************************************/<Esc>

" **************** PLUGIN LeaderF
" 与mark.vim冲突
" nnoremap <leader>mru :LeaderfMru<CR>
nnoremap <leader>lf :LeaderfFunction<CR>

" **************** PLUGIN fzf
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

" **************** PLUGIN Ack
let g:ack_mappings = {
      \ "t": "<C-W><CR><C-W>T",
      \ "T": "<C-W><CR><C-W>TgT<C-W>j",
      \ "o": "<CR>:ccl<CR>",
      \ "O": "<CR>",
      \ "go": "<CR><C-W>j",
      \ "h": "<C-W><CR><C-W>K",
      \ "H": "<C-W><CR><C-W>K<C-W>b",
      \ "v": "<C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t",
      \ "gv": "<C-W><CR><C-W>H<C-W>b<C-W>J" }

" **************** PLUGIN indentLine
let g:indentLine_fileType = ['python']


" *************** PLUGIN hiPairs
let g:hiPairs_hl_matchPair = { 'term'    : 'underline,italic',
          \                    'cterm'   : 'NONE',
          \                    'ctermfg' : '240',
          \                    'ctermbg' : '226',
          \                    'gui'     : 'italic',
          \                    'guifg'   : 'White',
          \                    'guibg'   : 'Yellow' }

let g:hiPairs_hl_unmatchPair = { 'term'    : 'underline,italic',
            \                    'cterm'   : 'NONE',
            \                    'ctermfg' : 'NONE',
            \                    'ctermbg' : 'NONE',
            \                    'gui'     : 'italic',
            \                    'guifg'   : 'NONE',
            \                    'guibg'   : 'NONE' }

" *************** PLUGIN Coc
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> <leader>[g <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>cld  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>cle  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>clc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>clo  :<C-u>CocList outline<cr>
" Search workleader symbols
nnoremap <silent> <leader>cly  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>cn  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>cp  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>clr  :<C-u>CocListResume<CR>
