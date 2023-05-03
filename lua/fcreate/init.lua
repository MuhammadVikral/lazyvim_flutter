local M = {}

M.cbx = function()
  local current_buf = vim.api.nvim_get_current_buf()
  local current_file = vim.api.nvim_buf_get_name(current_buf)
  if not current_file:match("%.dart$") then
    print("Not a Dart file")
    return
  end
  local test_file = current_file:gsub("%.dart$", "_test.dart"):gsub("/lib/", "/test/")
  local test_directory = current_file:gsub("/lib/", "/test/"):gsub("/[%w_]+%.dart", "")
  if vim.fn.isdirectory(test_directory) == 0 then
    print("no dir")
    vim.fn.mkdir(test_directory:gsub("%.dart$", ""), "p")
  end

  if vim.fn.filereadable(test_file) == 0 then
    local test_content =
      "import 'package:flutter_test/flutter_test.dart';\n\nvoid main() {\n  testWidgets('...', (WidgetTester tester) async {\n    // TODO: Add test code\n  });\n}\n"
    vim.fn.writefile(vim.split(test_content, "\n"), test_file)
  end
  vim.cmd("vsplit " .. test_file)
end

return M
