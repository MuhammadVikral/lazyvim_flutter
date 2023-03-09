return {
  "theprimeagen/harpoon",
  keys = {
    {
      "<leader>add",
      function()
        require("harpoon.mark").add_file()
      end,
      desc = "add file to harpoon list",
    },
    {
      "<C-e>",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "add file to harpoon list",
    },
    {
      "<leader>1",
      function()
        require("harpoon.ui").nav_file(1)
      end,
      desc = "add file to harpoon list",
    },
    {
      "<leader>2",
      function()
        require("harpoon.ui").nav_file(2)
      end,
      desc = "add file to harpoon list",
    },
    {
      "<leader>3",
      function()
        require("harpoon.ui").nav_file(3)
      end,
      desc = "add file to harpoon list",
    },
    {
      "<leader>4",
      function()
        require("harpoon.ui").nav_file(4)
      end,
      desc = "add file to harpoon list",
    },
    {
      "<leader>5",
      function()
        require("harpoon.ui").nav_file(5)
      end,
      desc = "add file to harpoon list",
    },
    {
      "<leader>6",
      function()
        require("harpoon.ui").nav_file(6)
      end,
      desc = "add file to harpoon list",
    },
    {
      "<leader>7",
      function()
        require("harpoon.ui").nav_file(7)
      end,
      desc = "add file to harpoon list",
    },
    {
      "<leader>8",
      function()
        require("harpoon.ui").nav_file(8)
      end,
      desc = "add file to harpoon list",
    },
  },
}
