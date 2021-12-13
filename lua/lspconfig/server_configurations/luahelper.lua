local util = require 'lspconfig.util'

local bin_name = 'lualsp'

if vim.fn.has 'unix' == 1 then
  bin_name = 'linux' .. bin_name
else if vim.fn.has 'mac' == 1 then
  bin_name = 'mac' .. bin_name
end

return {
  default_config = {
    cmd = { bin_name, '-mode', '1' },
    filetypes = { 'lua' },
    root_dir = util.find_git_ancestor,
    single_file_support = true,
  },
  docs = {
    package_json = 'https://raw.githubusercontent.com/Tencent/LuaHelper/master/luahelper-vscode/package.json',
    description = [[
https://github.com/Tencent/LuaHelper

Lua language server.
    ]],
    default_config = {
      root_dir = [[root_pattern(".git") or bufdir]],
    },
  },
}
