local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) --nvim-cmp
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  require "lsp_signature".on_attach({
      bind = true,
      handler_opts = {
          border = "rounded"
      },
      alwaysTrigger = true
  }, bufnr)

  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Setup lspconfig.
-- local nvim_lsp = require('lspconfig')

-- setup languages 
-- GDScript
vim.lsp.config("gdscript", {
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
})
vim.lsp.enable({"gdscript"})

-- Python
vim.lsp.config("pylsp", {
  cmd = {'pylsp'},
  -- on_attach = on_attach,
  capabilities = capabilities,
})
vim.lsp.enable({"pylsp"})

-- GoLang
vim.lsp.config("gopls", {
  cmd = {'gopls', '--remote=auto'},
  -- on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
  init_options = {
    usePlaceholders = true,
  }
})
vim.lsp.enable({"gopls"})

vim.lsp.config("clojure_lsp", {
    cmd = { "clojure-lsp" },
    filetypes = { "clojure", "edn" },
    -- on_attach = on_attach,
    capabilities = capabilities,
    root_markers = {"project.clj", "deps.edn", "build.boot", "shadow-cljs.edn", ".git", "bb.edn"},
})
vim.lsp.enable({"clojure_lsp"})

vim.lsp.config("clangd", {
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--query-driver=/usr/bin/gcc,/usr/bin/g++",
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    -- on_attach = on_attach,
    root_markers = {
        '.clangd',
        '.clang-tidy',
        '.clang-format',
        'compile_commands.json',
        'compile_flags.txt',
        'configure.ac'
        -- '.git'
    },
    single_file_support = true
})
vim.lsp.enable({"clangd"})

vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust_analyzer'] = {
            diagnostics = {
                enable = false;
            }
        }
    }
})
vim.lsp.enable({"rust_analyzer"})
