return {
  "voldikss/vim-floaterm",
  config = function ()
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    vim.cmd([[ let g:floaterm_wintype = 'split']])
    vim.cmd([[ let g:floaterm_height = 0.3]])
    vim.cmd([[ let g:floaterm_position = 'bottom']])
    vim.cmd([[ let g:floaterm_autoclose = 1]])
    vim.keymap.set('n', '<F12>', ":FloatermToggle<CR>", { desc = "Toggle Terminal", silent = true})
    vim.keymap.set('t', '<F12>', "<C-\\><C-n>:FloatermHide<CR>", { desc = "Toggle Terminal",  silent = true})
    vim.api.nvim_command("autocmd User FloatermOpen setlocal nonumber")
  end
}
