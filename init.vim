" SETS
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set autoindent
set autoread
set shiftwidth=4
set expandtab
set smartindent
set nu rnu " hybrid line numbers
set wrap
set noswapfile
set nobackup
" set undodir=~/.vim/undodir
set undodir=~/.nvim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set signcolumn=yes
set cursorline
set isfname+=@-@
set ls=0
set laststatus=2
" set statusline=%F%m
" Give more space for displaying messages.
set cmdheight=1
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set colorcolumn=120
set completeopt=menu
set ignorecase
set smartcase
" set spell spelllang=en_us
set nospell " let spelunker plugin handle spellcheck
set pastetoggle=<F2>
set nofoldenable
set mouse=a

syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM-PLUG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'fisadev/vim-isort'
Plug 'dkprice/vim-easygrep'
Plug 'yegappan/mru'
Plug 'mg979/vim-visual-multi'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-rooter'
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'
Plug 'joeytwiddle/sexy_scroller.vim'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
" Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'ojroques/nvim-osc52'
Plug 'ibhagwan/smartyank.nvim'
Plug 'roguelazer/variables_file.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive', { 'tag': 'v2.3' } " using v2.3 so it works with airline
Plug 'kamykn/spelunker.vim'
Plug 'kamykn/popup-menu.nvim' " for spelunker
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" Plug 'Pocco81/auto-save.nvim'
Plug 'svban/YankAssassin.vim'
Plug 'tpope/vim-rhubarb'
Plug 'lanej/vim-phabricator'

" Colors
" Plug 'gruvbox-community/gruvbox'
" Plug 'catppuccin/nvim', { 'tag': 'v0.2.4', 'as': 'catppuccin'}
" Plug 'crusoexia/vim-monokai'
Plug 'nordtheme/vim'
Plug 'cormacrelf/vim-colors-github'

" NOTES on getting fzf theme to match nord:
" need to add `export BAT_THEME="Nord"` to your .bashrc
" and, add `COLORTERM="truecolor"` to your .bashrc
" https://github.com/junegunn/fzf.vim/issues/969#issuecomment-611611154


" LSP-related plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'

" Go-related stuff
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

" Vim devicons
Plug 'ryanoasis/vim-devicons' " Always load the vim-devicons as the very last one.
 " Note: install the NERD font in OS X https://github.com/ryanoasis/nerd-fonts#font-installation
 " and set non-ASCII font to the installed font in your iTerm settings
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => COLORS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme gruvbox
" colorscheme catppuccin
" colorscheme monokai
colorscheme nord

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MAPS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = " "
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
" nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>= :vertical resize +20<CR>
nnoremap <Leader>- :vertical resize -20<CR>

" indents
nnoremap <S-Tab> <<
nnoremap <Tab> >>
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv
inoremap <S-Tab> <C-d>

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Move one line
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

command! ClearQuickfixList cexpr []
nmap <leader>cf :ClearQuickfixList<cr>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <c-S-Right> gt
noremap <c-S-Left> gT

nnoremap <Leader>7 :tabnew $MYVIMRC<cr>
nnoremap <Leader>8 :tabnew ~/.gitignore<cr>
nnoremap <Leader>9 :tabnew ~/.bashrc<cr>

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

" press // to search selected text in visual mode
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" buffers
map <leader>b :Buffers<CR>

" tags, marks
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  gg"+yG
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Wrapped lines goes down/up to next row, rather than next line in file.
" noremap j gj
" noremap k gk

" If I don't let off the shift key quick enough
command! Q :q
command! Qa :qa
command! W :w
command! Wa :wa
command! Wqa :wqa
command! Qwa :wqa
command! E :e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGIN CONFIGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Undotree
nnoremap <leader>u :UndotreeToggle<CR>

 " Mru
nnoremap <C-o> :Mru<CR>

 " nvim-window
map <silent> <leader>w :lua require('nvim-window').pick()<CR>

 " rg
nnoremap <C-f> :Rg<CR>
nnoremap <leader>f :Rg <C-R><C-W><CR>

 " Git Hunks
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

 " fzf
map <C-p> :Files<CR>

let g:fzf_tags_command = 'ctags -R --exclude=.git .'
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

" Get Files
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Get text in files with Rg
command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
            \   fzf#vim#with_preview(), <bang>0)
" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always
    --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

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

 " Git grep (broken?)
command! -bang -nargs=* GGrep
            \ call fzf#vim#grep(
            \   'git grep --line-number '.shellescape(<q-args>), 0,
            \   fzf#vim#with_preview({'dir': systemlist('git rev-parse--show-toplevel')[0]}), <bang>0)

 " Ack / Ag
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack!
cnoreabbrev aG Ack!
cnoreabbrev Ag Ack!
cnoreabbrev AG Ack!

