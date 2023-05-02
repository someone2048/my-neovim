return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require('toggleterm').setup {
      size = 20,
      open_mapping = [[<F12>]],
      auto_scroll = true,
      direction = 'horizontal',
      shell = '/bin/bash'
    }

    local Terminal  = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true,  direction='float'})

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "´", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "`", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
  end,
}
