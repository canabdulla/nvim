call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'ggandor/leap.nvim'
Plug 'tpope/vim-repeat'
"Plug 'MrcJkb/haskell-tools.nvim'

" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

"KEYBINDINGS
"CTRL+S CTRL+D CTRL+Q
inoremap <C-s> <esc>:w<cr>a
nnoremap <C-s> :w<cr>
inoremap <C-d> <esc>:wq!<cr>
nnoremap <C-d> :wq!<cr>
inoremap <C-q> <esc>:qa!<cr>
nnoremap <C-q> :qa!<cr>

"GENERAL NVIM
set mouse=a
set number
set scrolloff=7

"LEAP
"lua require('leap').add_default_mappings()

"ULTISNIP
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetsDir=$HOME.'/.config/nvim/UltiSnips'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips', 'UltiSnips']

"HACKY AUTOFOCUS
augroup init_vimtex
  autocmd!
  autocmd User VimtexEventViewReverse call b:vimtex.viewer.xdo_focus_vim()
augroup END

if !exists("g:vim_window_id")
  let g:vim_window_id = system("xdotool getactivewindow")
endif

"VIMTEX
let g:vimtex_fold_enabled = 1

"castel.dev
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'

let g:tex_flavor='latex'
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura_simple'

let g:vimtex_complete_enabled = 1
let g:vimtex_syntax_enabled   = 1  


" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","
hi clear Conceal
