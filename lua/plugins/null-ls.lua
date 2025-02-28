return {
  "nvimtools/none-ls.nvim",
  opt = true,
  name = "none-ls",
  priority = 1000,
  config = function()
    local null_ls = require "null-ls"

    local allowed_filetypes = {
      javascript = true,
      typescript = true,
      javascriptreact = true,
      typescriptreact = true,
      json = true,
      css = true,
      html = true,
      markdown = true,
    }

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.prettier.with {
          filetypes = vim.tbl_keys(allowed_filetypes),
          extra_args = { "--config", vim.fn.getcwd() .. "/.prettierrc" },
        },
      },
      on_attach = function(client, bufnr)
        local filetype = vim.bo[bufnr].filetype
        if not allowed_filetypes[filetype] then
          vim.lsp.buf_detach_client(bufnr, client.id)
          return
        end

        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function() vim.lsp.buf.format { bufnr = bufnr } end,
          })
        end
      end,
    }
  end,
}
