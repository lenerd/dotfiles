set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" The bundles you install will be listed here
"" status bar
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"" git integration
Plugin 'tpope/vim-fugitive'
"" mercurial integration
Plugin 'ludovicchabant/vim-lawrencium'
"" file browser
Plugin 'scrooloose/nerdtree'
"" python support
Plugin 'klen/python-mode'
" Bundle 'davidhalter/jedi-vim'
"" tag bar
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
"" syntax completion
Plugin 'Valloric/YouCompleteMe'
"" highlights current html/xml tag
Plugin 'Valloric/MatchTagAlways'
"" special qt syntax
Plugin 'https://bitbucket.org/kh3phr3n/vim-qt-syntax.git'
"" vim latexsuite
Plugin 'http://git.code.sf.net/p/vim-latex/vim-latex'
"" jinja2 syntax
Plugin 'Glench/Vim-Jinja2-Syntax'
"" indent level display
Plugin 'nathanaelkane/vim-indent-guides'

filetype plugin indent on


" The rest of your config follows here

augroup vimrc_autocmds
	autocmd!
	" highlight characters past column 120
	autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
	autocmd FileType python match Excess /\%120v.*/
	autocmd FileType python set nowrap
augroup END

" Powerline setup
set guifont=Inconsolata\ for\ Powerline
set laststatus=2

map <F2> :NERDTreeToggle<CR>
map <F3> :TagbarToggle<CR>
map <F4> :setlocal spell! spelllang=de_de<CR>

"--------
" Python
"--------

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" g     Rope goto definition
" d     Rope show documentation
" f     Rope find occurrences
" b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = 'b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0


"----------
" HTML/CSS
"----------

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
autocmd FileType html,css,htmljinja,htmldjango setlocal shiftwidth=2 tabstop=2

"-------
" LaTeX
"-------
let g:Tex_Env_equation = "\\begin{equation}\<CR><++>\<CR>\\end{equation}\<CR><++>"
let g:Tex_Env_align = "\\begin{align}\<CR><++>\<CR>\\end{align}\<CR><++>"
au BufRead,BufNewFile *.tex set filetype=tex


"----------
" Markdown
"----------
au BufRead,BufNewFile *.md set filetype=markdown

"------
" Misc
"------

" spell checking
" Wann geladen wird              # Maske   # Aktivieren      # Zu verwendende Sprache
au BufNewFile,BufRead,BufEnter   *.md      setlocal spell    spelllang=de_de
au BufNewFile,BufRead,BufEnter   *.txt     setlocal spell    spelllang=de_de
au BufNewFile,BufRead,BufEnter   *.tex     setlocal spell    spelllang=de_de

" code completion (YouCompleteMe)
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1

" Use ö to toggle display of whitespace
nmap ö :set list!<CR>
" And set some nice chars to do it with
set listchars=tab:»\ ,eol:¬,trail:·,nbsp:~

" I'm prefer spaces to tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Line numbers
set number

" Syntax highlighting
syntax on

" Searching
set ignorecase
set smartcase

" open files
set wildignorecase

" Window stuff
" free <c-j>
"nnoremap <SID>I_won’t_ever_type_this <Plug>IMAP_JumpForward
" Window splitting
" Vertical Split : Ctrl+w + v
" Horizontal Split: Ctrl+w + s
" Close current windows: Ctrl+w + q
map <m-h> <c-w>h
map <m-j> <c-w>j
map <m-k> <c-w>k
map <m-l> <c-w>l

" nnoremap <c-j> <Plug>IMAP_JumpForward
