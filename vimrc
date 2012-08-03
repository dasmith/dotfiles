set nocompatible               " be iMproved
"set autoindent
"set cindent
set tabstop=2
set softtabstop=2
set expandtab   "tabs as space
set novisualbell " no blinking
set noerrorbells " no sounds
set laststatus=2 " always show status


" Font
set guifont=Meslo\ LG\ L\ DZ:h12

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

let mapleader = ","
inoremap jj <Esc>

" original repos on github
Bundle "git.zip"
Bundle 'tpope/vim-fugitive'


Bundle 'msanders/snipmate.vim.git'
Bundle 'scrooloose/nerdtree.git'
" NERDTree Commands
let NERDTreeWinSize=35
nmap <leader>n :NERDTree<cr>

" Syntax highlight
Bundle "cucumber.zip"
Bundle "Markdown"
Bundle "chrismetcalf/vim-rainbow.git"

" Python
Bundle "cburroughs/pep8.py"

Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'ivanov/vim-ipython.git'
let g:ipy_perform_mappings = 0
au FileType python map K :python run_this_file()<CR>
au FileType python map <silent> <S-F5> :python run_this_line()<CR>
au FileType python vmap <silent> <F5> :python run_these_lines()<CR>
au FileType python map <silent> <leader>d :py get_doc_buffer()<CR>
au FileType python map <F6> :call <SID>toggle_send_on_save()<CR>
Bundle 'tpope/vim-rails.git'
Bundle 'jkitzes/ipyqtmacvim'
Bundle 'vim-scripts/Color-Sampler-Pack.git'

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
let g:CommandTMatchWindowAtTop=1 " show window at top

syntax on
filetype plugin indent on     " required!

nnoremap <silent> <LocalLeader>rs :source ~/.vimrc<CR>
nnoremap <silent> <LocalLeader>rt :tabnew ~/.vim/vimrc<CR>
nnoremap <silent> <LocalLeader>re :e ~/.vim/vimrc<CR>
nnoremap <silent> <LocalLeader>rd :e ~/.vim/ <CR>

au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru} set ft=ruby

au BufRead,BufNewFile {*.md,*.mkd,*.markdown} set ft=markdown
au BufRead,BufNewFile {COMMIT_EDITMSG}                                set ft=gitcommit
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
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

autocmd FileType html,text,markdown  set spell 
set spell spelllang=en_us

" auto executable commands for python
"au FileType python map Q :w<CR>:!screen -x ipython -X stuff $'\nquit()\n'<CR><CR>:!screen -AmdS ipython ipython:!screen -R ipython

" auto execute commands for prolog
"au FileType qml map K :w<CR>:!screen -x prolog -X stuff $'\n\ncd %:p:h \n qmlviewer  %:t\n'<CR><CR>
au FileType prolog map K :w<CR>:!screen -x prolog -X stuff $'halt.\n\ncd %:p:h \n /usr/local/bin/yap \n [%:t:r].\n'<CR><CR>



" select all text in buffer
map <Leader>a ggVG

" colorscheme gmarik

" show git diff in window split when committing
autocmd FileType gitcommit DiffGitCached | wincmd p

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" force saving on root
cmap w!! %!sudo tee > /dev/null %


