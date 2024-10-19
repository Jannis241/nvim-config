-- LSP Attach Autocommand
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp_attach', {clear = true}),
  callback = function(event)
    local opts = {buffer = event.buf}
    -- Key mappings
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
  end,
})

-- Capabilities for nvim-cmp
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Mason setup
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {'tsserver', 'rust_analyzer'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = lsp_capabilities,
      })
    end,
    ['lua_ls'] = function()
      require('lspconfig').lua_ls.setup({
        capabilities = lsp_capabilities,
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT'
            },
            diagnostics = {
              globals = {'vim'},
            },
            workspace = {
              library = {
                vim.env.VIMRUNTIME,
              },
              checkThirdParty = false, -- Avoid some warning messages
            },
          },
        },
      })
    end,
  }
})

-- nvim-cmp setup
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
    {name = 'crates'},
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<enter>'] = cmp.mapping.confirm({ select = true }),
    ['<tab>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
    vim.diagnostic.config({
        -- update_in_insert = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    })

})

local rt = require('rust-tools')

rt.setup({
    server = {
        on_attach = function(client, bufnr)
            local opts = { noremap=true, silent=true }
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

            -- Enable inlay hints
            --
            -- Gibt irgendwie ein null error und scheint auch ohne zu funktionieren
            -- require('rust-tools.inlay_hints').setup_autocmd()
            -- require('rust-tools.inlay_hints').set_inlay_hints()
        end,
        settings = {
            ["rust-analyzer"] = {
                cargo = {
                    allFeatures = true,
                },
                checkOnSave = {
                    command = "clippy"
                },
                diagnostics = {
                    enable = true;
                },
                inlayHints = {
                    typeHints = {
                        enable = true,
                        prefix = "",
                    },
                    chainingHints = {
                        enable = true,
                        prefix = "",
                    },
                    parameterHints = {
                        enable = true,
                        prefix = "",
                    },
                },
            }
        }
    }
})

