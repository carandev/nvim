local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_installer = require("nvim-lsp-installer")

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end
--
-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = '/home/carandev/.config/nvim/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig/configs'.emmet_ls = {
  default_config = {
    cmd = { 'emmet-ls', '--stdio' };
    filetypes = { 'html', 'css', 'scss', 'htmldjango', 'jsx'}; -- Add the languages you use, see language support
    root_dir = function(_)
      return vim.loop.cwd()
    end;
    settings = {};
  };
}

local on_attach = function(client)
    require'completion'.on_attach(client)
end

require'lspconfig'.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})

require'lspconfig/configs'.phpactor = {
  default_config = {
    cmd = { 'phpactor', 'language-server' };
    filetypes = { 'php'};
    root_dir = function(_)
      return vim.loop.cwd()
    end;
  };
}

local lang_servers = {
  'pyright',
  'cssls',
  'html',
  'tsserver',
  'emmet_ls',
  'sumneko_lua',
  'jsonls',
  'tailwindcss',
  'dockerls',
  'phpactor',
  'rust_analyzer',
  'jdtls',
  'hls',
  'clangd',
  'ltex',
  'texlab',
  'bashls',
  'csharp_ls',
  'clangd',
  'vuels'
}

for _, server in ipairs(lang_servers) do
  if server == 'sumneko_lua' then
    require'lspconfig'[server].setup {
      cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = runtime_path,
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty =  false
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      }
    }
  elseif server == 'phpactor' then
    require'lspconfig'[server].setup {
      capabilities = capabilities,
      root_dir = function(_)
        return vim.loop.cwd()
      end;
    }
  elseif server == 'jdtls' then
    require'lspconfig'[server].setup {
      capabilities = capabilities,
      cmd = {'start_jdtls'}
    }
  else
    require'lspconfig'[server].setup{
      capabilities = capabilities
    }
  end
end


