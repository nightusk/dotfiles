" hook_add {{{
call ddu#custom#load_config(expand('$BASE_DIR/ddu/config.ts'))

nnoremap <Leader>o <Cmd>Ddu file_rec<CR>

autocmd FileType ddu-ff call s:ddu_my_settings()
function! s:ddu_my_settings() abort
  nnoremap <buffer><silent><CR>    <Cmd>call ddu#ui#do_action('itemAction')<CR>
  nnoremap <buffer><silent><Space> <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>
  nnoremap <buffer><silent>i       <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>
  nnoremap <buffer><silent>q       <Cmd>call ddu#ui#do_action('quit')<CR>
endfunction

autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  inoremap <buffer><silent><CR><Esc> <Cmd>close<CR>
  nnoremap <buffer><silent><CR>      <Cmd>close<CR>
  nnoremap <buffer><silent>q         <Cmd>close<CR>
endfunction
" }}}
