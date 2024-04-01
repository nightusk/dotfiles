" hook_add {{{
call ddc#custom#load_config(expand('$BASE_DIR/ddc/config.ts'))
call ddc#enable()
" }}}
