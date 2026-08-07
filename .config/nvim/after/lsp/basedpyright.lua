local function set_python_path(command)
  local path = command.args
  local clients = vim.lsp.get_clients {
    bufnr = vim.api.nvim_get_current_buf(),
    name = 'pyright',
  }
  for _, client in ipairs(clients) do
    if client.settings then
      client.settings.python =
        vim.tbl_deep_extend('force', client.settings.python --[[@as table]], { pythonPath = path })
    else
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, { python = { pythonPath = path } })
    end
    client:notify('workspace/didChangeConfiguration', { settings = nil })
  end
end

---@type vim.lsp.Config
return {
  cmd = { 'basedpyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {
    'pyrightconfig.json',
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    '.git',
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
        typeCheckingMode = 'basic',
      },
    },
  },
  on_init = function(client)
    -- Native LSP resolves the root_dir based on your root_markers.
    local root_dir = client.root_dir or (client.workspace_folders and client.workspace_folders[1].name)
    
    if root_dir then
      -- Prioritize .venv (uv default) over venv
      local venv_paths = {
        root_dir .. '/.venv/bin/python',
        root_dir .. '/venv/bin/python',
      }
      
      for _, path in ipairs(venv_paths) do
        if vim.fn.executable(path) == 1 then
          -- Safely inject the detected Python executable into Pyright's settings using the nightly syntax
          if client.settings then
            client.settings.python = vim.tbl_deep_extend('force', client.settings.python or {}, { pythonPath = path })
          else
            client.config.settings = vim.tbl_deep_extend('force', client.config.settings, { python = { pythonPath = path } })
          end
          
          -- Notify Pyright of the injected environment
          client:notify('workspace/didChangeConfiguration', { settings = nil })
          break
        end
      end
    end
  end,
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, 'LspBasedPyrightOrganizeImports', function()
      local params = {
        command = 'basedpyright.organizeimports',
        arguments = { vim.uri_from_bufnr(bufnr) },
      }

      ---@diagnostic disable-next-line: param-type-mismatch
      client.request('workspace/executeCommand', params, nil, bufnr)
    end, {
      desc = 'Organize Imports',
    })
    vim.api.nvim_buf_create_user_command(bufnr, 'LspBasedPyrightSetPythonPath', set_python_path, {
      desc = 'Reconfigure basedpyright with the provided python path',
      nargs = 1,
      complete = 'file',
    })
  end,
}
