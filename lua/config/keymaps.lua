-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("n", "<leader>rf", "<cmd> FlutterRun <CR>", { desc = "Run Flutter Apps" })
vim.keymap.set("n", "<leader>rfw", "<cmd> FlutterRun -t widgetbook/main.dart <CR>", { desc = "Run Flutter widgetbook" })
vim.keymap.set("n", "<leader>rr", "<cmd> FlutterReload <CR>", { desc = "Reload Flutter Apps" })
vim.keymap.set("n", "<leader>rR", "<cmd> FlutterRestart <CR>", { desc = "Restart Flutter Apps" })
vim.keymap.set("n", "<leader>rl", "<cmd> FlutterLogClear <CR>", { desc = "Clear the log of Flutter Apps" })
vim.keymap.set("n", "<leader>rd", "<cmd> FlutterDevices <CR>", { desc = "Check available device" })
vim.keymap.set("n", "<leader>rq", "<cmd> FlutterQuit <CR>", { desc = "Stop Running Application" })
vim.keymap.set("n", [[<c-\>]], "<cmd>ToggleTerm size=40  direction=float <CR>", { desc = "toggle Terminal" })
vim.keymap.set("n", "<C-x>", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Delete Buffer" })
