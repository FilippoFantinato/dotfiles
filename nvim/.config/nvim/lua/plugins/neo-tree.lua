return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- local neotree = require('neo-tree')

    -- neotree.setup({
    --   filesystem = {
    --     filtered_items = {
    --       visible = true,
    --       hide_dotfiles = false
    --     }
    --   }
    -- })
    vim.keymap.set("n", "<C-l>", ":Neotree focus<CR>", {})
    vim.keymap.set("n", "<C-n>", ":Neotree reveal toggle left<CR>", {})
    buffers = { follow_current_file = { enabled = true } }
  end,
}
