local util = require 'lspconfig.util'

local bin_name = 'lualsp'

if vim.fn.has 'unix' == 1 then
  bin_name = 'linux' .. bin_name
else if vim.fn.has 'mac' == 1 then
  bin_name = 'mac' .. bin_name
end
  
local root_files = {
  '.luarc.json',
  '.luacheckrc',
  '.stylua.toml',
  'selene.toml',
  'luahelper.json',
}

return {
  default_config = {
    cmd = { bin_name, '-mode', '1' },
    filetypes = { 'lua' },
    root_dir = function(fname)
      return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
    end,
    single_file_support = true,
    log_level = vim.lsp.protocol.MessageType.Warning,
  },
  docs = {
    package_json = 'https://raw.githubusercontent.com/Tencent/LuaHelper/master/luahelper-vscode/package.json',
    description = [[
https://github.com/Tencent/LuaHelper

Lua language server.

The binary of `luahelper` for Windows/Linux/Mac can be found [here](https://github.com/Tencent/LuaHelper/tree/master/luahelper-vscode).
The default `cmd` assumes that the `luahelper`'s binary can be found in `$PATH`.

`luahelper` uses [LuaFormatter](https://github.com/Koihik/LuaFormatter) to format code by default.
    ]],
    default_config = {
      root_dir = [[root_pattern(".git") or bufdir]],
    },
  },
}
