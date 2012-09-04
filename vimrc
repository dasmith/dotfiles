set nocompatible               " be iMproved
set autoindent
set cindent
set tabstop=2
set softtabstop=2
set expandtab   "tabs as space
set novisualbell " no blinking
set noerrorbells " no sounds
set laststatus=2 " always show status

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

Bundle 'spolu /dwm.vim.git'

" original repos on github
Bundle "git.zip"
Bundle 'tpope/vim-fugitive'

Bundle 'vim-scripts/Color-Sampler-Pack.git'
colorscheme peaksea
"colorscheme railscasts2   

" Show table of contents for 
" Markdown documents in left pane
Bundle "vim-scripts/VOoM.git"
Bundle "ervandew/supertab.git"
Bundle 'msanders/snipmate.vim.git'
let g:snips_author = 'Dustin A Smith'
let g:snipMateAllowMatchingDot = 0

Bundle 'scrooloose/nerdtree.git'
" NERDTree Commands
let NERDTreeWinSize=35
let NERDTreeIgnore = ['\.pyc$', '\.(bbl|brf|blg)$', '\.aux$', '\.log$', '\.out$', '\.doc(x|)$', '\.toc$', '\.jpg$', '\.jpeg$', '\.gif$', '\.rtf$', '\.pdf$', '\.bak$', '\.pyo$'] 
nmap <leader>n :NERDTree<CR>

Bundle "kien/ctrlp.vim.git"
nmap <leader>t :CtrlP<CR>
"runtime! plugin/ctrlp.vim
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$',
\ 'file': '\.pdf$\|\.swp$|\.gif$|\.jpeg$|\.jpg$|\.so$\|\.dat$'
\ }

" Syntax highlight
Bundle "cucumber.zip"
" Bundle "Markdown"
Bundle "Soares/rainbow.vim.git"

"Bundle "chrismetcalf/vim-rainbow.git"

" Python
Bundle "cburroughs/pep8.py"
Bundle 'ivanov/vim-ipython.git'


au FileType python map K :python run_this_file()<CR>
au FileType python map <silent> <S-F5> :python run_this_line()<CR>
au FileType python vmap <silent> <F5> :python run_these_lines()<CR>
au FileType python map <silent> <leader>d :py get_doc_buffer()<CR>
au FileType python map <F6> :call <SID>toggle_send_on_save()<CR>

Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'

" Pandoc
Bundle 'vim-pandoc/vim-pandoc.git'
let g:pandoc_bibfiles = ['/bib/papers.bib']
let g:pandoc_use_bibtool = 1
let g:SuperTabDefaultCompletionType = "context"

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

au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru} set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown} set ft=pandoc
au BufRead,BufNewFile {COMMIT_EDITMSG}        set ft=gitcommit
autocmd FileType html,text,pandoc,markdown set spell 
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4


" auto executable commands for python
"au FileType python map Q :w<CR>:!screen -x ipython -X stuff $'\nquit()\n'<CR><CR>:!screen -AmdS ipython ipython:!screen -R ipython

" auto execute commands for prolog
"au FileType qml map K :w<CR>:!screen -x prolog -X stuff $'\n\ncd %:p:h \n qmlviewer  %:t\n'<CR><CR>
"au FileType prolog map K :w<CR>:!screen -x prolog -X stuff $'halt.\n\ncd %:p:h \n /usr/local/bin/yap \n [%:t:r].\n'<CR><CR>


" select all text in buffer
map <Leader>a ggVG

" show git diff in window split when committing
autocmd FileType gitcommit DiffGitCached | wincmd p

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


