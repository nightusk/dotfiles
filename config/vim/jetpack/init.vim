let s:jetpackfile = expand('$HOME/.local/share/vim') .. '/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if !filereadable(s:jetpackfile)
  call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
endif

packadd vim-jetpack
call jetpack#begin(expand('$HOME/.local/share/vim'))
call jetpack#add('tani/vim-jetpack', {'opt': 1})
call jetpack#load_toml(expand('$HOME/.config/vim/dpp/plugins.toml'))
call jetpack#load_toml(expand('$HOME/.config/vim/jetpack/plugins.toml'))
call jetpack#end()

for name in jetpack#names()
  if !jetpack#tap(name)
    call jetpack#sync()
    break
  endif
endfor
