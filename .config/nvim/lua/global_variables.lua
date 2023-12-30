vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.python3_host_prog = '~/.pyenv/versions/3.9.18/bin/python3.9'

-- stylish-haskell options
vim.g.stylishask_on_save = 1

-- start rustfmt after save
vim.g.rustfmt_autosave = true

vim.g.ctrlp_working_path_mode = 'wr'

-- vim svelte plugin start
vim.g.vim_svelte_plugin_load_full_syntax = 1
vim.g.vim_svelte_plugin_use_typescript = 1

vim.cmd.filetype('plugin on')
