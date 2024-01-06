return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  -- Everything in opts will be passed to setup()
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "goimports", "gofmt" },
      python = { "isort", "black" },
      javascript = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettierd" } },
      vue = { { "prettierd", "prettierd" } },
      html = { { "prettierd", "prettierd" } },
      javascriptreact = { { "prettierd", "prettierd" } },
      typescriptreact = { { "prettierd", "prettierd" } },
      css = { { "prettierd", "prettierd" } },
      sass = { { "prettierd", "prettierd" } },
      scss = { { "prettierd", "prettierd" } },
      json = { { "prettierd", "prettierd" } },
      jsonc = { { "prettierd", "prettierd" } },
      yaml = { { "prettierd", "prettierd" } },
      markdown = { { "prettierd", "prettierd" } },
      graphql = { { "prettierd", "prettierd" } },
      handlebars = { { "prettierd", "prettierd" } },
    },
    -- Set up format-on-save
    -- format_on_save = { timeout_ms = 500, lsp_fallback = true },
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
