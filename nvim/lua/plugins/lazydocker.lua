return {
  "akinsho/toggleterm.nvim",
  opts = {
    open_mapping = [[<c-\>]],
    shade_terminals = true,
    direction = "float",
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Ensure terminal module is required properly
    local Terminal = require("toggleterm.terminal").Terminal

    -- Define LazyDocker terminal
    local lazydocker = Terminal:new({
      cmd = "lazydocker",
      direction = "float",
      hidden = true,
    })

    -- Ensure LazyDocker opens when pressing <leader>dd
    vim.keymap.set("n", "<leader>dd", function()
      lazydocker:toggle()
    end, { desc = "Open LazyDocker", noremap = true, silent = true })
  end,
}
