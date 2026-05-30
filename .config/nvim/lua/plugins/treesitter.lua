return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require'nvim-treesitter'.setup {
      auto_install = true,
      highlight = { enabled=true },
      indent = { enabled=true },
      ensure_installed = {
        "vim",
        "vimdoc",
        "python",
        "c", 
        "cpp",
        "bash",
        "java",
        "rust",
        "lua",
        "yaml",
        "toml",
        "html",
        "css",
        "tailwind",
        "typescript",
        "tsx",
      }
    }

    -- add the zsh filetype and register zsh to use the bash parser
    vim.filetype.add({
      pattern = {
        ['%.zshrc'] = 'zsh',
        ['%.zprofile'] = 'zsh',
        ['%.zlogin'] = 'zsh',
        ['%.zshenv'] = 'zsh',
        ['%.zsh'] = 'zsh',
      },
    })

    vim.treesitter.language.register('bash', 'zsh')
    vim.treesitter.language.register('tsx', 'typescript')
  end
}
