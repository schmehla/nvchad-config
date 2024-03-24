---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    }
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
  t = {
    -- ["<Esc>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
    -- switch between windows
    ["<C-h>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N><C-w>h", true, true, true), "Go left from terminal" },
    ["<C-l>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N><C-w>l", true, true, true), "Go right from terminal" },
    ["<C-j>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N><C-w>j", true, true, true), "Go down from terminal" },
    ["<C-k>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N><C-w>k", true, true, true), "Go up from terminal" },
  }
}

-- more keybinds!

M.dap = {
  n = {
    ["<leader>db"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Toggle breakpoint"
    },
    ["<leader>dc"] = {
      function()
        require("dap").continue()
      end,
      "Debug: start / continue"
    },
    ["<leader>ds"] = {
      function()
        require("dap").step_over()
      end,
      "Debug: step over"
    },
    ["<leader>di"] = {
      function()
        require("dap").step_into()
      end,
      "Debug: step into"
    },
    ["<leader>do"] = {
      function()
        require("dap").step_out()
      end,
      "Debug: step out"
    },
    ["<leader>dr"] = {
      function()
        require("dap").restart()
      end,
      "Debug: step out"
    },
    ["<leader>dx"] = {
      function()
        require("dap").terminate()
      end,
      "Debug: stop"
    },
  }
}

M.nvimtree = {
  t = {
    -- toggle
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- -- focus
    -- ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}


M.autosessions = {
  n = {
    ["<leader>s"] = {
     function()
        require("auto-session.session-lens").search_session()
      end,
      "Search session" }
  }
}

M.lazygit = {
  n = {
    ["<leader>gg"] = { "<cmd> LazyGit <CR>", "LazyGit"}
  }
}

return M
