" hook_add {{{
imap <C-\> <Plug>(skkeleton-enable)
cmap <C-\> <Plug>(skkeleton-enable)
tmap <C-\> <Plug>(skkeleton-enable)

function! s:skkeleton_init() abort
  call skkeleton#config({
  \ 'eggLikeNewline': v:true,
  \ 'globalDictionaries': ["/usr/share/skk/SKK-JISYO.L"],
  \ })
endfunction
augroup skkeleton-initialize-pre
  autocmd!
  autocmd User skkeleton-initialize-pre call s:skkeleton_init()
augroup END
" }}}
