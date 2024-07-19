"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","      " 定义<leader>键
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
set cmdheight=1          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
set cursorline           " 高亮显示当前行
set whichwrap+=<,>,h,l   " 设置光标键跨行
set ttimeoutlen=0        " 设置<ESC>键响应时间
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面
" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
" Turn on the Wild menu
set wildmenu

" Ignore compiled files
  set wildignore=*.o,*~,*.pyc
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set backspace=eol,start,indent
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
" set magic
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Use Unix as the standard file type
set ffs=unix,dos,mac
" e ++ff=unix %           " 执行一次即可在vim中看到中文dos下的符号, 永久生效
" e ++ff=dos %               " 默认认为文件是dos下字符
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
set tags=./tags;,tags
set path+=.;,..;../..;
set path+=./include;
set path+=./sys;
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
" set expandtab            " 将制表符扩展为空格
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set smarttab             " 在行和段开始处使用制表符
set wrap                 " 允许折行
set backspace=2          " 使用回车键正常处理indent,eol,start等
set sidescroll=10        " 设置向右滚动字符数
set nofoldenable         " 禁用折叠代码

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu             " vim自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
" set ignorecase          " 搜索时大小写不敏感

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 卸载默认插件UnPlug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:deregister(repo)
  let repo = substitute(a:repo, '[\/]\+$', '', '')
  let name = fnamemodify(repo, ':t:s?\.git$??')
  call remove(g:plugs, name)
endfunction
command! -nargs=1 -bar UnPlug call s:deregister(<args>)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件列表
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Plug 'chxuan/cpp-mode'
" Plug 'chxuan/vim-edit'
" Plug 'chxuan/change-colorscheme'
" Plug 'chxuan/prepare-code'
Plug 'chxuan/vim-buffer'
" Plug 'chxuan/vimplus-startify'
Plug 'preservim/tagbar'
" Plug 'Valloric/YouCompleteMe'   ", { 'on': [] }
" augroup load_ycm
"     autocmd!
"     autocmd InsertEnter * call plug#load('YouCompleteMe') | autocmd! load_cmd
" augroup END
Plug 'Yggdroot/LeaderF'
" Plug 'mileszs/ack.vim'
" Plug 'easymotion/vim-easymotion'
" Plug 'haya14busa/incsearch.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'godlygeek/tabular'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-commentary'
Plug 'preservim/nerdcommenter'
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-endwise'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'ryanoasis/vim-devicons'
" Plug 'junegunn/vim-slash'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" Plug 'kana/vim-textobj-user'
" Plug 'kana/vim-textobj-indent'
" Plug 'kana/vim-textobj-syntax'
" Plug 'kana/vim-textobj-function'
" Plug 'sgur/vim-textobj-parameter'
" Plug 'Shougo/echodoc.vim'
" Plug 'terryma/vim-smooth-scroll'
" Plug 'rhysd/clever-f.vim'
" Plug 'vim-scripts/indentpython.vim'

Plug 'ferrine/md-img-paste.vim'
Plug 'mzlogin/vim-markdown-toc'
Plug 'godlygeek/tabular' "必要插件，安装在vim-markdown前面
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.vim'

Plug '~/.vim/plugged/taglist'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'voldikss/vim-floaterm'
" 加载自定义插件
if filereadable(expand($HOME . '/.vimrc.custom.plugins'))
    source $HOME/.vimrc.custom.plugins
endif

call plug#end()

" load vim default plugin
runtime macros/matchit.vim

" 编辑vimrc相关配置文件
nnoremap <leader>e :edit $MYVIMRC<cr>
nnoremap <leader>vc :edit ~/.vimrc.custom.config<cr>
nnoremap <leader>vp :edit ~/.vimrc.custom.plugins<cr>

" 查看vimplus的help文件
nnoremap <leader>h :view +let\ &l:modifiable=0 ~/.vimplus/help.md<cr>

" 打开当前光标所在单词的vim帮助文档
nnoremap <leader>H :execute ":help " . expand("<cword>")<cr>

" 重新加载vimrc文件
nnoremap <leader>s :source $MYVIMRC<cr>

" 安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>

" 分屏窗口移动
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" 复制当前选中到系统剪切板
vmap <leader><leader>y "+y

" 将系统剪切板内容粘贴到vim
nnoremap <leader><leader>p "+p

" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

" coc
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 主题设置
set background=dark
let g:onedark_termcolors=256
colorscheme onedark
" colorscheme murphy
set guicursor=n-c-v:ver50-ncvCursor,i:block-iCursor-blinkon0
hi Search term=standout ctermfg=0 ctermbg=11 guifg=orangered guibg=yellow2
hi Normal ctermfg=252 ctermbg=none
if &diff
" with moonlight but use ok, I don't like
	" colorscheme evening
" I like this
	 colorscheme murphy
" recommand this
	" colorscheme industry
" recommand this
	" colorscheme ron
" common
	" colorscheme torte
	" color blue
