black_on_save_group = vim.api.nvim_create_augroup("black_on_save_group", { clear = true })

local function launch_black()
    vim.api.nvim_command ':!black --quiet %'
end

vim.api.nvim_create_autocmd(
    { "BufWritePost" },
    {
        pattern = '*.py',
        callback = launch_black,
        group = black_on_save_group
    }
)

-- Show diagnostics under the cursor when holding position
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
