vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.python3_host_prog = '~/.pyenv/versions/3.9.18/bin/python3.9'

-- hindent setup
vim.g.hindent_on_save = 1
vim.g.hindent_indent_size = 2
vim.g.hindent_line_length = 100

-- start rustfmt after save
vim.g.rustfmt_autosave = true

vim.g.ctrlp_working_path_mode = 'wr'

vim.cmd.filetype('plugin on')
