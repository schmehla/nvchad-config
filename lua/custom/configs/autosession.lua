local function close_all_floating_wins()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= '' then
      vim.api.nvim_win_close(win, false)
    end
  end
end

local function restore_nvimtree()
  local nvim_tree_api = require("nvim-tree.api")
  nvim_tree_api.tree.open(vim.fn.getcwd())
end

local function close_nvimtree()
  require("nvim-tree.api").tree.close()
end

local function attach_tmux()
  local terminal = require("nvterm.terminal")
  terminal.send("tmux new-session -A -s " .. vim.fn.getcwd(), "horizontal")
  terminal.send("tmux new-session -A -s " .. vim.fn.getcwd(), "vertical")
  -- terminal.toggle("horizontal") why does this not work?
end

require("auto-session").setup {
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/", "~/repos"},
  pre_save_cmds = { close_all_floating_wins, close_nvimtree, require("nvterm.terminal").close_all_terms },
  pre_restore_cmds = { attach_tmux, restore_nvimtree },

  auto_session_use_git_branch = false,

  auto_session_enable_last_session = false,
}
