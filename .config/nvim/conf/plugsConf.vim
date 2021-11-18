"kassio/neoterm
let g:neoterm_default_mod = "belowright"
let g:neoterm_size = 13
let g:neoterm_autoinsert = 0
let g:neoterm_autoscroll = 1
let g:neoterm_term_per_tab = 1
let g:neoterm_autojump = 1

"SNIPPETS
let g:UltiSnipsJumpForwardTrigger="<M-d>"
let g:UltiSnipsJumpBackwardTrigger="<M-a>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"


"FZF
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

"VIMWIKI
autocmd BufWinEnter *.wiki hi VimwikiHeader1 guifg=#D16950 gui=bold
autocmd BufWinEnter *.wiki hi VimwikiHeader2 guifg=#E88D44 gui=bold
autocmd BufWinEnter *.wiki hi VimwikiHeader3 guifg=#BFC249 gui=bold
autocmd BufWinEnter *.wiki hi VimwikiHeader4 guifg=#916132 gui=bold
autocmd BufWinEnter *.wiki hi VimwikiLink guifg=#595CD7 gui=underline
let g:vimwiki_list = [{'path': '/mnt/SharedVol/DevFiles/vimwiki'}]

"AUTOSAVE
let g:auto_save = 1 

"AUTOPAIRS CONF
let g:AutoPairsFlyMode = 0

"INDENTLINE SETTINGS
let g:indentLine_bufNameExclude = ['_.*', '*.wiki', '*.md']
let g:indentLine_fileTypeExclude = ['vimwiki', 'markdown']
let g:indentLine_bufTypeExclude = ['help', 'terminal', 'vimwiki', 'markdown']
let g:indentLine_concealcursor=""
let g:indentLine_conceallevel=1

"NEOFORMATTER
let g:neoformat_enabled_html = ['prettier']
let g:neoformat_enabled_javascript = ['prettier']

"FERN CONF
let g:fern#renderer = "nerdfont"
let g:fern#hide_cursor = 1
let g:fern#drawer_width = 35
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer> b <Plug>(fern-action-open:split)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

"DASHBOARD
let g:dashboard_default_executive ='fzf'
let g:dashboard_session_directory = '/home/maudev/.config/nvim/sessions'

let g:dashboard_custom_header = [
\ '          ___  ___                            _',
\ '          |  \/  |                           | |',
\ '          | .  . | __ _ _   _  __ _  ___   __| |',
\ '          | |\/| |/ _` | | | |/ _` |/ _ \ / _` |',
\ '          | |  | | (_| | |_| | (_| | (_) | (_| |',
\ '          \_|  |_/\__,_|\__,_|\__, |\___/ \__,_|',
\ '                               __/ |              ',
\ '                              |___/               ',
\ '                                                         ',
\]

"FLOATERM
let g:floaterm_autoinsert = v:false

"VISTA
let g:vista_default_executive = 'ctags'

let g:neoformat_php_php_beautifier = {
     \ 'exe': 'php_beautifier',
    \ 'args': ['--filters "NewLines(before=if:switch:T_CLASS,after=T_COMMENT:function)"']
    \ }

let g:neoformat_enabled_php = ['php_beautifier']


