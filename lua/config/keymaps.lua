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
map("n", "<leader>rs", function()
  package.loaded["fcreate"] = nil
  require("fcreate").cbx()
end, { desc = "rerun plugin" })
map("n", [[<c-\>]], "<cmd>Ranger<CR>", { desc = "toggle Terminal" })
map({ "n", "v" }, "gl", "$", { desc = "go to the last word in line" })
map({ "n", "v" }, "gb", "^", { desc = "go to the last word in line" })
map("n", "<C-x>", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Delete Buffer" })
-- from primegean
map("x", "<leader>p", [["_dP]])
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "G", "Gzz")
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>ch", "<cmd>!chmod +x %<CR>", { silent = true })
map("n", "<leader>uu", "<cmd>UndotreeToggle<CR>", { silent = true })
--tmux keybind
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")

--insert mode binding
map("i", "jk", "<Esc>", { desc = "escape insert mode with jk" })
map("i", "jj", "<C-o>a", { desc = "exit insert mode then go to next word" })
