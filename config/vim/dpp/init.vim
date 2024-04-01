augroup MyAutoCmd
  autocmd!
augroup END

let s:dpp_base = expand('$HOME/.local/share/vim/dpp/')

function DppInitPlugin(plugin)
  const dir = s:dpp_base .. 'repos/github.com/' .. a:plugin
  if !dir->isdirectory()
    execute '!git clone --depth 1 https://github.com/' .. a:plugin .. '.git ' .. dir
  endif
  execute 'set runtimepath^=' .. dir
endfunction

call DppInitPlugin('Shougo/dpp.vim')

let $BASE_DIR = expand('<script>:h')
if dpp#min#load_state(s:dpp_base)
  for plugin in [
        \ 'Shougo/dpp-ext-installer',
        \ 'Shougo/dpp-ext-lazy',
        \ 'Shougo/dpp-ext-toml',
        \ 'Shougo/dpp-protocol-git',
        \ 'vim-denops/denops.vim',
        \ ]
    call DppInitPlugin(plugin)
  endfor

  autocmd MyAutoCmd User DenopsReady
        \ : echohl WarningMsg
        \ | echomsg 'dpp load_state() is failed'
        \ | echohl NONE
        \ | call dpp#make_state(s:dpp_base, $BASE_DIR .. '/config.ts')
else
  autocmd MyAutoCmd BufWritePost *.vim,*.ts,*.toml
        \ call dpp#check_files()
  autocmd MyAutoCmd User DenopsReady
        \ call dpp#async_ext_action('installer', 'install')
endif

autocmd MyAutoCmd User Dpp:makeStatePost
      \ : echohl WarningMsg
      \ | echomsg 'dpp make_state() is done'
      \ | echohl NONE

filetype indent on
syntax on
