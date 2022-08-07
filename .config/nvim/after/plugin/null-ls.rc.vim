local null_ls = require "null-ls"

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.golines,
    null_ls.builtins.formatting.prettierd.with ({
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "graphql", "handlebars", "go" },
   }),
    null_ls.builtins.formatting.deno_fmt.with {
      condition = function(utils)
        return not (utils.has_file { ".prettierrc", ".prettierrc.js", "deno.json", "deno.jsonc" })
      end,
    },
  },
  --capabilities = common_config.capabilities,
  --on_attach = common_config.on_attach,
}

null_ls.setup({ sources = sources })

