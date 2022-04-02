
" Use Vim defaults instead of 100% vi compatibility
set nocompatible
" More powerful backspacing
set backspace=2

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'ludovicchabant/vim-gutentags'

Plug 'vim-airline/vim-airline'

" Initialize plugin system
call plug#end()

filetype plugin indent on

set paste
set nu
set showmatch
set nowrap

set ruler
set cursorline
set cursorcolumn
set wildmenu

set hlsearch
set incsearch
set cindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

syntax on

" Fixup ALT key of terminal Vim
set timeout
if $TMUX != ''
	set timeoutlen=30
elseif &timeoutlen > 80 || &timeoutlen <= 0
	set timeoutlen=80
endif

if !(has('nvim') || has('gui_running'))
	for i in range(97,122)
		let c = nr2char(i)
		exec "map \e".c." <M-".c.">"
		exec "map! \e".c." <M-".c.">"
	endfor
endif

" Configure ctags
set tags=./tags,./TAGS,tags;~,TAGS;~

" Configure LeaderF
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
"let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

" Configure gutentags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

let g:gutentags_ctags_tagfile = '.tags'

let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif

colorscheme molokai
let t_Co = 256

let g:molokai_original = 1
let g:rehash256 = 1
set background=dark

hi Comment	guifg=#ffff00 ctermfg=226 cterm=none

" Spell-checker for emails
autocmd FileType mail set nopaste tw=72 spell

if has("cscope")
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
imap{ {}<ESC>i<CR><ESC>O
