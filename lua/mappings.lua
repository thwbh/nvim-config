require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- aerial
map("n", "<leader>a", "<cmd>AerialToggle!<CR>")

local M = {}
M.dap = {
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle Breakpoint"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require "dap.ui.widgets";
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end
    }
  }
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function ()
        require "crates".upgrade_all_crates()
      end,
      "update crates"
    }
  }
}

return M

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
