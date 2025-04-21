return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = { 
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = {
      history = true,
      updateevents = "TextChanged,TextChangedI",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load() -- Loads VSCode-style snippets
      require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.expand("~/.config/nvim/lua/snippets") })
      -- Loads custom Lua snippets
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
              require("luasnip").expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
              require("luasnip").jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
            { name = "buffer" },
          }),
      })
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp"
  },
}
