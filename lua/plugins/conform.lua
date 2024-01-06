local M = {}
local Util = require("lazyvim.util")
return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>cF",
      function()
        require("conform").format({ formatters = { "injected" } })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },

  -- init = function()
  --   require("lazyvim.util").on_very_lazy(function()
  --     require("lazyvim.util").format.register({
  --       name = "conform.nvim",
  --       priority = 100,
  --       primary = true,
  --       format = function(buf)
  --         local plugin = require("lazy.core.config").plugins["conform.nvim"]
  --         local Plugin = require("lazy.core.plugin")
  --         local opts = Plugin.values(plugin, "opts", false)
  --         require("conform").format(Util.merge(opts.format, { bufnr = buf }))
  --       end,
  --       sources = function(buf)
  --         local ret = require("conform").list_formatters(buf)
  --         return vim.tbl_map(function(v)
  --           return v.name
  --         end, ret)
  --       end,
  --     })
  --   end)
  -- end,
  opts = function()
    -- local plugin = require("lazy.core.config").plugins["conform.vim"]
    -- if plugin.config ~= M.setup then
    --   Util.error({
    --     "Don't set `plugin.config` for `conform.nvim`.\n",
    --     "This will break **LazyVim** formatting.\n",
    --     "Please refer to the docs at https://www.lazyvim.org/plugins/formatting",
    --   }, { title = "LazyVim" })
    -- end

    local opts = {
      -- Define your formatters
      format = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
      },

      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        go = { "goimports", "gofmt" },
        python = { "isort", "black" },
        vue = { { "prettierd", "prettierd" } },
        sass = { { "prettierd", "prettierd" } },
        ts = { "prettier" },
        ["javascript"] = { "prettier" },
        ["javascriptreact"] = { "prettier" },
        ["typescript"] = { "prettier" },
        ["typescriptreact"] = { "prettier" },
        ["css"] = { "prettier" },
        ["scss"] = { "prettier" },
        ["less"] = { "prettier" },
        ["html"] = { "prettier" },
        ["json"] = { "prettier" },
        ["jsonc"] = { "prettier" },
        ["yaml"] = { "prettier" },
        ["markdown"] = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        ["graphql"] = { "prettier" },
        ["handlebars"] = { "prettier" },
      },
      -- Set up format-on-save
      -- format_on_save = { timeout_ms = 500, lsp_fallback = true },
      -- Customize formatters
      formatters = {
        injected = { options = { ignore_errors = true } },
      },
    }
    return opts
  end,
  config = M.setup,
}
