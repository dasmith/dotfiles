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

" Scheme
" Font
set guifont=Meslo\ LG\ L\ DZ:h12

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,.pyc
set wildignore+=*/tmp/*,*.so,*.swp,*.zip


filetype off                  " required!
filetype plugin indent on     " required!

let mapleader = ","
inoremap jj <Esc>

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 
" vim-scripts repos
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'spolu/dwm.vim.git'

" original repos on github
Bundle "git.zip"
Bundle 'tpope/vim-fugitive'

Bundle 'vim-scripts/Color-Sampler-Pack.git'
color codeschool
" colorscheme peaksea
"colorscheme railscasts2

" Show table of contents for 
" Markdown documents in left pane
" Bundle "vim-scripts/VOoM.git"
Bundle 'msanders/snipmate.vim.git'
let g:snips_author = 'Dustin A Smith'
let g:snipMateAllowMatchingDot = 0

Bundle 'scrooloose/nerdtree.git'
" NERDTree Commands
let NERDTreeWinSize=30
let NERDTreeShowBookmarks=1
let NERDTreeIgnore = ['\.pyc$', '\.(bbl|brf|blg)$', '^.__', '\.aux$', '\.log$', '\.out$', '\.doc(x|)$', '\.toc$', '\.jpg$', '\.jpeg$', '\.swp$', '\.gif$', '\.rtf$', '\.pdf$', '\.png$', '\.bak$', '\.pyo$'] 
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
nmap <leader>n :NERDTree<CR>
map <leader>e :NERDTreeFind<CR>

Bundle "kien/ctrlp.vim.git"


" ctrlp
nmap <leader>t :CtrlP<CR>

let g:ctrlp_working_path_mode = 0
let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_custom_ignore = '.pyc'


" Don't re-open buffers when it already exists
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                      \ exe "normal g'\"" | endif 

" Syntax highlight
Bundle "cucumber.zip"
" Bundle "Markdown"
Bundle "Soares/rainbow.vim.git"

"Bundle "chrismetcalf/vim-rainbow.git"

" Tagbar
Bundle "majutsushi/tagbar.git"
map <leader>tb :TagbarToggle<cr>

" Python

" debugging tools
Bundle "cburroughs/pep8.py"
Bundle 'kevinw/pyflakes-vim.git'
" Bundle 'sontek/rope-vim.git'

" Python-dependent plugins
if has('python/dyn') || has('python')
        Bundle 'ivanov/vim-ipython.git'
        Bundle "mjbrownie/pythoncomplete.vim"
        " Python auto complete
        " Bundle 'dasmith/jedi-vim.git'
        " let g:jedi#auto_initialization = 0
        " let g:jedi#pydoc = "U"
        " let g:jedi#rename_command = "<leader>R"
        " let g:jedi#popup_on_dot = 1
        " let g:jedi#show_function_definition = 0
        " autocmd FileType python let b:did_ftplugin = 1
        " shift+U shows the pydoc
        " disabling these two since it crashes on large files (like importing google.appengine.ext)
        " let g:jedi#related_names_command = "<leader>S"
        "let g:jedi#use_tabs_not_buffers = 0

        if has('shit') 

        " Bundle "Shougo/neocomplcache.git"
        " Disable autocomplpop
        " let g:acp_enableAtStartup = 0
        " let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_underbar_completion = 1
        let g:neocomplcache_min_syntax_length = 3
        let g:neocomplcache_enable_auto_delimiter = 1
        let g:neocomplcache_max_list = 15
        let g:neocomplcache_auto_completion_start_length = 3
        let g:neocomplcache_force_overwrite_completefunc = 1
        "let g:neocomplcache_snippets_dir='~/.vim/bundle/snipmate-snippets/snippets'
        if !exists('g:neocomplcache_omni_functions')
            let g:neocomplcache_omni_functions = {}
        endif
        if !exists('g:neocomplcache_force_omni_patterns')
            let g:neocomplcache_force_omni_patterns = {}
        endif
        let g:neocomplcache_force_overwrite_completefunc = 1
        let g:neocomplcache_force_omni_patterns['python'] = '[^. \t]\.\w*'
        " let g:neocomplcache_omni_functions['python'] = 'jedi#complete'
        let g:neocomplcache_omni_functions['python'] = 'pythoncomplete#Complete'
      endif
        " Some ideas can be found here: https://github.com/NagatoPain/dotfiles/blob/master/.vim/vimrc
        au FileType python set omnifunc=pythoncomplete#Complete
        au FileType python map K :python run_this_file()<CR>
        au FileType python map <silent> <S-F5> :python run_this_line()<CR>
        au FileType python vmap <silent> <F5> :python run_these_lines()<CR>
        au FileType python map <silent> <leader>d :py get_doc_buffer()<CR>
        au FileType python map <F6> :call <SID>toggle_send_on_save()<CR>
        au FileType python let b:did_ftplugin = 1
endif

" Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'

" Pandoc
Bundle 'vim-pandoc/vim-pandoc.git'
let g:pandoc_bibfiles = ['/bib/papers.bib']
let g:pandoc_use_bibtool = 1

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'

" non github repos
let g:CommandTMatchWindowAtTop=1 " show window at top


highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRars
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
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
  au BufRead,BufNewFile {*.md,*.mkd,*.markdown} set ft=pandoc
  autocmd FileType html,pandoc,markdown set spell 
  " turn expandtab off for makefile
  autocmd FileType make setlocal noexpandtab
  au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4 colorcolumn=80 

  " show git diff in window split when committing
  autocmd FileType gitcommit DiffGitCached | wincmd p
  au BufRead,BufNewFile {COMMIT_EDITMSG}        set ft=gitcommit

" auto executable commands for python
"au FileType python map Q :w<CR>:!screen -x ipython -X stuff $'\nquit()\n'<CR><CR>:!screen -AmdS ipython ipython:!screen -R ipython

" auto execute commands for prolog
"au FileType qml map K :w<CR>:!screen -x prolog -X stuff $'\n\ncd %:p:h \n qmlviewer  %:t\n'<CR><CR>
"au FileType prolog map K :w<CR>:!screen -x prolog -X stuff $'halt.\n\ncd %:p:h \n /usr/local/bin/yap \n [%:t:r].\n'<CR><CR>

endif

" select all text in buffer
map <Leader>a ggVG

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" clear search hilights
noremap <silent><Leader>/ :nohls<CR>

" split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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


function! NERDTreeInitAsNeeded()
    redir => bufoutput
    buffers!
    redir END
    let idx = stridx(bufoutput, "NERD_tree")
    if idx > -1
        NERDTreeMirror
        NERDTreeFind
        wincmd l
    endif
endfunction

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
