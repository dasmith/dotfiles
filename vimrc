set nocompatible               " be iMproved
set autoindent
set cindent
set tabstop=2
set softtabstop=2
set expandtab   "tabs as space
set noerrorbells visualbell t_vb=
"set novisualbell " no blinking
autocmd GUIEnter * set visualbell t_vb=
set laststatus=2 " always show status
set number " show ruler

set background=dark

" switch buffers without requiring saving
set hidden

" Always show ruler
set ruler
"set wildmenu
set nocp
set cmdheight=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

syntax on
syntax enable
" Scheme
" Font
set guifont=Meslo\ LG\ L\ DZ:h12

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,.pyc
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

filetype off                  " required!
filetype on
filetype plugin indent on     " required!

let mapleader = ","
inoremap jj <Esc>

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 
" vim-scripts repos
" let Vundle manage Vundle
" required! 
" Bundle 'sontek/rope-vim.git'
Bundle 'gmarik/vundle'
Bundle 'spolu/dwm.vim.git'

" LaTeX
Bundle "jcf/vim-latex"

"Syntax support" 
Bundle "scrooloose/syntastic.git"

" html  & jinja2
Bundle "lepture/vim-jinja" 

" CoffeeScript
Bundle 'kchmck/vim-coffee-script'

" Robot Framework
Bundle "mfukar/robotframework-vim"

" original repos on github
Bundle "git.zip"
Bundle 'tpope/vim-fugitive'

Bundle 'vim-scripts/Color-Sampler-Pack.git'
color codeschool
"colorscheme peaksea
"colorscheme railscasts2



" Show table of contents for 
" Markdown documents in left pane
" Bundle "vim-scripts/VOoM.git"

Bundle 'Lokaltog/vim-easymotion'

Bundle 'scrooloose/nerdtree.git'

Bundle 'scrooloose/syntastic'

" NERDTree Commands
let g:NERDTreeWinSize=25
let NERDTreeWinSize=26
let g:NERDTreeWinPos = "left"
let g:NERDTreeIgnore = ['\.pyc$', '\.(bbl|brf|blg)$', '^.__', '\.aux$', '\.log$', '\.out$', '\.doc(x|)$', '\.toc$', '\.jpg$', '\.jpeg$', '\.swp$', '\.gif$', '\.rtf$', '\.pdf$', '\.png$', '\.bak$', '\.pyo$'] 
let g:nerdtree_tabs_open_on_gui_startup=0
nmap <leader>n :NERDTree<CR>
map <leader>e :NERDTreeFind<CR>
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
   if bufwinnr(t:NERDTreeBufName) != -1
     if winnr("$") == 1
       q
     endif
   endif
endif

set splitright
autocmd VimEnter * NERDTree     "run nerdtree
autocmd VimEnter * wincmd p     "cursor to right

" ctrlp
Bundle "kien/ctrlp.vim.git"
nmap <leader>t :CtrlP<CR>
nmap ; :CtrlPBuffer<CR>  " buffer search

let g:ctrlp_working_path_mode = 0
let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0


" Don't re-open buffers when it already exists
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                      \ exe "normal g'\"" | endif 

" Syntax highlight
Bundle "cucumber.zip"
" Bundle "Markdown"
Bundle "Soares/rainbow.vim.git"

" Tagbar
Bundle "majutsushi/tagbar.git"
map <leader>tb :TagbarToggle<cr>

" Python-dependent plugins
if has('python/dyn') || has('python')

        filetype plugin on
        Bundle 'ivanov/vim-ipython.git'

        "Bundle "MarcWeber/vim-addon-mw-utils"
        "Bundle "tomtom/tlib_vim"
        "Bundle "garbas/vim-snipmate"

        Bundle "honza/vim-snippets"

        let g:snips_author = 'Dustin A Smith'
        let g:snipMateAllowMatchingDot = 0

        """ python/supertab
        Bundle 'ervandew/supertab.git'
        let g:SuperTabDefaultCompletionType = "context"
        set completeopt=menuone,longest,preview


        " Python auto complete
        Bundle "davidhalter/jedi-vim.git"
      
        let g:jedi#auto_initialization = 0
        let g:jedi#auto_vim_configuration = 0
        let g:jedi#documentation_command = "?"
        let g:jedi#popup_on_dot = 1
        let g:jedi#use_splits_not_buffers = "bottom"
        let g:jedi#use_tabs_not_buffers = 1
        "let g:jedi#popup_select_first = 1


        " Smart indenting
        set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

        highlight WhitespaceEOL ctermbg=red guibg=red
        "match WhitespaceEOL /\s\+$/

        "Bundle 'nvie/vim-flake8'
        " Run <F7> 


        """ python/rope
        "map <leader>j :RopeGotoDefinition<CR>
        "map <leader>r :RopeRename<CR>

        au FileType python map K :python run_this_file()<CR>
        au FileType python map <silent> <S-F5> :python run_this_line()<CR>
        au FileType python vmap <silent> <F5> :python run_these_lines()<CR>
        au FileType python map <silent> <leader>d :py get_doc_buffer()<CR>
        au FileType python map <F6> :call <SID>toggle_send_on_save()<CR>
        au FileType python let b:did_ftplugin = 1
        map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
