""""""""""""""""""""""""""""""""""""""""""""""""""
" author: yanfei.zhang
" 
" Last-modified: 	2014-05-07 15:53:58
""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off

"plugin manager for pathogen{{
"if has("pathogen")
"    execute pathogen#infect()
"    call pathogen#infect()
"    call pathogen#helptags()
"endif
"}}


"plugin manager for vundle setting {{{
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" format for github: Bundle 'username/prjname'
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'kien/ctrlp.vim'
Bundle 'sukima/xmledit'
Bundle 'sjl/gundo.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'klen/python-mode'
Bundle 'Valloric/ListToggle'
Bundle 'SirVer/ultisnips'
"YouCompleteMe unavailable: requires Vim 7.3.584+ {{{
"Bundle 'Valloric/YouCompleteMe'
"}}}
"syntastic a syntax checking plugin{{{
Bundle 'scrooloose/syntastic'
" ref-url: https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_qw = 1             
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl','podchecker']
let g:syntastic_shell_checkers = ['ShellCheck','sh','checkbashisms']
let g:syntastic_python_checkers = ['python','pylint']
let g:syntastic_ruby= ['rubylint']
let g:syntastic_loc_list_height = 5
"}}}
Bundle 't9md/vim-quickhl'
" Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdcommenter'

" vim-scripts repos  at github
Bundle "vim-scripts/header.vim"
Bundle 'YankRing.vim'
Bundle 'vcscommand.vim'
Bundle 'ShowPairs'
Bundle 'SudoEdit.vim'
Bundle 'EasyGrep'
Bundle 'VOoM'
Bundle 'VimIM'


" or
" remote non git repos
" Bundle 'https://github.com/username/prjname'
" your local machine 
" Bundle 'file:///Users/gmarik/path/to/plugin'
"}}}


" unexpected comment or indentat parse code
"filetype plugin on    " comment inherit at paste
"filetype indent on     " more indent at paste

syntax on

" use vim settings, rather then vi settings (much better!).
set nocompatible

" turn on the verboseness to see everything vim is doing.
"set verbose=9


"" allow backspacing over everything in insert mode ???
"set backspace=indent,eol,start

"set smarttab

"tab setting {{
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"}}

" always  set auto indenting on,but unexpected indent at parse code
"set autoindent

" set the command height at bottom 
set cmdheight=2

" occur scroll at bottom 3
"set scrolloff=3     

"encoding {{
" set encoding for buffers/msg,etc
set encoding=utf-8 "local
" set multi encodings to suggest on opened for file conent
set fileencodings=utf-8,gb2312
" set encoding on saved for file content
set fileencoding=utf-8
" displayed text for terminal
set termencoding=utf-8
"}}

set number

set ignorecase

set foldenable      
set foldmethod=manual

" show the cursor position(line,column) all the time at bottom right corner
set ruler

" show inputed command
set showcmd

" do incremental searches (annoying but handy);
set incsearch
" highlight search result
set hlsearch

" show  tab characters. visual whitespace.
" set list

