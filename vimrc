if has('python3')
endif

set nocompatible
filetype off


call plug#begin('~/.vim/plugged')

Plug 'tmhedberg/SimpylFold'

" =========[ Powerbar ]======================================================
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


Plug 'MarcWeber/vim-addon-mw-utils'



" =========[ buffergator ]======================================================
" https://github.com/jeetsukumaran/vim-buffergator
Plug 'jeetsukumaran/vim-buffergator'


" =========[ NERDtree ]======================================================
" "filesystem
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/ctrlp.vim' 


"html
"  isnowfy only compatible with python not python3
" Plug 'isnowfy/python-vim-instant-markdown'
" Plug 'jtratner/vim-flavored-markdown'
" Plug 'suan/vim-instant-markdown'
" Plug 'nelstrom/vim-markdown-preview'


" =========[ Fortran ]=======================================================
" Plug 'rudrab/vimf90'
" Linter for fortran and other languages
Plug 'dense-analysis/ale'

" =========[ FZF -- fuzzy finder ]===========================================

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" =========[ Grammer-checker ]==============================================
" vim-grammarous installs the LanguageTool from https://www.languagetool.org.  
" Beware that is it is slow.
" Enter :GrammarousCheck to run it
" LanguageTool is not as good as Grammarly.
" I have the desktop app. 
"
"
Plug 'rhysd/vim-grammarous'



" =========[ Julia ]=======================================================
Plug 'JuliaEditorSupport/julia-vim'


" =========[ Jupyter ]=======================================================
Plug 'szymonmaszke/vimpyter' "Vundle
Plug 'jupyter-vim/jupyter-vim'


" =========[ Kettelkasten ]=======================================================

Plug 'vimwiki/vimwiki'

Plug 'michal-h21/vim-zettel'


" =========[ Python syntax ]=================================================
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/Pydiction'
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/syntastic'


"auto-completion stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'klen/python-mode'
" Plug 'ycm-core/YouCompleteMe'
" Plug 'klen/rope-vim'
" Plug 'davidhalter/jedi-vim'
" Plug 'ervandew/supertab'


" ==========[ LaTeX related Plugs ]==========================================
" A Vim Plug for Lively Previewing LaTeX PDF Output
" Plug 'xuhdev/vim-latex-live-preview'
" vimtex for LaTeX and BibTex
Plug 'lervag/vimtex'
" Plug 'LaTeX-Suite-aka-Vim-LaTeX'
Plug 'KeitaNakamura/tex-conceal.vim'


" ==========[ Language Server Protocol ]=====================================
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'



" ==========[ Markdown related Plugs ]==========================================
" gfm: github flavored Markdown:'
Plug 'rhysd/vim-gfm-syntax'

" markdown previewer
Plug 'JamshedVesuna/vim-markdown-preview'


" =========[ Pomodoro ]=======================================================
Plug 'adelarsq/vim-pomodoro'


" ==========[ Snippets ]======================================================
" neosnippets uses deoplete to suggest snippets
" This might be superior to ultisnips
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'


" Ultisnips requires vim installed with python.
" This is just the engine.
" See vim-snippets for the snippets.
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


" ==========[ Stan Plugs ]=======================================
Plug 'eigenfoo/stan-vim'

Plug 'bioSyntax/bioSyntax-vim'

" ==========[ vim-tabbar ]=======================================
Plug 'drmingdrmer/vim-tabbar'


" ==========[ Weave ]=======================================
Plug 'coyotebush/vim-pweave'

" ==========[ Damian Conway's Plugs ]=======================================
Plug 'galli-a/dragvisuals'
Plug 'galli-a/listtrans'
Plug 'galli-a/vmath'





" ==========[tpope's Plugs ]================================================
Plug 'tpope/vim-surround'
"git interface
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-commentary:'
Plug 'reedes/vim-wordy'


call plug#end()
" ===========[ General settings ]============================================

filetype plugin on " enables 
filetype plugin indent on    " enables filetype detection

let g:SimpylFold_docstring_preview = 1

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

"custom keys
" let mapleader=" "
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"
" call togglebg#map("<F5>")


"I don't like swap files
set noswapfile