endif

" airline
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" let g:airline_left_sep = ''
let g:airline_left_sep = '▶'
" let g:airline_left_alt_sep = ''
let g:airline_left_alt_sep = '❯'
" let g:airline_right_sep = ''
let g:airline_right_sep = '◀'
" let g:airline_right_alt_sep = ''
let g:airline_right_alt_sep = '❮'

" cpp-mode
" nnoremap <leader>y :CopyCode<cr>
" nnoremap <leader>p :PasteCode<cr>
" nnoremap <leader>U :GoToFunImpl<cr>
" nnoremap <silent> <leader>a :Switch<cr>
" nnoremap <leader><leader>fp :FormatFunParam<cr>
" nnoremap <leader><leader>if :FormatIf<cr>
" nnoremap <leader><leader>t dd :GenTryCatch<cr>
" xnoremap <leader><leader>t d :GenTryCatch<cr>

" change-colorscheme
" nnoremap <silent> <F9> :PreviousColorScheme<cr>
" inoremap <silent> <F9> <esc> :PreviousColorScheme<cr>
" nnoremap <silent> <F10> :NextColorScheme<cr>
" inoremap <silent> <F10> <esc> :NextColorScheme<cr>
" nnoremap <silent> <F11> :RandomColorScheme<cr>
" inoremap <silent> <F11> <esc> :RandomColorScheme<cr>
" nnoremap <silent> <F12> :ShowColorScheme<cr>
" inoremap <silent> <F12> <esc> :ShowColorScheme<cr>

" prepare-code
" let g:prepare_code_plugin_path = expand($HOME . "/.vim/plugged/prepare-code")

" vim-buffer
nnoremap <silent> <c-p> :PreviousBuffer<cr>
nnoremap <silent> <c-n> :NextBuffer<cr>
nnoremap <silent> <leader>d :CloseBuffer<cr>
nnoremap <silent> <leader>D :BufOnly<cr>

" vim-edit
" nnoremap Y :CopyText<cr>
" nnoremap D :DeleteText<cr>
" nnoremap C :ChangeText<cr>
" nnoremap <leader>r :ReplaceTo<space>

" nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'

" YCM
" 如果不指定python解释器路径，ycm会自己搜索一个合适的(与编译ycm时使用的python版本匹配)
" let g:ycm_server_python_interpreter = '/usr/bin/python2.7'
let g:ycm_confirm_extra_conf = 1
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '✹'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.','re![_a-zA-z0-9]'],
            \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
            \             're!\[.*\]\s'],
            \   'ocaml' : ['.', '#'],
            \   'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::'],
            \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \ }
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ }
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_disable_for_files_larger_than_kb = 1024
let g:ycm_key_invoke_completion = '<C-M>'
" set completeopt=longest,menu
nnoremap <leader>u :YcmCompleter GoToDeclaration<cr>
" 已经使用cpp-mode插件提供的转到函数实现的功能
" nnoremap <leader>i :YcmCompleter GoToDefinition<cr>
nnoremap <leader>o :YcmCompleter GoToInclude<cr>
nnoremap <leader>ff :YcmCompleter FixIt<cr>
nmap <F5> :YcmDiags<cr>

" tagbar
let g:tagbar_width = 30
nnoremap <silent> <leader>t :TagbarToggle<cr>

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" incsearch.vim
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

" vim-easymotion
" let g:EasyMotion_smartcase = 1
" map <leader>w <Plug>(easymotion-bd-w)
" nmap <leader>w <Plug>(easymotion-overwin-w)

" nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }

" LeaderF
nnoremap <leader>f :LeaderfFile .<cr>
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
let g:Lf_UseCache = 0

" taglist
map <F2> :Tlist <CR>
let Tlist_Show_One_File=1     "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=1   "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Ctags_Cmd="/usr/bin/ctags" "将taglist与ctags关联

" ack
" nnoremap <leader>F :Ack!<space>

" echodoc.vim
" let g:echodoc_enable_at_startup = 1

" tabular
nnoremap <leader>l :Tab /\|<cr>
nnoremap <leader>= :Tab /=<cr>

" vim-smooth-scroll
" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" gv
nnoremap <leader>g :GV<cr>
nnoremap <leader>G :GV!<cr>
nnoremap <leader>gg :GV?<cr>

nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode

let g:mdip_imgdir = 'picture'
let g:mdip_imgname = 'image'
autocmd FileType markdown let g:PasteImageFunction = 'g:MarkdownPasteImage'
autocmd FileType markdown nmap <buffer><silent> <F3> :call mdip#MarkdownClipboardImage()<CR>
" autocmd FileType markdown nnoremap <silent> <C-i> :call mdip#MarkdownClipboardImage()<CR>

let g:vim_markdown_math = 1
let g:mkdp_markdown_css=''
let g:mdip_imgdir = './img/'
" let g:mdip_imgname = 'image'

