return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require'nvim-treesitter'.setup {
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "python",
        "c", 
        "cpp",
        "bash",
        "java",
        "rust",
        "yaml",
        "toml",
        "html",
        "css",
        "tailwind",
        "typescript",
        "tsx",
        "typst",
        "markdown_inline",
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
