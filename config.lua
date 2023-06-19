--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
--vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
--vim.opt.colorcolumn = "99999" -- fixes indentline for now
--vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0       -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
---vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
---vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
--vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
--vim.opt.hlsearch = true -- highlight all matches on previous search pattern
--vim.opt.ignorecase = true -- ignore case in search patterns
--vim.opt.mouse = "a" -- allow the mouse to be used in neovim
--vim.opt.pumheight = 10 -- pop up menu height
--vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
--vim.opt.showtabline = 2 -- always show tabs
--vim.opt.smartcase = true -- smart case
--vim.opt.smartindent = true -- make indenting smarter again
--vim.opt.splitbelow = true -- force all horizontal splits to go below current window
--vim.opt.splitright = true -- force all vertical splits to go to the right of current window
--vim.opt.swapfile = false -- creates a swapfile
--vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
--vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
--vim.opt.title = true -- set the title of window to the value of the titlestring
--vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
--vim.opt.undodir = vim.fn.stdpath "cache" .. "/undo"
--vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion
--vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
--vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2    -- insert 2 spaces for a tab
--vim.opt.cursorline = true -- highlight the current line
--vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 4       -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"    -- always show the sign column otherwise it would shift the text each time
vim.opt.wrap = false          -- display lines as one long line
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8


-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "lunar"
--lvim.transparent_window = true
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
--lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "html",
  "python",
  "typescript",
  "markdown",
  "tsx",
  "css",
  "rust",
  "java",
  "sql",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
require 'lspconfig'.marksman.setup {}


-- generic LSP settings
-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
--vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "eslint" })
--- list of options that should take precedence over any of LunarVim's defaults
--- check the lspconfig documentation for a list of all possible options
local opts = {
  -- [[
  -- uu
  -- ]]
  bin = 'eslint_d', -- or `eslint_d`
  code_actions = {
    enable = true,
    apply_on_save = {
      enable = true,
      types = { "directive", "problem", "suggestion", "layout" },
    },
    disable_rule_comment = {
      enable = true,
      location = "separate_line", -- or `same_line`
    },
  },
  diagnostics = {
    enable = true,
    report_unused_disable_directives = false,
    run_on = "type", -- or `save`
  },
  -- codeActions = {
  --   disableRuleComment = {
  --     enable = true,
  --     location = "separateLine"
  --   },
  --   showDocumentation = {
  --     enable = true
  --   }
  -- },
  -- codeActionOnSave = {
  --   enable = true,
  --   mode = "all"
  -- },

  --format = true,
  --nodePath = "",
  --onIgnoredFiles = "off",
  --packageManager = "npm",
  --quiet = false,
  --rulesCustomizations = {},
  --run = "onType",
  --useESLintClass = false,
  --validate = "on",
  --workingDirectory = {
  --  mode = "location"
  --}
}
require("lvim.lsp.manager").setup("eslint", opts)


local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "eslint_d",
    ---@usage specify which filetypes to enable. By default, providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },
  {
    command = "prettierd",
    ---@usage specify which filetypes to enable. By default, providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "tsx", "jsx", "typescript.tsx",
      "markdown", "md", "mdx" },
  },
}
-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint_d",
    ---@usage specify which filetypes to enable. By default, providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },
  {
    command = "sqlfluff",
    ---@usage specify which filetypes to enable. By default, providers will attach to all the filetypes it supports.
    filetypes = { "sql" },
  },
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    exe = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
  },
}




--lvim.keys.normal_mode["gd"] = "<Cmd>lua vim.lsp.buf.definition()<CR>" -- got to declaration
--lvim.lsp.buffer_mappings.normal_mode['H'] = { vim.lsp.buf.hover, "Show documentation (LSP)" }
lvim.lsp.buffer_mappings.normal_mode['gd'] = { vim.lsp.buf.definition, "[G]o to [d]efinition (LSP)" }
lvim.lsp.buffer_mappings.normal_mode['gi'] = { vim.lsp.buf.implementation, "[G]o to [i]mplementations (LSP)" }
lvim.lsp.buffer_mappings.normal_mode['gr'] = { vim.lsp.buf.references, "[G]o to [r]eferences (LSP)" }
lvim.lsp.buffer_mappings.normal_mode['cr'] = { vim.lsp.buf.rename, "[G]o to [r]eferences (LSP)" }


local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "Organised Imports"
  }
  vim.lsp.buf_request_sync(bufnr, "workspace/executeCommand", params, 500)
end

local function fix_all()
  local params = {
    command = "_typescript.FixAll",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "Fixed All"
  }
  vim.lsp.buf.execute_command(params)
end

local function add_missing_imports()
  local params = {
    command = "_typescript.AddMissingImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "Added missing imports"
  }
  vim.lsp.buf.execute_command(params)
end

local function remove_unused()
  local params = {
    command = "_typescript.RemoveUnused",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "Removed unused"
  }
  vim.lsp.buf.execute_command(params)
end

lvim.builtin.which_key.mappings["x"] = {
  ":bd<CR>", "close buffer"
}
lvim.builtin.which_key.mappings["c"] = {
  name = "Code",
  --f = { "<Space>lj<Space>la1<CR>", "Fix all" },
  f = { "mF:%!eslint_d --stdin --fix-to-stdout<CR>`F", "Fix all" },
  x = { ":bd <CR>", "close buffer" },
  o = { organize_imports, "organise imports" },
  r = { remove_unused, "remove unused" },
  a = { add_missing_imports, "add missing imports" },
}
lvim.builtin.which_key.mappings["l"]["f"] = {
  function()
    require("lvim.lsp.utils").format { timeout_ms = 2000 }
  end,
  "Format",
}
---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "eslint"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true,    -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },
  {
    "jakewvincent/mkdnflow.nvim",
    config = function()
      require("mkdnflow").setup({
        -- Config goes here; leave blank for defaults
      })
    end
  },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        user_default_options = {
          tailwind = true,
        },
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item)
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end
  }
}


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands = {
--   {
--     "BufEnter",     -- see `:h autocmd-events`
--     {
--                     -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
--       pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
--       command = 'silent! EslintFixAll',
--     }
--   },
-- }

-- lvim.autocommands = {
--   {
--     "BufEnter", -- see `:h autocmd-events`
--     {
--       -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
--       pattern = { "*.markdown", "*.md" }, -- see `:h autocmd-events`
--       command = 'lvim.keys.normal_mode["<CR>"] = ":MkdnEnter<CR>"', lvim.keys.normal_mode["<CR>"] = ":w<cr>"
--     }
--   },
-- }
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
