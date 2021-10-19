set nocompatible              " be iMproved, required 
filetype off                  " required

set encoding=utf8
" set cmdheight=2
set shortmess+=c
set fileencoding=utf8
set termguicolors
set pumheight=8
set fillchars+=stl:\ ,stlnc:\
set path=**
set nu
set splitbelow
set splitright
set nowrap
set list
set number
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
" set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:«
set listchars=tab:·\ ,trail:·,extends:»,precedes:«
" :set nolist
set autowriteall
set hidden
set confirm
set laststatus=2
set completeopt=longest,menuone,preview
" set completeopt-=preview
set incsearch ignorecase hlsearch
set smartcase
set whichwrap+=h,l
set visualbell
set noerrorbells
set nobackup
set noswapfile
set nowritebackup
set guioptions=
set foldmethod=marker
set foldmarker={,}
set foldnestmax=1
set foldlevel=99
set foldlevelstart=99
set foldnestmax=3
set showcmd
set wildmenu
set wildmode=longest:full,full
set backspace=indent,eol,start
set cursorline
set novb
set nohlsearch
set exrc
set secure
set autowrite
set autoread
"set relativenumber
set linespace=3
set updatetime=300
set conceallevel=0
set conceallevel=1
set background=dark
set cmdheight=2
set sessionoptions-=help
set sessionoptions-=tabpages
set laststatus=2 " Seperate lines for state and mode
set lazyredraw            " improve scrolling performance when navigating through large results
" set wildignore+=*/node_modules/*
" set wildignore+=*/.mypy_cache/*
" set wildignore+=*/.pytest_cache/*
" set wildignore+=*/.serverless/*
" set wildignore+=*/.git/*
" set wildignore+=*/.*/*
" https://github.com/HerringtonDarkholme/yats.vim/issues/25
" set regexpengine=1        " use old regexp engine

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
set splitright
set nowrap
set list
set number
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab


set rtp+=~/.local/share/nvim/plugged/ultisnips/

call plug#begin('~/.local/share/nvim/site/plugged')

if exists('g:vscode')
      " VSCode extension
