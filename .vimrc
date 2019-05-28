"                                _                                            "
"                         _   __(_)___ ___  __________                        "
"                        | | / / / __ `__ \/ ___/ ___/                        "
"                        | |/ / / / / / / / /  / /__                          "
"                        |___/_/_/ /_/ /_/_/   \___/                          "
"    https://raw.githubusercontent.com/znculee/dotfiles/master/vim/.vimrc     "
"                 _  __ _       __                       __    _              "
"                | |/ /(_)___  / /_____  ____  ____ _   / /   (_)             "
"                |   // / __ \/ __/ __ \/ __ \/ __ `/  / /   / /              "
"               /   |/ / / / / /_/ /_/ / / / / /_/ /  / /___/ /               "
"              /_/|_/_/_/ /_/\__/\____/_/ /_/\__, /  /_____/_/                "
"                                           /____/                            "

"┌─────────────┐"
"│   GENERAL   │"
"└─────────────┘"
set nocp
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
let mapleader=';'
let maplocalleader=','
nnoremap <space> :
xnoremap <space> :
set history=1024
set wildmode=longest,list,full
set clipboard=unnamed
if has('nvim')
  let g:python2_host_prog='/usr/local/bin/python2'
  let g:python3_host_prog='/usr/local/bin/python3'
endif

"┌──────────────┐"
"│   vim-plug   │"
"└──────────────┘"
call plug#begin('~/.vim/plugged')

