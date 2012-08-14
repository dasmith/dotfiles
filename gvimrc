
"colorscheme pyte
set shortmess=at

if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CtrlP<CR>
endif


if has('statusline')
  set laststatus=2
	" Broken down into easily includeable segments
	set statusline=%<%f\ " Filename
	set statusline+=%w%h%m%r " Options
	set statusline+=%{fugitive#statusline()} " Git Hotness
	set statusline+=\ [%{&ff}/%Y] " filetype
	set statusline+=\ [%{getcwd()}] " current dir
	"set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
	set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif
