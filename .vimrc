" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set backup                    " Enable creation of backup files
set backupdir=~/.vim/backups  " Directory where backups will go
set directory=~/.vim/tmp      " Directory for temporary files

set cf                        " Enable error files & error jumping
set history=256               " keep 50 lines of command line history
set showcmd                   " display incomplete commands
set incsearch                 " do incremental searching
set ignorecase                " Ignore case while searching
set smartcase                 " Case Sensitive if Search Term has Upper Case
set hlsearch                  " Highlight search by default

" Formatting
set backspace=2               " allow backspacing over everything in insert mode
set shiftwidth=2              " Tabs under smart indent
set autoindent
set number
set numberwidth=3
set nowrap
set linebreak
set cursorline
set smarttab
set expandtab

" Visual
set showmatch                 " Show matching brackets
set novisualbell
set noerrorbells
set laststatus=2
set mouse=a
set directory=.,$TEMP

" pathogen config
call pathogen#infect()
call pathogen#helptags()

" Only do this part when compiled with support for auto commands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'textwidth' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType vo_base setlocal spell
    autocmd FileType text setlocal spell textwidth=78

    " For all ruby files
    autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et 
    "autocmd FileType haml,yaml set foldmethod=indent

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif

    " Automatically remove hidden fugitive buffers
    autocmd BufReadPost fugitive://* set bufhidden=delete

    " Automatically load .vimrc changes
    autocmd BufWritePost vimrc source $MYVIMRC
    autocmd BufWritePost .vimrc source $MYVIMRC 
  augroup END
endif " has("autocmd")

color railscasts
"color gummybears

vmap <C-C> "+y
vmap <C-X> "+x
imap <C-V> <SPACE><ESC>"+gPi

" Tab Navigation with Ctrl+Tab
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprev<CR>
nmap <silent> <C-S-Left> :exe 'silent! tabmove ' . (tabpagenr()-2)<CR>
nmap <silent> <C-S-Right> :exe 'silent! tabmove ' . tabpagenr()<CR>

" Bubble single line - dependent on vim-unimpaired plugin
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines - also dependent on vim-unimpaired plugin
vmap <C-Up> [egv
vmap <C-Down> ]egv

" These are mappings for the longlines mode equivalent"
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

nnoremap ; :
nnoremap Y y$
nmap <silent> <Leader>/ :nohlsearch<CR>

cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

"match Underlined /\<_[^_]*_\>/

" Common Plugins
syntax on
filetype plugin indent on

"set foldenable
"set foldmethod=syntax

runtime! macros/matchit.vim " Advanced % matching

"let g:xml_syntax_folding=1
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"  
map fmt :silent 1,$!xmllint --format --recover - 2>/dev/null<CR> 

" Improve autocomplete menu colors
highlight PMenu gui=bold guibg=#444444 guifg=#CECECE

" Gui Modifications
if has('gui_running')
  set scrolloff=5    " Minimum lines to keep above & below the cursor
  set guioptions-=m  " Remove menu bar
  set guioptions-=T  " Remove toolbar
  set guioptions-=r  " Remove right-hand scroll bar 
  set guioptions-=L  " Remove left-hand scroll bar

  " Tabline modifications
  set guitablabel=%t%m
end

" Statusline modifications, added Fugitive Status Line & Syntastic Error Message
set statusline=[%t]%w%m%r%<
set statusline+=[Type=%Y]
set statusline+=%{fugitive#statusline()}
set statusline+=%{rvm#statusline()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=[%l,%c][%p%%]

" Vim supports dictionary autocomplete Ctrl_X+Ctrl_K
set dictionary=/usr/share/dict/words
set thesaurus=~/.vim/spell/mthesaur.txt

" Provides nice wild menu completion, makes command completion in ambiguous
" case very easy
set wildmenu wildmode=full

" Vim inbuilt spell check, <Leader>z= for options, <Leader>zg to add word to list
" set spell " enable this when needed, not needed all the time, can get annoying

" Remap command key
nnoremap <Leader>T :CommandT<CR> 

" Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntastic setting for vim to use |:sign| for marking syntax errors
let g:syntastic_enable_signs=1

" Ruby Debug IDE settings
let g:ruby_debugger_fast_sender = 1
map <F5> :DbgStepInto<CR>
map <F6> :DbgStepOver<CR>
map <F7> :DbgStepOut<CR>
map <F8> :DbgRun<CR>

" NERDTree Settings
let NERDTreeChDirMode=1
"let NERDTreeQuitOnOpen=1
"let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeKeepTreeInNewTab=1
let g:NERDTreeMapActivateNode='<CR>'
map <Leader>nt :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <Leader>nf :NERDTreeFind<CR>

" Fuzzy Find file, tree, buffer, line
nmap <Leader>ff :FufFile **/<CR>
nmap <Leader>ft :FufFile<CR>
nmap <Leader>fb :FufBuffer<CR>
nmap <Leader>fl :FufLine<CR>
nmap <Leader>fr :FufRenewCache<CR>

" Tlist settings
let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=0
let Tlist_Exit_OnlyWindow=1
"let Tlist_File_Fold_Auto_Close=1
"let Tlist_Enable_Fold_Column=0
let Tlist_Auto_Highlight_Tag=1
let Tlist_Auto_Update=1
let Tlist_Highlight_Tag_On_BufEnter=1
let Tlist_Use_SingleClick=1
map <Leader>tl :Tlist<CR>

" Ctags
let g:ctags_statusline=1
let g:tlist_javascript_settings='javascript;f:function;c:class;m:method;p:property;v:global'

" Preview Settings
let g:PreviewBrowsers='google-chrome'

" Ack settings
"let g:ackprg="ack-grep -a -H --nocolor --nogroup --column" 

" Session
set sessionoptions+=resize
let g:session_autoload=1
let g:session_autosave=1
let g:session_default_to_last=1
let g:session_command_aliases=1

" Powerline
let g:Powerline_symbols = 'fancy'
set shortmess+=A 

set tabstop=2