vnoremap <Leader>a y:Ack! <C-r>=fnameescape(@")<CR><CR>

let g:netrw_list_hide= '.git/*'

 " ale
" let g:ale_linters = {'python': ['flake8']}
" let g_ale_linters_explicit = 1

 " VM visual multi
let g:VM_maps = {}
" let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
" let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n
let g:VM_maps["Select Cursor Down"] = '<c-S-Down>'      " start selecting down
let g:VM_maps["Select Cursor Up"]   = '<c-S-Up>'        " start selecting up

 " NERDTree
let NERDTreeShowHidden=1
nmap <leader>e :NERDTreeToggle<CR>

 " Vim fugitive
 " See https://github.com/tpope/vim-fugitive/tree/v2.3 (using v2.3 because of airline)
 " In newest version, can call :Git Blame
nnoremap <Leader>s :Gblame<CR>
nnoremap <Leader>o :Gbrowse!<CR>
vnoremap <Leader>o :Gbrowse!<CR>

 " easygrep
let g:EasyGrepFilesToExclude = '*.swp,*~,*.venv,*.pyc,tags'

 " flake8
let g:flake8_show_in_file = 1

 " vim-phabricator
let g:phabricator_hosts = [ "phab.easypo.net" ]
let g:phabricator_api_token = $PHAB_TOKEN

 " configs with lua
lua<<EOF
-- smartyank
require('smartyank').setup {
  osc52 = {
    enabled = true,
    ssh_only = true, -- OSC52 yank also in local sessions
    silent = false,   -- false to disable the "n chars copied" echo
  },
  -- By default copy is only triggered by "intentional yanks" where the
  -- user initiated a `y` motion (e.g. `yy`, `yiw`, etc). Set to `false`
  -- if you wish to copy indiscriminately:
  validate_yank = false,
  -- 
  -- For advanced customization set to a lua function returning a boolean
  -- for example, the default condition is:
  -- validate_yank = function() return vim.v.operator == "y" end,
}

-- osc52
local function copy(lines, _)
  require('osc52').copy(table.concat(lines, '\n'))
end

local function paste()
  return {vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('')}
end

vim.g.clipboard = {
  name = 'osc52',
  copy = {['+'] = copy, ['*'] = copy},
  paste = {['+'] = paste, ['*'] = paste},
}

-- Now the '+' register will copy to system clipboard using OSC52
vim.keymap.set('n', '<leader>c', '"+y')
vim.keymap.set('n', '<leader>cc', '"+yy')
EOF

 " firenvim (for OSX only)
" https://github.com/glacambre/firenvim/blob/132979166a02319f0b49815135e60a4e4599de91/README.md
if exists('g:started_by_firenvim')
  colorscheme github
  set background=light
  let g:github_colors_soft = 1
  let g:airline_theme = "github"
  set guifont=monospace:h23
else
    " colorscheme nord
endif
au BufEnter github.com_*.txt set filetype=markdown
au BufEnter phab.easypo.net_*.txt set filetype=markdown
au BufEnter go.dev_play_*.txt set filetype=go

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LANGUAGE-SPECIFIC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Python
let g:python3_host_prog = "~/.venv/bin/python"

" On save call Isort
let g:vim_isort_python_version = 'python3'
autocmd BufWritePost * call Isort()
function! Isort()
  if &filetype ==# 'python'
    :Isort
  endif
endfunction


" Golang / vim-go
augroup filetype_go
  autocmd!

  autocmd FileType go setlocal noexpandtab nolist shiftwidth=4 tabstop=4
  
  " from the vim-go-tutorial (https://github.com/fatih/vim-go-tutorial)
  autocmd FileType go setlocal autowrite

  " run :GoBuild or :GoTestCompile based on type of go file
  function! s:build_go_files()
    let l:file = expand('%')

    echo l:file

    if l:file =~# '^\f\+_test\.go$'
      " call go#test#Test(0, 1) " doesn't work. it's verbatim from example.
      GoTestCompile
    elseif l:file =~# '^\f\+\.go$'
      " call go#cmd#Build(0)
      GoBuild
    endif
  endfunction

  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <leader>ru <Plug>(go-run)
  autocmd FileType go nmap <leader>t <Plug>(go-test)
  autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
  autocmd FileType go nmap <leader>i <Plug>(go-info)
  autocmd FileType go nmap <leader>C :GoCallers<CR>
  autocmd FileType go nmap <leader>re :GoReferrers<CR>
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  autocmd FileType go nmap <C-g> :GoDecls<cr>
  autocmd FileType go nmap <leader>dr :GoDeclsDir<cr>
  autocmd FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
  autocmd FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>

  autocmd FileType go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd FileType go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd FileType go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd FileType go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  autocmd FileType go nmap <leader>ds <Plug>(go-def-split)
  autocmd FileType go nmap <leader>dv <Plug>(go-def-vertical)
  autocmd FileType go nmap <leader>dt <Plug>(go-def-tab)

  " navigate through vim-go's quickfix list
  autocmd FileType go map <C-n>: cnext<CR>
  autocmd FileType go map <C-m>: cprevious<CR>
  autocmd FileType go nnoremap <leader>a :cclose<CR>

  " let g:go_list_type = "quickfix" " Use the quickfix error windows only
  let g:go_auto_sameids = 1 " highlight uses of selected identifier under cursor
  let g:go_auto_type_info = 1 " show signature for function under cursor in status bar
  let g:go_def_mode = 'gopls'
  let g:go_fmt_command = "goimports" " combine go fmt with go import
  let g:go_info_mode = 'gopls'
  let g:go_rename_command = 'gopls'
augroup END

" NOTE: if you get a "no object found for ident" error, run :GoBuildTags ''


"
" NOTE: this would require specific plugins, see 'LSP-related plugins' above.
"

if &runtimepath =~ 'lspconfig'
lua<<EOF
  -- Setup autocompletion
-- Based on README from https://github.com/hrsh7th/nvim-cmp
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Setup lspconfig.
-- Known configs: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- Need to manually install each LSP implementation. See links for more info.
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- https://github.com/golang/tools/tree/master/gopls
lspconfig['gopls'].setup {
  capabilities = capabilities
}

EOF
endif

" Ruby
augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

" .env-* files
au BufRead,BufNewFile .env-override set filetype=sh
au BufRead,BufNewFile .env-ci set filetype=sh
au BufRead,BufNewFile .env-test set filetype=sh

