return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    if type(opts.sources) == "table" then
      local nls = require("none-ls")

      vim.list_extend(opts.sources, {
        nls.builtins.code_actions.gomodifytags,
        nls.builtins.code_actions.impl,
        nls.builtins.formatting.gofumpt,
        nls.builtins.formatting.goimports_reviser,
        nls.builtins.formatting.terraform_fmt,
        nls.builtins.diagnostics.terraform_validate,
        nls.builtins.diagnostics.hadolint,
      })
    end
  end,
}