" Plugin: UI
Plug 'Yggdroot/indentLine', {'on': 'IndentLinesEnable'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'qpkorr/vim-bufkill'
Plug 'altercation/vim-colors-solarized'

" Plugin: Encoding
Plug 'mbbill/fencview', {'on': 'FencAutoDetect'}

" Plugin: Editing
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'

" Plugin: Finder & Motions
Plug 'Yggdroot/LeaderF', {'do': './install.sh'}
Plug 'easymotion/vim-easymotion'

" Plugin: Git
Plug 'tpope/vim-fugitive'

" Plugin: Completion & Syntastic
Plug 'rhysd/vim-grammarous', {'on': 'GrammarousCheck'}
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe'

" Filetype: markdown
Plug 'godlygeek/tabular', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

" Filetype: tex
Plug 'lervag/vimtex'

" Filetype: fish
Plug 'dag/vim-fish', {'for': 'fish'}

" Filetype: julia
Plug 'JuliaEditorSupport/julia-vim'

" Filetype: asm
Plug 'philj56/vim-asm-indent'

call plug#end()

"┌────────────────┐"
"│   indentLine   │"
"└────────────────┘"
let g:indentLine_char='|'
let g:indentLine_enabled=0

"┌─────────────┐"
"│   LeaderF   │"
"└─────────────┘"
let g:Lf_ShortcutF='<leader><leader>e'
let g:Lf_ShortcutB='<leader><leader>b'
let g:Lf_WildIgnore={
  \ 'dir': ['.svn','.git','.hg'],
  \ 'file': ['*.sw?','~$*','*.o','*.so','*.gz','*.zip',
           \ '.DS_Store','.localized','*.bak','*.exe',
           \ '*.pdf','*.jpg','*.png',
           \ '*.py[co]','*.np[yz]']
  \ }
let g:Lf_DefaultMode='NameOnly'
let g:Lf_CursorBlink=0
let g:Lf_HideHelp=1
let g:Lf_ShowHidden=1
nmap <leader><leader><s-b> :LeaderfBufferAll<cr>
nmap <leader><leader>l :LeaderfLine<cr>
nmap <leader><leader><s-l> :LeaderfLineAll<cr>
nmap <leader><leader>f :LeaderfFunction<cr>
nmap <leader><leader><s-f> :LeaderfFunctionAll<cr>
nmap <leader><leader>r :LeaderfMru<cr>

"┌───────────────┐"
"│   julia-vim   │"
"└───────────────┘"
let g:latex_to_unicode_auto=1

"┌───────────────┐"
"│   syntastic   │"
"└───────────────┘"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map={
  \ 'mode': 'active',
  \ 'passive_filetypes': ['html','xml','tex']
  \ }
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='*>'
nnoremap <leader>sn :lnext<cr>     " next error or warning
nnoremap <leader>sp :lprevious<cr> " previous error or warning
nnoremap <leader>se :errors<cr>    " open syntastic pane
nnoremap <leader>sc :lclose<cr>    " close syntastic pane
function Py2()
  execute ':SyntasticReset'
  let g:syntastic_python_python_exec='python2'
  execute ':SyntasticCheck'
endfunction
function Py3()
  execute ':SyntasticReset'
  let g:syntastic_python_python_exec='python3'
  execute ':SyntasticCheck'
endfunction
nnoremap <leader>s2 :call Py2()<cr>
nnoremap <leader>s3 :call Py3()<cr>
let g:syntastic_cpp_compiler='clang++'
let g:syntastic_cpp_compiler_options='-std=c++12 -stdlib=libc++'

"┌─────────────────┐"
"│   vim-airline   │"
"└─────────────────┘"
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='solarized'
set laststatus=2
au BufDelete * call airline#extensions#tabline#buflist#invalidate()

"┌─────────────────┐"
"│   vim-bufkill   │"
"└─────────────────┘"
noremap <C-c> :BD<cr>

"┌────────────────────┐"
"│   vim-easy-align   │"
"└────────────────────┘"
xmap ga <plug>(EasyAlign)
nmap ga <plug>(EasyAlign)

"┌────────────────────┐"
"│   vim-easymotion   │"
"└────────────────────┘"
map <leader> <plug>(easymotion-prefix)

"┌────────────────────┐"
"│   vim-grammarous   │"
"└────────────────────┘"
let g:grammarous#languagetool_cmd='languagetool'
let g:grammarous#show_first_error=1
let g:grammarous#hooks={}
function! g:grammarous#hooks.on_check(errs) abort
  nmap <buffer><C-n> <plug>(grammarous-move-to-next-error)
  nmap <buffer><C-p> <plug>(grammarous-move-to-previous-error)
  nmap <buffer><C-f> <plug>(grammarous-fixit)
  nmap <buffer><C-r> <plug>(grammarous-remove-error)
endfunction
function! g:grammarous#hooks.on_reset(errs) abort
  nunmap <buffer><C-n>
  nunmap <buffer><C-p>
  nunmap <buffer><C-f>
  nunmap <buffer><C-r>
endfunction

"┌──────────────────┐"
"│   vim-markdown   │"
"└──────────────────┘"
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_emphasis_multiline=0
let g:vim_markdown_conceal=0
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_new_list_item_indent=0

"┌────────────┐"
"│   vimtex   │"
"└────────────┘"
let g:tex_flavor='latex'
let g:vimtex_compiler_method='latexmk'
let g:vimtex_compiler_latexmk={'build_dir': 'build'}
let g:vimtex_quickfix_open_on_warning=0
let g:vimtex_quickfix_latexlog={
  \ 'overfull': 0,
  \ 'underfull': 0,
  \ 'packages': {'default': 0}
  \ }
let g:vimtex_toc_config={
  \ 'split_pos': 'full',
  \ 'layer_status': {'content': 1,'label': 0,'todo': 0,'include': 0},
  \ 'show_help': 0
  \ }
let g:vimtex_view_method='skim'
let g:vimtex_view_skim_activate=1
let g:vimtex_view_skim_reading_bar=0
nmap <leader>l <plug>(vimtex-compile-ss)

"┌───────────────────┐"
"│   YouCompleteMe   │"
"└───────────────────┘"
let g:ycm_global_ycm_extra_conf="~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_python_binary_path='python'
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_cache_omnifunc=0
let g:ycm_add_preview_to_completeopt=0
let g:ycm_show_diagnostics_ui=0
let g:ycm_min_num_identifier_candidate_chars=2
let g:ycm_key_invoke_completion='<c-z>'
let g:ycm_semantic_triggers={'c,cpp,python,java,go,erlang,perl,cs,lua,javascript': ['re!(\<(?![\./]).*\w{2})']}
set completeopt=longest,menu
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<cr>
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

"┌────────────┐"
"│   COLORS   │"
"└────────────┘"
syntax enable
set background=dark
colorscheme solarized

"┌───────────┐"
"│   STYLE   │"
"└───────────┘"
set backspace=2    " indent,eol,start
set tabstop=4      " 'ts' number of visual spaces per <Tab>
set softtabstop=-1 " number of <Tab> spaces while editing, same as tabstop
set shiftwidth=0   " namber of indent spaces, same as tabstop
set expandtab      " tabs are spaces
set fileformat=unix
set colorcolumn=80
au Filetype asm setl ts=8 | setl ft=nasm
au Filetype vim,markdown,html,css setl ts=2

"┌───────────────┐"
"│   UI CONFIG   │"
"└───────────────┘"
set t_Co=256              " number of colors
set number                " 'nu' show line numbers
set cursorline            " highlight current line
filetype plugin indent on " detection:on plugin:on indent:on
set showmatch             " highlight matching [{()}]
set wildmenu              " visual autocomplete for command menu
set vb t_vb=              " disable error bell
set completeopt-=preview  " disable preview window
set splitright            " put the new buffer on the right
set guicursor=            " disable cursor-styling

"┌─────────────┐"
"│   EDITING   │"
"└─────────────┘"
nnoremap <leader>. :cd %:p:h<bar>:pwd<cr>

"┌────────────┐"
"│   MOTION   │"
"└────────────┘"
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
noremap \ ;
noremap <bar> ,

"┌────────────┐"
"│   REPEAT   │"
"└────────────┘"
nnoremap <c-q> @q

"┌─────────────┐"
"│   WINDOWS   │"
"└─────────────┘"
nnoremap <c-j> :bn<cr>
nnoremap <c-k> :bp<cr>

"┌───────────────┐"
"│   SEARCHING   │"
"└───────────────┘"
set incsearch
set hlsearch
set ignorecase
nnoremap <leader><space> :nohlsearch<cr>
function GetVisualSelection()
  let raw_search = @"
  let @/=substitute(escape(raw_search, '\/.*$^~[]'), "\n", '\\n', "g")
endfunction
xnoremap // ""y:call GetVisualSelection()<bar>:set hls<cr>
if has('nvim')
  set inccommand=nosplit
  xnoremap /s ""y:call GetVisualSelection()<cr><bar>:%s/
else
  xnoremap /s ""y:call GetVisualSelection()<cr><bar>:%s//
endif

"┌───────────┐"
"│   SPELL   │"
"└───────────┘"
nnoremap zs :let &spf=expand('%:p:h').'/en.utf-8.add'<bar>:setl spell!<cr>

"┌──────────┐"
"│   DIFF   │"
"└──────────┘"
set diffopt=vertical,filler

"┌──────────────┐"
"│   TERMINAL   │"
"└──────────────┘"
nnoremap <leader><leader>t :tabe<bar>:terminal<cr><c-\><c-n><c-w>oi
tnoremap <c-w><esc> <c-\><c-n>
if has('nvim')
  au TermOpen * setl nonu | start
  com Vt :vs | te
else
  com Vt :vert term
endif
