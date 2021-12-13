local util = require 'lspconfig.util'

return {
  default_config = {
    cmd = { 'luahelper', '--stdio' },
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