else
  Plug 'tpope/vim-sensible'
  Plug 'Lokaltog/vim-easymotion'
  " Plug 'git-time-metric/gtm-vim-plugin'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'notpratheek/vim-luna'
  Plug 'mbbill/undotree'
  Plug 'LnL7/vim-nix'
  Plug 'tomtom/tcomment_vim'
  Plug 'godlygeek/tabular'
  " Plug 'chriskempson/base16-vim'
  Plug 'tpope/vim-surround'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'mhinz/vim-startify'
  Plug 'Raimondi/delimitMate'
  Plug 't9md/vim-smalls'
  Plug 'tpope/vim-repeat'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Plug 'brooth/far.vim'
  Plug 'lvht/fzf-mru'
  Plug 'xolox/vim-misc'
  Plug 'tpope/vim-fugitive'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tpope/vim-unimpaired'
  Plug 'mhartington/vim-typings'
  Plug 'sheerun/vim-polyglot'
  Plug 'grvcoelho/vim-javascript-snippets'
  Plug 'alok/notational-fzf-vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/goyo.vim'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'wookayin/vim-autoimport'
  Plug 'pechorin/any-jump.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'puremourning/vimspector'
  Plug 'vim-test/vim-test'
  Plug 'voldikss/vim-floaterm'
  " Plug 'stefandtw/quickfix-reflector.vim'
  " Plug 'rafi/awesome-vim-colorschemes'
  Plug 'joshdick/onedark.vim'
  Plug 'brooth/far.vim'
  Plug 'kassio/neoterm' 
  " Plug 'wincent/ferret'
  Plug 'kovetskiy/sxhkd-vim'
  " Plug 'sagi-z/vimspectorpy'
  
  let mapleader=","
  let g:nv_search_paths = ["~/notes"]
  let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
  let $NVIM_NCM_LOG_LEVEL="DEBUG"
  let $NVIM_NCM_MULTI_THREAD=0

  call plug#end()

  filetype plugin indent on
  syntax on

  let filename = '.gitignore'
  if filereadable(filename)
      let igstring = ''
      for oline in readfile(filename)
          let line = substitute(oline, '\s|\n|\r', '', "g")
          if line =~ '^#' | con | endif
          if line == '' | con  | endif
          if line =~ '^!' | con  | endif
          if line =~ '/$' | let igstring .= "," . line . "*" | con | endif
          let igstring .= "," . line
      endfor
      let execstring = "set wildignore=".substitute(igstring, '^,', '', "g")
      execute execstring
  endif
  
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let g:onedark_termcolors=256
  let g:onedark_terminal_italics=1

  let g:smalls_auto_excursion = 1
  let g:smalls_auto_excursion_min_input_length = 1

  let g:airline#extensions#ale#enabled = 1
  
  let g:far#enable_undo=1
  let g:far#source='rgnvim'
  let g:far#file_mask_favorites=['%:p', '**/*.*', '**/*.js', '**/*.py', '**/*.java', '**/*.css', '**/*.html', '**/*.vim', '**/*.cpp', '**/*.c', '**/*.h', ]

  let test#python#runner = 'pytest'
  " let test#strategy = "vimspectorpy"
  let g:test#preserve_screen = 1

  let g:vimspector_enable_mappings = 'HUMAN'

  if has('nvim')
    tmap <C-o> <C-\><C-n>
  endif

  if has ('gui')
    set clipboard+=unnamed
  else
    set clipboard+=unnamedplus
  endif

  if has("persistent_undo")
      set undodir="$HOME/.undodir"
      set undofile
  endif

  function! s:fzf_statusline()
    highlight fzf1 ctermfg=161 ctermbg=251
    highlight fzf2 ctermfg=23 ctermbg=251
    highlight fzf3 ctermfg=237 ctermbg=251
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
  endfunction

  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!node_modules/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
  set grepprg=rg\ --vimgrep
  " set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m

  autocmd! User FzfStatusLine call <SID>fzf_statusline()

  let g:fzf_history_dir = '~/.local/share/fzf-history'
  let g:fzf_preview_command = 'bat'
  let g:fzf_buffers_jump = 1
  let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
  let g:fzf_mru_file_list_size = 10 " default value
  let g:fzf_mru_ignore_patterns = 'fugitive\|\.git/\|\_^/tmp/' " default value
  let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

  let g:fzf_buffers_jump = 1

  " icons
  "   \ "Modified"  : "✹",
  "   \ "Staged"    : "✚",
  "   \ "Untracked" : "✭",
  "   \ "Renamed"   : "➜",
  "   \ "Unmerged"  : "═",
  "   \ "Deleted"   : "✖",
  "   \ "Dirty"     : "✗",
  "   \ "Clean"     : "✔︎",
  "   \ 'Ignored'   : '☒',
  "   \ "Unknown"   : "?"
  "

  let g:session_autosave = 'yes' 
  let g:session_autoload = 'yes' 
  let g:session_autosave_periodic = 'yes'

  let g:AutoPairsFlyMode = 1
  let g:smartusline_string_to_highlight = '(%n) %f '

  let g:startify_restore_position = 1
  let g:startify_list_order = ['sessions', 'files', 'bookmarks']
  let g:startify_enable_unsafe = 1
  let g:startify_enable_special      = 1
  let g:startify_files_number        = 8
  let g:startify_relative_path       = 1
  let g:startify_change_to_dir       = 1
  let g:startify_update_oldfiles     = 1
  let g:startify_session_autoload    = 1
  let g:startify_session_persistence = 1
  let g:startify_session_dir = '~/.config/nvim/sessions'
  let g:startify_change_to_vcs_root = 1

  let g:qf_modifiable = 1

  autocmd User Startified setlocal cursorline

  let g:yankstack_map_keys = 0

  let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
  let g:EasyMotion_use_smartsign_us = 1 
  let g:EasyMotion_smartcase = 1
  let g:EasyMotion_use_upper = 1

  " hi link EasyMotionTarget Search
  " hi link EasyMotionTarget2First Search
  " hi link EasyMotionTarget2Second Search
  " hi link EasyMotionShade Comment

  " hi! link Sneak Search

  let g:gtm_plugin_status_enabled = 1

  function! AirlineInit()
    if exists('*GTMStatusline')
      call airline#parts#define_function('gtmstatus', 'GTMStatusline')
      let g:airline_section_b = airline#section#create([g:airline_section_b, ' ', '[', 'gtmstatus', ']'])
    endif
  endfunction
  autocmd User AirlineAfterInit call AirlineInit()

    " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  " Navigate snippet placeholders using tab
  let g:coc_snippet_next = '<Tab>'
  let g:coc_snippet_prev = '<S-Tab>'

  " Use enter to accept snippet expansion
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
   
  " inoremap <silent><expr> <TAB>
  "       \ pumvisible() ? "\<C-n>" :
  "       \ <SID>check_back_space() ? "\<TAB>" :
  "       \ coc#refresh()
  " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  let g:coc_global_extensions = [
        \ "coc-yank", "coc-yaml", "coc-spell-checker", "coc-snippets",
        \ "coc-json", "coc-highlight", "coc-git", 'coc-json', 'coc-diagnostic',
        \ "coc-explorer", "coc-pyright", "coc-cfn-lint", "coc-fzf-preview",
        \ "coc-marketplace", "coc-docker", "coc-lists", "coc-tsserver", "coc-eslint"
        \ ]


  let g:fzf_layout = { 'down': '~40%' }

  " You can set up fzf window using a Vim command (Neovim or ladupa Vim 8 required)
  let g:fzf_layout = { 'window': 'enew' }
  let g:fzf_layout = { 'window': '-tabnew' }
  let g:fzf_layout = { 'window': '10new' }
  "
  " let g:far#sources = {
  "   \   'rgnvim': {
  "   \       'args': {
  "   \           'cmd': ['rg', '--column', 
  "   \                   '--max-count={limit}', '{pattern}',
  "   \                   '--glob=**/node_modules', '--glob=.git']
  "   \       }}}

  " Customize fzf colors to match your color scheme
  " - fzf#wrap translates this to a set of `--color` options
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

  let g:fzf_preview_window = 'right:60%'
  let g:fzf_buffers_jump = 1

  " [[B]Commits] Customize the options used by 'git log':
  let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

  " [Tags] Command to generate tags file
  let g:fzf_tags_command = 'ctags -R'

  " [Commands] --expect expression for directly executing the command
  let g:fzf_commands_expect = 'alt-enter,ctrl-x'

  nmap <silent> <leader>x <Plug>(coc-cursors-position)
  nmap <silent> <leader>mw <Plug>(coc-cursors-word)
  xmap <silent> <leader>mr <Plug>(coc-cursors-range)
  " use normal command like `<leader>xi(`
  nmap <leader>ms  <Plug>(coc-cursors-operator)

  nmap <expr> <silent> <m-d> <SID>select_current_word()
  function! s:select_current_word()
    if !get(g:, 'coc_cursors_activated', 0)
      return "\<Plug>(coc-cursors-word)"
    endif
    return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
  endfunc

  autocmd VimEnter *
    \   if !argc()
    \ |   Startify
    \ |   wincmd w
    \ | endif

  let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   Recent fiiles']            },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      }
        \ ]
        " \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        "

  let g:nv_default_extension = '.md'
  let g:nv_create_note_key = 'ctrl-n'
  " let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_exclude_filetypes = ['nerdtree', 'startify', 'coc-explorer', 'fzf']


  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
  "
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail'
  " let g:airline_powerline_fonts = 1
  " " hilight search result by default
  " let g:FerretHlsearch=1
  " " let g:FerretNvim = 0
  " " let g:FerretJob = 0
  " let g:FerretExecutable='rg,ack,ag'

    let g:coc_explorer_global_presets = {
  \   'tab': {
  \     'position': 'tab',
  \     'quit-on-open': v:true,
  \   },
  \   'tab:$': {
  \     'position': 'tab:$',
  \     'quit-on-open': v:true,
  \   },
  \   'floating': {
  \     'position': 'floating',
  \     'open-action-strategy': 'sourceWindow',
  \   },
  \   'floatingTop': {
  \     'position': 'floating',
  \     'floating-position': 'center-top',
  \     'open-action-strategy': 'sourceWindow',
  \   },
  \   'floatingLeftside': {
  \     'position': 'floating',
  \     'floating-position': 'left-center',
  \     'floating-width': 50,
  \     'open-action-strategy': 'sourceWindow',
  \   },
  \   'floatingRightside': {
  \     'position': 'floating',
  \     'floating-position': 'right-center',
  \     'floating-width': 50,
  \     'open-action-strategy': 'sourceWindow',
  \   },
  \   'simplify': {
  \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
  \   },
  \   'buffer': {
  \     'sources': [{'name': 'buffer', 'expand': v:true}]
  \   },
  \ }