" 加载自定义配置
if filereadable(expand($HOME . '/.vimrc.custom.config'))
    source $HOME/.vimrc.custom.config
endif

hi ModeMsg ctermfg=Green

" coc
"let g:coc_disable_startup_warning = 1
" https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
	        \ CheckBackspace() ? "\<Tab>" :
			      \ coc#refresh()
	inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

	" Make <CR> to accept selected completion item or notify coc.nvim to format
	" <C-g>u breaks current undo, please make your own choice
	inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
	                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

								  function! CheckBackspace() abort
								    let col = col('.') - 1
									  return !col || getline('.')[col - 1]  =~# '\s'
									  endfunction

									  " Use <c-space> to trigger completion
									  if has('nvim')
									    inoremap <silent><expr> <c-space> coc#refresh()
	else
	  inoremap <silent><expr> <c-@> coc#refresh()
	endif

	" Use `[g` and `]g` to navigate diagnostics
	" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)

	" GoTo code navigation
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	" Use K to show documentation in preview window
	nnoremap <silent> K :call ShowDocumentation()<CR>

	function! ShowDocumentation()
	  if CocAction('hasProvider', 'hover')
	      call CocActionAsync('doHover')
		    else
			    call feedkeys('K', 'in')
				  endif
				  endfunction

				  " Highlight the symbol and its references when holding the cursor
				  autocmd CursorHold * silent call CocActionAsync('highlight')

				  " Symbol renaming
				  nmap <leader>rn <Plug>(coc-rename)

	" Formatting selected code
	xmap <leader>f  <Plug>(coc-format-selected)
	nmap <leader>f  <Plug>(coc-format-selected)

	augroup mygroup
	  autocmd!
	    " Setup formatexpr specified filetype(s)
		  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
		    " Update signature help on jump placeholder
			  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
			  augroup end

			  " Applying code actions to the selected code block
			  " Example: `<leader>aap` for current paragraph
			  xmap <leader>a  <Plug>(coc-codeaction-selected)
	nmap <leader>a  <Plug>(coc-codeaction-selected)

	" Remap keys for applying code actions at the cursor position
	nmap <leader>ac  <Plug>(coc-codeaction-cursor)
	" Remap keys for apply code actions affect whole buffer
	nmap <leader>as  <Plug>(coc-codeaction-source)
	" Apply the most preferred quickfix action to fix diagnostic on the current line
	nmap <leader>qf  <Plug>(coc-fix-current)

	" Remap keys for applying refactor code actions
	nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
	xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
	nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

	" Run the Code Lens action on the current line
	nmap <leader>cl  <Plug>(coc-codelens-action)

	" Map function and class text objects
	" NOTE: Requires 'textDocument.documentSymbol' support from the language server
	xmap if <Plug>(coc-funcobj-i)
	omap if <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap af <Plug>(coc-funcobj-a)
	xmap ic <Plug>(coc-classobj-i)
	omap ic <Plug>(coc-classobj-i)
	xmap ac <Plug>(coc-classobj-a)
	omap ac <Plug>(coc-classobj-a)

	" Remap <C-f> and <C-b> to scroll float windows/popups
	if has('nvim-0.4.0') || has('patch-8.2.0750')
	  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
		  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
		    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
			  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
			    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
				endif

				" Use CTRL-S for selections ranges
				" Requires 'textDocument/selectionRange' support of language server
				nmap <silent> <C-s> <Plug>(coc-range-select)
	xmap <silent> <C-s> <Plug>(coc-range-select)

	" Add `:Format` command to format current buffer
	command! -nargs=0 Format :call CocActionAsync('format')

	" Add `:Fold` command to fold current buffer
	command! -nargs=? Fold :call     CocAction('fold', <f-args>)

	" Add `:OR` command for organize imports of the current buffer
	command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

	" Add (Neo)Vim's native statusline support
	" NOTE: Please see `:h coc-status` for integrations with external plugins that
	" provide custom statusline: lightline.vim, vim-airline
	set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

	" Mappings for CoCList
	" Show all diagnostics
	nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
	" Manage extensions
	nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
	" Show commands
	nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
	" Find symbol of current document
	nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
	" Search workspace symbols
	nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
	" Do default action for next item
	nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
	" Do default action for previous item
	nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
	" Resume latest coc list
	nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>"
	"

" Float Terminal
"voldikss/vim-floaterm
""按键映射前缀: <leader>t。
let g:floaterm_keymap_new = '<Leader>tw'     "新建终端。
let g:floaterm_keymap_toggle = '<Leader>tt'  "终端显隐。
let g:floaterm_keymap_prev = '<Leader>tp'    "上一个终端。
let g:floaterm_keymap_next = '<Leader>tn'    "下一个终端。
let g:floaterm_keymap_kill = '<Leader>tk'    "关掉终端。
let g:floaterm_wintype = 'float'             "浮动窗口类型。
let g:floaterm_position = 'center'           "在窗口中间显示。
