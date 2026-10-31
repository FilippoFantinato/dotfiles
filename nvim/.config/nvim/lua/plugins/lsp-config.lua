return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "ltex_plus" },
        automatic_enable = { exclude = { "textlsp" } },
      })
    end,
  },
  {
    "barreiroleo/ltex_extra.nvim",
    lazy = true
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("ltex_plus", {
        on_attach = function()
          require("ltex_extra").setup({
            load_langs = { "en-US" },
            path = vim.fn.stdpath("config") .. "/ltex",
          })
        end,
        settings = {
          ltex = {
            language = "en-US",
            checkFrequency = "save",
            -- additionalRules = { enablePickyRules = true },
            -- latex = {
            --   environments = { ["flalign*"] = "ignore", ["flalign"] = "ignore" },
            -- },
          },
        },
      })

      local servers = { "lua_ls", "rust_analyzer", "clangd", "ltex_plus" }
      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })
    end,
  },
}
