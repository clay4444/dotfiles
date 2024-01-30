local M = {
  config_path = vim.fn.stdpath("config"),

  keys = {

    leader_key = ",",

    -- Prev and next in the command mode.
    c_next_item = "<C-j>",
    c_prev_item = "<C-k>",

    -- Save and quit related.
    n_save = "<leader>w",            -- :w
    n_save_quit = "<leader>x",       -- :wq / :x
    n_save_all = "<leader>wa",       -- :wa
    n_force_quit = "<leader>q",      -- :qa!

    n_v_10k = "<C-u>",
    n_v_10j = "<C-d>",


    -- luasnip
    snip_jump_next = "<C-l>",
    snip_jump_prev = "<C-h>",
    snip_next_choice = "<C-j>",
    snip_prev_choice = "<C-k>",

    s_windows = {

      enable = true,

      split_vertically = "sv",
      split_horizontally = "sh",
      close = "sc",
      close_others = "so",

      jump_left = "<C-h>",
      jump_right = "<C-l>",
      jump_up = "<C-k>",
      jump_down = "<C-j>",

      width_decrease = "s,",
      width_increase = "s.",
      height_decrease = "sj",
      height_increase = "sk",
      size_equal = "s=",
    },

    s_tab = {
      split = "ts",
      prev = "th",
      next = "tl",
      first = "tj",
      last = "tk",
      close = "tc",
    },

    fold = {
      open = "Z",
      close = "zz",
    },

    format = "<leader>f",

    terminal_to_normal = "<Esc>",
    -- TODO

    -- proxy
    -- im-select
  },

  enable_magic_search = true,

  nvimTree = {

    enable = true,

    toggle = "<leader>m",
    edit = { "<CR>", "o", "<2-LeftMouse>" },
    -- TODO: What does 'system_open' mean?
    system_open = "<CR>",
    vsplit = "v",
    split = "h",
    -- toggle .gitignore (git enable)
    toggle_git_ignored = "i",
    -- Hide (dotfiles)
    toggle_dotfiles = ".",
    -- togglle custom config
    toggle_custom = "u",

    refresh = "<F5>",
    -- File operation.
    create = "a",
    remove = "d",
    rename = "r",
    cut = "x",
    copy = "c",
    paste = "p",
    copy_name = "y",
    copy_path = "Y",
    copy_absolute_path = "gy",
    toggle_file_info = "I",
    tabnew = "t",
    cd = "]",
    dir_up = "[",
  },

  bufferLine = {

    enable = true,

    prev = "<s-tab>",
    next = "<tab>",
    close = "<C-w>",
    close_left = "<leader>bh",
    close_right = "<leader>bl",
    close_others = "<leader>bo",
    close_pick = "<leader>bp",
  },

  telescope = {

    enable = true,

    find_files = "<C-p>",
    live_grep = "<C-f>",

    move_selection_next = "<Down>",
    move_selection_previous = "<Up>",
    cycle_history_next = "<C-j>",
    cycle_history_prev = "<C-k>",
    close = "<esc>",
    preview_scrolling_up = "<C-u>",
    preview_scrolling_down = "<C-d>",
  },

  mkdnflow = {
    enable = true,
    next_link = "gn",
    prev_link = "gp",
    next_heading = "gj",
    prev_heading = "gk",
    go_back = "<C-o>",
    follow_link = "gd",
    toggle_item = "tt",
  },

  comment = {
    enable = true,
    -- Shortcut in normal mode.
    toggler = {
      line = "gcc",  -- Line comment.
      block = "gbc", -- Block comment.
    },
    -- Shortcut in visual mode.
    opleader = {
      line = "gc",
      block = "gb",
    },
  },

  toggleterm = {
    enable = true,

    -- Float mode.
    toggle_window_A = "<leader>ta",
    -- Right window.
    toggle_window_B = "<leader>tb",
    -- Below window.
    toggle_window_C = "<leader>tc",
  },

  venn = {
    -- toggle keymappings for venn using <leader>v
    enable = true,
    -- venn.nvim: enable or disable keymappings
    toggle = "<leader>v",
    -- draw a box by pressing "f" with visual selection
    draw_box = "f",
  },

  zen = {
    enable = true,
    toggle = "<leader>z",
  },

  lsp = {
    rename = "<leader>rn",
    code_action = "<leader>ca",
    format = "<leader>f",
    definition = "gd",
    declaration = "gD",
    references = "gr",
    implementation = "gi",
    hover = "gh",
    -- diagnostic
    open_flow = "gp",
    goto_next = "gj",
    goto_prev = "gk",
  },

  -- cmp related.
  cmp = {
    complete = "<C-.>",
    abort = "<C-,>",
    confirm = "<CR>",
    scroll_doc_up = "<C-u>",
    scroll_doc_down = "<C-d>",
    select_prev_item = "<C-k>",
    select_next_item = "<C-j>",
  },
}

return M
