return {
  "nvimtools/none-ls.nvim",
  opt = true,
  name = "none-ls",
  priority = 1000,
  config = function()
    local null_ls = require "null-ls"

    -- Define the filetypes where none-ls should be active
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

    -- Define an augroup for formatting
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.prettier.with {
          filetypes = vim.tbl_keys(allowed_filetypes),
          extra_args = { "--config", vim.fn.getcwd() .. "/.prettierrc" },
        },
      },
      -- Ensure that none-ls only attaches to allowed filetypes
      on_attach = function(client, bufnr)
        local filetype = vim.bo[bufnr].filetype
        if not allowed_filetypes[filetype] then
          -- If the filetype is not in the allowed list, detach null-ls
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

-- return {
--   "nvimtools/none-ls.nvim",
--   opt = true,
--   name = "none-ls",
--   priority = 1000,
--   config = function()
--     local null_ls = require "null-ls"
--     local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--     null_ls.setup {
--       sources = {
--         null_ls.builtins.formatting.prettier.with {
--           filetypes = {
--             "javascript",
--             "typescript",
--             "javascriptreact",
--             "typescriptreact",
--             "json",
--             "css",
--             "html",
--             "markdown",
--           },
--           extra_args = { "--config", vim.fn.getcwd() .. "/.prettierrc" },
--         },
--       },
--       on_attach = function(client, bufnr)
--         if client.server_capabilities.documentFormattingProvider then
--           vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
--           vim.api.nvim_create_autocmd("BufWritePre", {
--             group = augroup,
--             buffer = bufnr,
--             callback = function() vim.lsp.buf.format { bufnr = bufnr } end,
--           })
--         end
--       end,
--     }
--   end,
-- }
