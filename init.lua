-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local lazy = require("lazy")

lazy.commands = {
  widget = {
    cmd = '! /path/to/your/new_widget.sh %:p:h <c-r>=input("Enter the name of the new file: ")<cr>',
    desc = "Create a new widget file",
    needs = { "bash" },
  },
}
