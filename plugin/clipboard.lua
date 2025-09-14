-- Helper function (Lua 5.3+)
local function startswitth(str, prefix)
  return str:sub(1, #prefix) == prefix
end

local function GetCurrentFilePath()
  local current_file_path = vim.api.nvim_buf_get_name(0)
  local project_root = vim.fn.getcwd() -- Assuming cwd is your project root

  if current_file_path and project_root then
    -- Make sure both patshs are absolute and properly formatted
    local normalized_current_file = vim.fn.fnamemodify(current_file_path, ':p')
    local normalized_project_root = vim.fn.fnamemodify(project_root, ':p')

    -- Check if the current file is actuallu within the project root
    if startswitth(normalized_current_file, normalized_project_root) then
      local relative_path = string.sub(normalized_current_file, #normalized_project_root + 1)
      print('Copied the value to the clipboard: ', relative_path)
      vim.fn.system({ 'pbcopy' }, relative_path) -- "xclip" or "xsel" for Linux
    else
      return ''
    end
  else
    print 'Could not determine current file path or project root.'
  end
end

vim.keymap.set('n', '<leader>yy', GetCurrentFilePath, { desc = 'Get current file path' })