" prefer to use rg

  " colorscheme base16-material
  colorscheme onedark

  "KEYS

  map <Leader>rs :source $MYVIMRC <CR>
  map <silent> <m-,> :e $MYVIMRC<CR>
  nnoremap \ :CocSearch -w <cword><CR>
  nnoremap <leader>cpr :CocSearch <C-R>=expand("<cword>")<CR><CR>

  imap jj <Esc>

  nnoremap j gj
  nnoremap k gk

  nmap <C-Up> [e
  nmap <C-Down> ]e
  vmap <C-Up> [egv
  vmap <C-Down> ]egv
  "

  "
  nnoremap <A-j> :m .+1<CR>==
  nnoremap <A-k> :m .-2<CR>==
  inoremap <A-j> <Esc>:m .+1<CR>==gi
  inoremap <A-k> <Esc>:m .-2<CR>==gi
  vnoremap <A-j> :m '>+1<CR>gv=gv
  vnoremap <A-k> :m '<-2<CR>gv=gv

  if exists('$TMUX') == 0
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l
  endif

  map <leader>c "+y
  map <leader>v "+p

  " map <leader>] :bnext<CR>
  " map <leader>[ :bprevious<CR>

  map [t :tabprevious<CR>
  map ]t :tabnext<CR>

  nnoremap <a-i> 40<c-w><
  nnoremap <a-o> 40<c-w>>

  nnoremap <up> <nop>
  nnoremap <down> <nop>
  nnoremap <left> <nop>
  nnoremap <right> <nop>

  inoremap <up> <nop>
  inoremap <down> <nop>
  inoremap <left> <nop>
  inoremap <right> <nop>

  map <C-right> <ESC>:bn<CR>
  map <C-left> <ESC>:bp<CR>

  map <leader>bd :bd<cr>

  nmap <silent> <leader>fh :UndotreeToggle<CR>

  " nnoremap <silent><tab>  : FzfPreviewBuffers<CR>
  " nnoremap <silent><c-p>  : FzfPreviewGitFiles<CR>
  nnoremap <silent><leader>fr : FZFMru "<C-r>=nd('<cword>')<CR>"<CR>
  nnoremap <silent><leader>fw : FzfPreviewProjectGrep "<C-r>=expand('<cword>')<CR>"<CR>
  nnoremap <silent><leader>,fl :FzfPreviewLines<CR>
  nnoremap <silent> <leader>mm : History<CR>
  nnoremap <silent> <leader>gc  : BCommits<CR>
  nnoremap <silent> <m-f> :exe 'CocSearch -w '.expand('<cword>')<CR>

  nmap <leader>ss <Plug>(smalls)
  omap <leader>ss <Plug>(smalls)
  xmap <leader>ss <Plug>(smalls)

  map  / <Plug>(easymotion-sn)
  omap / <Plug>(easymotion-tn)
  map  n <Plug>(easymotion-next)
  map  N <Plug>(easymotion-prev)

  nnoremap - g$
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:<CR>
  vmap <Leader>a: :Tabularize /:<CR>
  nmap <Leader>a:: :Tabularize /:\zs<CR>
  vmap <Leader>a:: :Tabularize /:\zs<CR>
  nmap <Leader>a, :Tabularize /,<CR>
  vmap <Leader>a, :Tabularize /,<CR>
  nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
  vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

  inoremap <silent><expr> <c-space> coc#refresh()

  nnoremap <silent> <leader>gh :call CocActionAsync('doHover')<cr> 
  nnoremap <silent> <leader>rd :call vimspector#Launch()<cr>

  nmap <silent> [e <Plug>(coc-diagnostic-prev)
  nmap <silent> ]e <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gt <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  nmap <leader>rn <Plug>(coc-rename)
  xmap <leader>cf  <Plug>(coc-format-selected)
  nmap <leader>cf  <Plug>(coc-format-selected)

  map <leader>ca  <Plug>(coc-codeaction-selected)<CR>
  nmap <leader>ac  <Plug>(coc-codeaction)<CR>
  nmap <leader>qf  <Plug>(coc-fix-current)<CR>

  nmap <Leader>f [fzf-p]
  xmap <Leader>f [fzf-p]

  nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
  nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
  nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
  nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
  nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
  nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
  nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
  nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
  nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
  nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
  nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
  xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
  nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
  nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
  nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>

  " hilight search result by default
  let g:FerretHlsearch=1
  " prefer to use rg
  let g:FerretExecutable='ack,rg,ag'

  " Introduce function text object
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  nnoremap <silent> <space>r  :<C-u>CocListResume<CR>
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

  nmap <silent> <c-f> :CocCommand explorer --toggle --sources=buffer+,file+<CR>
  nmap <silent> <d-1> :CocCommand explorer --toggle --sources=buffer+,file+<CR>

  function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
  endfunction
  xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
  nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

  " FIND AND REPLACE
  let g:far#enable_undo=1

  nnoremap <silent> <C-S>  :Farf<cr>
  vnoremap <silent> <C-S>  :Farf<cr>
  nnoremap <silent> <C-A>  :Farr<cr>
  vnoremap <silent> <C-A>  :Farr<cr>

  nnoremap <silent> <C-P> :call Fzf_dev()<CR>

  " ripgrep
  if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'fdfind --type file --color=always'
    set grepprg=rg\ --vimgrep
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
  endif

  " Files + devicons
  function! Fzf_dev()
    let l:fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'

    function! s:files()
      let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
      return s:prepend_icon(l:files)
    endfunction

    function! s:prepend_icon(candidates)
      let l:result = []
      for l:candidate in a:candidates
        let l:filename = fnamemodify(l:candidate, ':p:t')
        let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
        call add(l:result, printf('%s %s', l:icon, l:candidate))
      endfor

      return l:result
    endfunction

    function! s:edit_file(item)
      let l:pos = stridx(a:item, ' ')
      let l:file_path = a:item[pos+1:-1]
      execute 'silent e' l:file_path
    endfunction

    call fzf#run({
          \ 'source': <sid>files(),
          \ 'sink':   function('s:edit_file'),
          \ 'options': '-m ' . l:fzf_files_options,
          \ 'down':    '40%' })
  endfunction

  let loaded_netrwPlugin = 1

  let g:lsc_server_commands = {'java': '~/Documents/tools/java-language-server/dist/lang_server_mac.sh'}

  " Use all the defaults (recommended):
  let g:lsc_auto_map = v:true

  " Apply the defaults with a few overrides:
  let g:lsc_auto_map = {'defaults': v:true, 'FindReferences': '<leader>r'}

  " Setting a value to a blank string leaves that command unmapped:
  let g:lsc_auto_map = {'defaults': v:true, 'FindImplementations': ''}

  " ... or set only the commands you want mapped without defaults.
  " Complete default mappings are:
  let g:lsc_auto_map = {
      \ 'GoToDefinition': '<C-]>',
      \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
      \ 'FindReferences': 'gr',
      \ 'NextReference': '<C-n>',
      \ 'PreviousReference': '<C-p>',
      \ 'FindImplementations': 'gI',
      \ 'FindCodeActions': 'ga',
      \ 'Rename': 'gR',
      \ 'ShowHover': v:true,
      \ 'DocumentSymbol': 'go',
      \ 'WorkspaceSymbol': 'gS',
      \ 'SignatureHelp': 'gm',
      \ 'Completion': 'completefunc',
      \}

    " ordinary neovim
    "
    " hi! CocErrorSign guifg=#d1666a
    highlight link CocErrorSign GruvboxRed

endif
