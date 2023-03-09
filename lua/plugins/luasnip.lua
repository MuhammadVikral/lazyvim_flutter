-- return {
--   "hrsh7th/vim-vsnip-integ",
--   "hrsh7th/vim-vsnip",
--   "Neevash/awesome-flutter-snippets",
-- }
--
return {
  "L3MON4D3/LuaSnip",
  build = "make install_jsregexp",
  dependencies = {
    "Neevash/awesome-flutter-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },
  -- stylua: ignore
  keys = {
    {
      "<tab>",
      function()
        return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
      end,
      expr = true, silent = true, mode = "i",
    },
    { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
    { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
  },
}