endif

" Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" Pandoc -- too slow to be usable
" Bundle 'vim-pandoc/vim-pandoc.git'
" let g:pandoc_bibfiles = ['/bib/papers.bib']
" let g:pandoc_use_bibtool = 1

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'

" non github repos
let g:CommandTMatchWindowAtTop=1 " show window at top

" Powerline
" Bundle "Lokaltog/powerline.git"
Bundle "Lokaltog/vim-powerline.git"
let g:Powerline_symbols = 'fancy'

" Color editor for vim
Bundle "Rykka/colorv.vim"

if has('gui_running')
        highlight clear SpellBad
        highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
        highlight clear SpellCap
        highlight SpellCap term=underline cterm=underline
        highlight clear SpellRars
        highlight SpellRare term=underline cterm=underline
        highlight clear SpellLocal
        highlight SpellLocal term=underline cterm=underline
endif
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set spell spelllang=en_us
set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp
set dir=~/.backup//

nnoremap <silent> <LocalLeader>rs :source ~/.vimrc<CR>
nnoremap <silent> <LocalLeader>rt :tabnew ~/.vim/vimrc<CR>
noremap <silent> <LocalLeader>re :e ~/.vim/vimrc<CR>
snoremap <silent> <LocalLeader>rd :e ~/.vim/ <CR>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Remap VIM 0 to first non-blank character
map 0 ^

if has('autocmd')
  au BufRead,BufNewFile {*.txt,*.md} set tw=100
  au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru} set ft=ruby
  au BufRead,BufNewFile {*.md,*.Pmd,*.mkd,*.markdown} set ft=pandoc
  au BufRead,BufNewFile {*.tex} set ft=latex
  autocmd FileType html,pandoc,latex,markdown set spell 
  " turn expandtab off for makefile
  autocmd FileType make setlocal noexpandtab
  au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4 colorcolumn=80 

  au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja 

  " show git diff in window split when committing
  autocmd FileType gitcommit DiffGitCached | wincmd p
  au BufRead,BufNewFile {COMMIT_EDITMSG}        set ft=gitcommit

  " coffeescript
  autocmd BufNewFile,BufRead *.coffee set filetype=coffee
" auto executable commands for python
" au FileType python map Q :w<CR>:!screen -x ipython -X stuff $'\nquit()\n'<CR><CR>:!screen -AmdS ipython ipython:!screen -R ipython
au FileType python map Q :w<CR>:!screen -x ipython -X stuff $'\%load_ext autoreload\n\%autoreload 2\n\%reset\ny\n\%cd %:p:h\n\%run %:t\n'<CR><CR>

au FileType scheme map K :w<CR>:!screen -x scheme -X stuff $'\n\ncd %:p:h \n rlwrap scheme --load %:t\n'<CR><CR>
au FileType scheme map C :w<CR>:!screen -x scheme -X stuff $'\n !R \n'<CR><CR>
au FileType scheme map Q :w<CR>:!screen -x scheme -X stuff $'\n<C-D>\n'<CR><CR>
" auto execute commands for prolog
"au FileType qml map K :w<CR>:!screen -x prolog -X stuff $'\n\ncd %:p:h \n qmlviewer  %:t\n'<CR><CR>
"au FileType prolog map K :w<CR>:!screen -x prolog -X stuff $'halt.\n\ncd %:p:h \n /usr/local/bin/yap \n [%:t:r].\n'<CR><CR>

endif

" select all text in buffer
map <Leader>a ggVG

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" split commands from http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/
" window
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>

" buffer
nmap <leader>sb<left>   :leftabove  vnew<CR>
nmap <leader>sb<right>  :rightbelow vnew<CR>
nmap <leader>sb<up>     :leftabove  new<CR>
nmap <leader>sb<down>   :rightbelow new<CR>

" split navigation
""nnoremap <C-h> <C-w>h
""nnoremap <C-j> <C-w>j
""nnoremap <C-k> <C-w>k
""nnoremap <C-l> <C-w>l

" previous buffer
noremap <C-e> :e#<CR>

" use arrow keys to change buffer
noremap <left> :bp<CR>
noremap <right> :bn<CR>

" improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

" jump to start/end using home row keys
noremap H ^
noremap L $


" force saving on root
cmap w!! %!sudo tee > /dev/null %

noremap fc <Esc>:call CleanClose(1)
noremap fq <Esc>:call CleanClose(0)


if has('gui_running')
        set guioptions-=T " remove the toolbar
        if has('gui_macvim')
            set transparency=5 " Make the window slightly transparent
        endif
else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
endif


function! CleanClose(tosave)
if (a:tosave == 1)
    w!
endif
let todelbufNr = bufnr("%")
let newbufNr = bufnr("#")
if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
    exe "b".newbufNr
else
    bnext
endif

if (bufnr("%") == todelbufNr)
    new
endif
exe "bd".todelbufNr
call Buftabs_show()
endfunction


nnoremap <silent> <Leader>bd :call CleanClose(1)
nnoremap <silent> <Leader>bD :Bclose!<CR>