"python with virtualenv support
" py << EOF
" import os.path
" import sys
" import vim
" if 'VIRTUA_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   sys.path.insert(0, project_base_dir)
"   activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
" au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indentss
"au BufNewFile,BufRead *.py set tabstop=4 set softtabstop=4 set shiftwidth=4 set textwidth=79 set expandtab set autoindent set fileformat=unix


" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red


" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100


" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix


" Set the default file encoding to UTF-8:
set encoding=utf-8


" For full syntax highlighting:
let python_highlight_all=1
syntax on


" Keep indentation level from previous line:
autocmd FileType python set autoindent


" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
"""autocmd FileType python set foldmethod=indent
"use space to open folds
"""nnoremap <space> za
"""vnoremap <space> zf

set foldmethod=syntax


"----------Stop python PEP 8 stuff--------------

" Turn on filetype detection for plugins
filetype plugin on


" ==========[  Fortran Settings ]==============================================
let g:VimF90Leader = "`"
let g:VimF90Linter = 1


" ==========[  FZF Settings ]==============================================

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)





" ==========[ YCM ]==========================================================
" Inform vim of the location of pydiction
let g:pydiction_location = '/Users/blaine/.vim/bundle/Pydiction/complete-dict' 


" Control height of YCM window. 
let g:pydiction_menu_height = 7 


" Trigger configuration. 
" Turn off tab usage by YCM. It conflicts with UtliSnip.
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]


" ==========[ NerDTree settings ]===========================================
" Settings for nerdtree
map <C-E> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']


" ==========[ Python settings ]==============================================
" Disable virtualenv in Pymode
let g:pymode_virtualenv = 0


" Disable pymode init and lint because of #897
let g:pymode_init = 0
let g:python3_host_prog = expand('~/opt/anaconda3/envs/cp38')


" ==========[ UltiSnips related commands ]===================================
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=['/Users/blaine/.vim/my-snippets/Ultisnips','UltiSnips']


set completeopt+=menuone



" ==========[ vim-latex settings ]===========================================
let g:Tex_EnvLabelprefix_equation = "eq:"
let g:Tex_EnvLabelprefix_table = "tab:"
let g:Tex_EnvLabelprefix_figure = "fig:"
let g:Tex_EnvLabelprefix_definition = "def:"
let g:Tex_EnvLabelprefix_lemma = "lem:"
let g:Tex_EnvLabelprefix_definition = "def:"


" ==========[ vim-markdown settings ]===========================================
let g:vim_markdown_preview_github=1
" Display images automatically
let g:vim_markdown_preview_toggle=2


" ==========[ vimtex settings  ]==============================================
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0


" Set pdf previewer
let g:livepreview_previewer = 'gv'


" ==========[ Enforce true colors ]===========================================
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:solarized_termcolors=256
set background=light " set colorscheme
" colorscheme solarized8_high

" run ./solarized.sh from script file to set true colors


" =========[ Kettelkaten directory ]=======================================================
let g:nv_search_paths = ['/Users/blaine/manuscripts/kettelkasten']

" ==========[ Enable syntax highlighting ]====================================
syntax enable

" enable all Python syntax highlighting features
let python_highlight_all=1
syntax on

" flag unnecessary whitespacei as per PEP8
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Need to be using utf-8 with Python3
set encoding=utf-8


" ==========[ Turn on line numbering ]=======================================
set nu " turn on line numbering

" turn hybrid line numbers on
:set number relativenumber
:set nu rnu

" turn hybrid line numbers off
" :set nonumber norelativenumber
" :set nonu nornu

" toggle hybrid line numbers
" :set number! relativenumber!
" :set nu! rnu!


" ==========[ Set line width to 81 columns ]==================================
" OR ELSE just the 81st column of wide lines...
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)


" ==========[ Visualize the invisible characters ]============================
" Make tabs, trailing whitespace, and non-breaking spaces visible
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list


" ==========[ Formatting of the status line ]=================================
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

" Define "straight" tabs
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Define the path format
let g:airline#extensions#tabline#formatter = 'default'


" ===========[ Autocompletion ]==============================================
set omnifunc=syntaxcomplete#Complete


" ==========[ Spell checking ]================================================
"https://www.linux.com/training-tutorials/using-spell-checking-vim/
setlocal spell
" turn on spell checking
set spelllang=en_us


" ==========[ Tab spacing ]==================================================
" set tabs to have 4 spaces
set ts=4


" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab


" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4


" show a visual line under the cursor's current line
set cursorline


" show the matching part of the pair for [] {} and ()
set showmatch


" ==========[ Folding ]=======================================================
" Enable folding
""""set foldmethod=indent
""""set foldlevel=99


" Enable folding with the spacebar
""""nnoremap <space> za
""""vnoremap <space> zf


let g:SimpylFold_docstring_preview=1


" ==========[ Commands to be run on startup ]=================================
" Enables use of :Man <whatever topic>
:runtime! ftplugin/man.vim


" ==========[ The mappings section ]=========================================
" The default leader is the backslash. Comma is easier to enter. 
let mapleader = ","


"==========[ Quicker access to Ex commands ]=================================
" swap : and ; to spare yourself the trouble of using shift to go the ex
" command line.
" This idea is from Damian Conway.
" Two nnoremap commands are required.
" nnoremap  ;  :
" nnoremap  :  ;
" I found these mappings in Conway's 2019 vimrc
nmap ; :
xmap ; :


"==========[ Enable Nmap command for documented mappings ]====================
" runtime plugin/documap.vim


"=========[ Toggle between lists and bulleted lists ]=========================
" The toggle keys for Damian Conways's listtrans plugin.
" Surprisingly, the recommended toggle uses :l which conflicts with the
" remapping of ; to ;.
nmap  lt   :call ListTrans_toggle_format()<CR>
xmap  lt   :call ListTrans_toggle_format('visual')<CR>


" I lifted these mappings from Conway's vimrc file.
" The Namp commend depends on the documap plugin.
" Nmap     <silent> ;l [Toggle list format (bullets <-> commas)]  :call ListTrans_toggle_format()<CR>f
" xnoremap <silent> ;l                                            :call ListTrans_toggle_format('visual')<CR>f


"=========[ Convert list from plain list into item list ]======================
nmap cl    :%s/^/\\item /


"=========[ Config vim-pomodoro ]======================
" Duration of a pomodoro in minutes (default: 25)
let g:pomodoro_time_work = 25

" Duration of a break in minutes (default: 5)
let g:pomodoro_time_slack = 5

" Log completed pomodoros, 0 = False, 1 = True (default: 0)
let g:pomodoro_do_log = 0

" Path to the pomodoro log file (default: /tmp/pomodoro.log)
let g:pomodoro_log_file = "~/gtd/vim-pomodoro.log"

" To display the remaining time of a pomodoro in your statusline, add
set statusline=%#ErrorMsg#%{PomodoroStatus()}%#StatusLine#

" vim-pomodoro notification
let g:pomodoro_notification_cmd = 'zenity --notification --text="Pomodoro finished"'

" To play a soundfile after each completed pomodoro or break
let g:pomodoro_notification_cmd = "mpg123 -q ~/.vim/ping.mp3"


"=========[ Toggling out of insert mode ]======================================
" i for insert from normal mode; ii for escape to normal mode
inoremap ii  <Esc>

" another means of escape to normal mode
inoremap <C-CR>  <Esc>


"=========[ Split windows ]===================================================
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"=========[ Drag visual blocks ]==============================================
" mappings for the dragvisuals plugin
vmap <expr> <LEFT> DVB_Drag('left')
vmap <expr> <RIGHT> DVB_Drag('right')
vmap <expr> <DOWN> DVB_Drag('down')
vmap <expr> <UP> DVB_Drag('up')
vmap <expr> D DVB_Duplicate()


"=========[ Vmath ]==========================================================
" Mappings from the vmath plugin by Damian Conway.
" Average, sum, min, max on a column of numbers.
" Type a column of numbers, then use the mappings.
" After the computation is finished, the stats are
" stored in buffers. the sum is available in the default yank buffer,
" and also in the "s buffer. The average is available in the "a buffer,
" the minimum in the "n buffer,
" the maximum in the "x buffer and
" the min-to-max range in the "r buffer.
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++



"=========[ Unwrap sentences to leave one sentence per line ]===================
" https://vi.stackexchange.com/questions/2846/how-to-set-up-vim-to-work-with-one-sentence-per-line
" function! MyFormatExpr(start, end)
"     silent execute a:start.','.a:end.'s/[.!?]\zs /\r/g'
" endfunction

" set formatexpr=MyFormatExpr(v:lnum,v:lnum+v:count-1)
set rtp+=/usr/local/opt/fzf/bin/fzf