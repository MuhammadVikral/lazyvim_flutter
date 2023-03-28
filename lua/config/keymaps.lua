-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader>rf", "<cmd> FlutterRun <CR>", { desc = "Run Flutter Apps" })
map("n", "<leader>rfw", "<cmd> FlutterRun -t widgetbook/main.dart <CR>", { desc = "Run Flutter widgetbook" })
map("n", "<leader>rr", "<cmd> FlutterReload <CR>", { desc = "Reload Flutter Apps" })
map("n", "<leader>rR", "<cmd> FlutterRestart <CR>", { desc = "Restart Flutter Apps" })
map("n", "<leader>rl", "<cmd> FlutterLogClear <CR>", { desc = "Clear the log of Flutter Apps" })
map("n", "<leader>rd", "<cmd> FlutterDevices <CR>", { desc = "Check available device" })
map("n", "<leader>rq", "<cmd> FlutterQuit <CR>", { desc = "Stop Running Application" })
map("n", [[<c-\>]], "<cmd>Ranger<CR>", { desc = "toggle Terminal" })
map({ "n", "v" }, "gl", "$", { desc = "go to the last word in line" })
map({ "n", "v" }, "gb", "^", { desc = "go to the last word in line" })
map("n", "<C-x>", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Delete Buffer" })
-- from primegean
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "G", "Gzz")
--insert mode binding
map("i", "jk", "<Esc>", { desc = "escape insert mode with jk" })
map("i", "jj", "<C-o>a", { desc = "exit insert mode then go to next word" })
