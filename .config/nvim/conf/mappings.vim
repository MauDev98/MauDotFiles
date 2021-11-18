"KEY REMAPPING START
"MAP LEADER KEY
" nmap <Space> <leader>
let g:mapleader="\<Space>"
"GOING TO THE CONFIG FILE
nnoremap <leader>gc :e ~/.config/nvim/init.vim<CR>
"REMAPPING ESC INSERT MODE
inoremap kj <esc>
nnoremap <esc> :nohl<CR>
nnoremap <leader>q :quit<CR>
"save file
nnoremap <leader>sf :w<CR> 
""COPY AND PASTE TO CLIPBOARD
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
"REMAPPING AUTOCOMPLTE OPTIONS NAVIGATION
inoremap <A-j> <C-n>
inoremap <A-k> <C-p>
"REMAPPING COMMAND MODE KEYS
nnoremap <leader>sd :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pc :PlugClean<CR>
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l
"NORMAL MODE MAP
nnoremap <A-h> _
nnoremap <A-l> $
vnoremap <A-h> _
vnoremap <A-l> $
"INSERT MODE MAPPINGS
inoremap <M-l> <right>
inoremap <M-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <M-a> <C-o>A
inoremap <M-i> <C-o>I
inoremap <M-o> <C-o>o<C-o>cc
"EMMET KEYS MAP
let g:user_emmet_leader_key=','
"TERMINAL HOT-KEYS
tnoremap kj <C-\><C-n>
nnoremap <leader>tt :FloatermToggle<CR>
nnoremap <leader>tn :FloatermNew! cd %:p:h ; clear<CR>
nnoremap <leader>tw :FloatermKill!<CR>
nnoremap <leader>tc :FloatermKill<CR>
nnoremap <leader>th :FloatermPrev<CR>
nnoremap <leader>tl :FloatermNext<CR>
"LIVE SERVER FOR HTML
nnoremap <leader>gl :FloatermNew! live-server %:p:h<CR>
"RUN FILES ON TERMINAL
nnoremap <leader>rp :FloatermSend python3 %:p<CR>:FloatermToggle<CR>
nnoremap <leader>rj :FloatermSend node "%:p"<CR>:FloatermToggle<CR>
"TABS REMAPPING
nmap <M-t> :tabnew<CR>:Dashboard<CR>
nmap <M-a> :tabprevious<CR>
nmap <M-d> :tabnext<CR>
"FUZZY FINDER MAPPINGS
nnoremap <leader>fh :History<CR>
nnoremap <leader>fd :Dashboard<CR>
nnoremap <leader>ff :Rg<CR>
nnoremap <leader>fz :FZF<CR>
"Window resize
nnoremap <leader>= :vertical resize +3<CR> 
nnoremap <leader>- :vertical resize -3<CR> 
nnoremap <leader>+ :resize +3<CR> 
nnoremap <leader>_ :resize -3<CR> 
"COLOR TOGGLE COMMAND
nnoremap Tc :ColorToggle<CR>
"INDENT REFRESH
nnoremap <leader>ir :IndentBlanklineRefresh<CR>
"BUFFERS MAPPING
nnoremap <leader>a :bprevious<CR>
nnoremap <leader>d :bnext<CR>
nnoremap <leader>bd :bdelete<CR>
"NEOVIM LSP MAPPINGS
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
"FERN
nnoremap <leader>ne :Fern %:h -drawer<CR>
nnoremap <leader>nn :Fern %:h -drawer -toggle<CR>
nnoremap <leader>nf :FernDo :<CR>

function DeleteBuffers()
  let l:visible_buffers = {}
  for tabnr in range(1, tabpagenr('$'))
    for bufnr in tabpagebuflist(tabnr)
      let l:visible_buffers[bufnr] = 1
    endfor
  endfor

  for bufnr in range(1, bufnr('$'))
    if bufexists(bufnr) && !has_key(l:visible_buffers,bufnr)
      execute printf('bwipeout %d', bufnr)
    endif
  endfor
endfunction

nnoremap <leader>bw :call DeleteBuffers()<CR>
nnoremap <leader>sl :SessionLoad _<C-D>
nnoremap <leader>ss :SessionSave _<C-D>





