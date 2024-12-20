return function()
  local lint = require "lint"
  lint.linters_by_ft = {
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    typescriptreact = { "eslint_d" },
    svelte = { "eslint_d" },
    lua = { "luacheck" },
    -- yaml = { "yamllint" },
    css = { "stylelint" },
    scss = { "stylelint" },
    -- sql = { "sqlfluff" },
    terraform = { "tflint" },
    markdown = { "markdownlint", "vale" },
  }
  local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

  vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = lint_augroup,
    callback = function()
      lint.try_lint()
    end,
  })
end
