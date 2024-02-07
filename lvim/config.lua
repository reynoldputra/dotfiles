--[[

░█████╗░░█████╗░███╗░░██╗███████╗██╗░██████╗░░░░██╗░░░░░██╗░░░██╗░█████╗░
██╔══██╗██╔══██╗████╗░██║██╔════╝██║██╔════╝░░░░██║░░░░░██║░░░██║██╔══██╗
██║░░╚═╝██║░░██║██╔██╗██║█████╗░░██║██║░░██╗░░░░██║░░░░░██║░░░██║███████║
██║░░██╗██║░░██║██║╚████║██╔══╝░░██║██║░░╚██╗░░░██║░░░░░██║░░░██║██╔══██║
╚█████╔╝╚█████╔╝██║░╚███║██║░░░░░██║╚██████╔╝██╗███████╗╚██████╔╝██║░░██║
░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░░░░╚═╝░╚═════╝░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝

LunarVim configuratin file

--]]
-------------- default / general -----------------

lvim.log.level = "warn"
-- lvim.format_on_save.enabled = false
-- lvim.colorscheme = "onedark_vivid"
lvim.colorscheme = "tokyonight"
-- lvim.colorscheme = "lunar"
-- lvim.colorscheme = "gruvbox"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
-- lvim.transparent_window = true
-- require "config.tokyonight"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

lvim.autocommands = {
  -- { "ColorScheme", { pattern = { "*" }, command = "highlight Special guifg=#5c5cff" } }
}

------------------------------------------
---------------- custom ------------------
------------------------------------------


lvim.plugins = {
  { "folke/tokyonight.nvim" },
  { "mg979/vim-visual-multi" },
  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
  },
  {
    "CRAG666/code_runner.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("config.coderunner")
    end,
  },
}

------- Code runner config --------
lvim.builtin.which_key.mappings["r"] = {
  name = "Run",
  s = {
    '<cmd>autocmd bufwritepost [^_]*.sass,[^_]*.scss  silent exec "!sass %:p %:r.css"<CR>',
    "Auto Compile Sass",
  },
  r = { "<cmd>RunCode<CR>", "Run Code" },
  f = { "<cmd>RunFile<CR>", "Run File" },
  p = { "<cmd>RunProject<CR>", "Run Project" },
  g = { "<cmd>ToggleTerm size=70 direction=vertical<cr>gradle run<cr>", "Run Gradle" },
  m = {
    "<cmd>ToggleTerm size=70 direction=vertical<cr>mvn exec:java -Dexec.mainClass=com.pojokcode.App<cr>",
    "Run MVN",
  },
}
------ Code runner config --------

------------------------------------------
---------------- custom ------------------
------------------------------------------


------------------------------------------
------------- lsp installer --------------
------------------------------------------
lvim.lsp.installer.setup.ensure_installed = {
  "sumneko_lua",
  "jsonls",
  "html",
  "cssls",
  "emmet_ls",
  "tsserver",
  "tailwindcss",
  "phpactor",
  "gopls"
}

require("lvim.lsp.manager").setup("emmet_ls")
require("lvim.lsp.manager").setup("phpactor")



------------------------------------------
-------------- formatters ----------------
------------------------------------------
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  {
    name = "prettier",
    args = { "--print-width", "100" },
  },
  { name = "gofmt" }
}

------------------------------------------
---------------- linters -----------------
------------------------------------------
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "eslint_d" },
  { name = "golangci_lint" }
}

require('settings')
require('keymaps')
