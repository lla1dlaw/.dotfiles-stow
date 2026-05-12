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
        "c", "bash",
        "java",
        "rust",
        "lua",
        "cpp",
        "bash",
        "yaml",
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
  end
}