" set status line
set statusline+=[%02n]\ \%F%m%r%h%w\ [%{(&fenc==\"\"?&enc:&fenc)}]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l/%L,%v][%p%%]\ [OPEN-TIME=%{strftime(\"%m/%d\ %H:%M\")}]
"syntastic {{{
set statusline+=%{SyntasticStatuslineFlag()}
highlight SyntasticErrorSign guifg=white guibg=red
highlight SyntasticError guibg=#2f0000
" }}}
"if has('syntastic')
    "set statusline+=%{SyntasticStatuslineFlag()}
"endif
" always display a status line at the bottom of the window
set laststatus=2

" showmatch: show the matching bracket for the last ')'?
se showmatch

" pop confirm dialog at changed or readonly file
set confirm

set colorcolumn=85           " color show at 85 column
set t_Co=256                 " 256 color
"set cursorline               " highlight line vertical
"set cursorcolumn             " highlight column horizonal

"colorscheme darkblue
"colorscheme murphy
colorscheme desert 


" set 52 lines for the display, 1 for the status line.
" " and other display options
if has('gui_running')
   " i like about 80 character width lines
     set textwidth=78
     "  2 for the command line
     set lines=52
     " add columns for the project plugin
     set columns=109
     " enable use of mouse
 
    set mouse=a
endif


" ************************************************************************
" ARGUMENTS SETTING 
"
" commands for :explore
" g: global var
let g:explvertical=1    " open vertical split winow
let g:explsplitright=1  " put new window to the right of the explorer
let g:explstartright=0  " new windows go to right of explorer window

" for the TOhtml command
let g:html_use_css=1

" define my basic info
let g:mauthor="yanfei.zhang"
let g:memail="gisboxwinner@email.com"

if has("gui")
    " set the gui options to:
    "   g: grey inactive menu items
    "   m: display menu bar
    "   r: display scrollbar on right side of window
    "   b: display scrollbar at bottom of window

    "   t: enable tearoff menus on Win32
    "   T: enable toolbar on Win32
    set go=gmr
    set guifont=DejaVu\ Sans\ mono\ 11    " escape spae 

    winpos 5 5                     " window display position 
endif


" ************************************************************************
" K E Y   M A P P I N G S
"
let mapleader=","
map <Leader>e :Explore<cr>
map <Leader>se :Sexplore<cr>
map <Leader>he :Hexplore<cr>
map <Leader>ve :Vexplore<cr>

" last modifed datetime
map <Leader>L    :let @z=TimeStamp()<Cr>"zpa
map <Leader>datetime :let @z=strftime("%Y-%m-%d %H:%M:%S")<Cr>"zpa
map <Leader>date :let @z=strftime("%Y-%m-%d")<Cr>"zpa
map <Leader>time :let @z=strftime("%H:%M:%S")<Cr>"zpa

map <F2> <c-o>:w<CR>

" Buffer(file) naviation
map <M-Up> :bprevious<CR>
map <M-Down> :bnext<CR>
" Tab(page) naviation
map <M-Left> :tabnext<CR>
map <M-Right> :tabprevious<CR>

" Select all.
map <C-a> ggVG

" Undo in insert mode. insert map
imap <C-z> <c-o>u

" system key ctrl+C to copy selected content at visual mode
vmap <C-C> "+y

" generate ctags file 
"map <C-F9> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


" multi mode(insert/normal/command...) move cursor
inoremap <C-h> <left>
inoremap <C-l> <Right>
inoremap <C-j> <Down>
inoremap <C-k> <Up>

inoremap <C-b> <C-o>b
inoremap <C-f> <C-o>w
" line ahead
inoremap <C-a> <Home>
inoremap <C-e> <End>
" doc ahead ??
"inoremap <M-a> <C-o>gg
"inoremap <M-e> <C-o>G

" select paragraph
":noremap <F2> vip


" ************************************************************************
" KEY F{1-12}  compile debug execute
"
"F5 execute
 map <F5> :call CompileRunGcc()<CR>
 func! CompileRunGcc()
     exec "w"
     "exec "!rm -f %<.o"
     if &filetype == "c"
         exec "!gcc -Wall -lm % -o %<.o -I . "
     elseif &filetype == "cpp"
         exec "!g++ -Wall -lm % -o %<.o -I .  " 
     endif
     "exec "!echo % compile finish."
 endfunc

 "F6 execute
 map <F6> :call RunApp()<CR>
     func! RunApp() 
     exec "! ./%<.o"
 endfunc

 "F7 debug
 map <S-F6> :call AppDebug()<CR>
 func! AppDebug()
     exec "w"
     exec "!rm -f %<.o"
     if &filetype == "c"
         exec "!gcc -g % -o %<.o -I . "
     elseif &filetype == "cpp"
         exec "!g++ -g % -o %<.o -I .  "
     endif
     exec "!gdb %<.o"
 endfunc


" ************************************************************************
" B E G I N  A U T O C O M M A N D S
"
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.

  "filetype indent on
  "filetype plugin on

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler

  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd InsertLeave * se nocul  " highlight current line using light-colored
  autocmd InsertEnter * se cul    " same with upper line 

endif " has("autocmd")


" ************************************************************************
"  M E N U for GUI 
"
" GUI ONLY type stuff.
if has("gui")

  :menu &MyVim.Current\ File.Convert\ Format.To\ Dos :set fileformat=dos<cr> :w<cr>

  :menu &MyVim.Current\ File.Convert\ Format.To\ Unix :set fileformat=unix<cr> :w<cr>

  :menu &MyVim.Current\ File.Remove\ Trailing\ Spaces\ and\ Tabs :%s/[  ]*$//g<cr>
  :menu &MyVim.Current\ File.Remove\ Empty\ Line :%s/^[ \t]*$//g<cr>

  :menu &MyVim.Current\ File.To\ HTML :runtime! syntax/2html.vim<cr>
   " or
  :menu &MyVim.Current\ File.To\ HTML2 :TOhtml<cr>

  ":amenu &MyVim.Insert.Date<Tab>,date <Esc><Esc>:,date<Cr>
  ":amenu &MyVim.Insert.Date\ &Time<Tab>,datetime <Esc><Esc>:let @z=YDATETIME<Cr>"zpa

  :amenu &MyVim.Insert.Last\ &Modified<Tab>,L <Esc><Esc>:let @z=TimeStamp()<CR>"zpa

  ":amenu &MyVim.&Project :Project<CR>

  " hide the mouse when characters are typed
  "set mousehide
endif


" ************************************************************************
"  F U N C T I O N S
"

" my formated time 
if !exists("*MyTimeFormat")
    fun MyTimeFormat()
        return strftime("%T")
    endfun
endif

" my formated date 
if !exists("*MyDateFormat")
    fun MyDateFormat()
        return strftime("%Y-%m-%d")
    endfun
endif

" my formated datetime
if !exists("*MyDateTimeFormat")
    fun MyDateTimeFormat()
        return MyDateFormat() . " " . MyTimeFormat()
    endfun
endif


" first add a function that returns a time stamp in the desired format 
if !exists("*TimeStamp")
    fun TimeStamp()
        return "Last-modified: \t" . MyDateTimeFormat()
    endfun
endif

" searches the first ten lines for the timestamp and updates using the
" TimeStamp function
if !exists("*UpdateTimeStamp")
    function! UpdateTimeStamp()
        " Do the updation only if the current buffer is modified 
        if &modified == 1
            " go to the first line
            exec "1"
            " Search for Last modified: 
            let modified_line_no = search("Last-modified:")
            if modified_line_no != 0 && modified_line_no < 10
                " There is a match in first 10 lines 
                " Go to the : in modified: 
                exe "s/Last-modified: .*/" . TimeStamp()
            endif
        endif
    endfunction
endif

