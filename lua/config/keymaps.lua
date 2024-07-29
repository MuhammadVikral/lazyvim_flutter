-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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

map("n", [[<c-\>]], "<cmd>Ranger<CR>", { desc = "toggle Terminal" })
map({ "n", "v" }, "gl", "$", { desc = "go to the last word in line" })
map({ "n", "v" }, "gb", "^", { desc = "go to the last word in line" })

--buffer
map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<C-x>", LazyVim.ui.bufremove, { desc = "Delete Buffer" })

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
-- map("i", "jk", "<Esc>", { desc = "escape insert mode with jk" })
map("i", "jj", "<C-o>a", { desc = "exit insert mode then go to next word" })

-- copy to file path
map("n", "<leader>fp", function()
  local file_path = vim.fn.expand("%:p")
  vim.fn.setreg("+", file_path)
  print("File path copied to clipboard: " .. file_path)
end, { silent = true })

-- copy to file name
map("n", "<leader>fn", function()
  local file_name = vim.fn.expand("%:t")
  vim.fn.setreg("+", file_name)
  print("File name copied to clipboard: " .. file_name)
end, { silent = true })

-- copy to file name as freezed
map("n", "<leader>fnf", function()
  local file_name = vim.fn.expand("%:t")
  local freezed_name = file_name:gsub("(%..+)$", ".freezed%1")
  vim.fn.setreg("+", freezed_name)
  print("File name copied to clipboard: " .. freezed_name)
end, { silent = true })

--flutter
map("n", "<leader>rf", "<cmd> FlutterRun <CR>", { desc = "Run Flutter Apps" })
map("n", "<leader>rfw", "<cmd> FlutterRun -t widgetbook/main.dart <CR>", { desc = "Run Flutter widgetbook" })
map("n", "<leader>rr", "<cmd> FlutterReload <CR>", { desc = "Reload Flutter Apps" })
map("n", "<leader>rR", "<cmd> FlutterRestart <CR>", { desc = "Restart Flutter Apps" })
map("n", "<leader>rl", "<cmd> FlutterLogClear <CR>", { desc = "Clear the log of Flutter Apps" })
map("n", "<leader>rd", "<cmd> FlutterDevices <CR>", { desc = "Check available device" })
map("n", "<leader>rq", "<cmd> FlutterQuit <CR>", { desc = "Stop Running Application" })
map("n", "<leader>rt", "<cmd> !flutter_test.sh %:p<CR>", { desc = "run flutter test on current file" })
map("n", "<leader>gt", function()
  package.loaded["fcreate"] = nil
  require("fcreate").cbx()
end, { desc = "flutter create test file" })
map("n", "<leader>rw", function()
  local current_directory = vim.fn.expand("%:p:h")
  -- Get the filename from user input
  local filename = vim.fn.input("Enter the name of the new file: ")
  -- Execute the bash script with current_directory and filename as arguments
  local command = "! /home/skypea/myScript/bin/new_widget.sh "
    .. vim.fn.shellescape(current_directory)
    .. " "
    .. vim.fn.shellescape(filename)
    .. " "
    .. vim.fn.shellescape("%:p")
  vim.cmd(command)
  -- Refresh the file explorer (if you're using any plugin like NERDTree)
  vim.cmd("silent! NERDTreeRefreshRoot")
  -- Add a new line with the desired content to the current file
end, { noremap = true, silent = true, desc = "create a new widget file" })
