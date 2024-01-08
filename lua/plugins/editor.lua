return {
  {
    "nvim-telescope/telescope.nvim",
    version = false,
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("telescope").setup({
        defaults = {
          prompt_prefix = "   ",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          mappings = {
            i = {
              ["<Esc>"] = require("telescope.actions").close,
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous,
              ["<C-f>"] = require("telescope.actions").preview_scrolling_down,
              ["<C-b>"] = require("telescope.actions").preview_scrolling_up,
            },
          },
        },
      })
    end,
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<cr>" },
      { "<leader>p", "<cmd>Telescope git_files<cr>" },
      { "rg", "<cmd>Telescope live_grep<cr>" },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
    opts = {
      filesystem = {
        filtered_items = {
          -- visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            "node_modules",
          },
        },
        follow_current_file = {
          enabled = true,
        },
        window = {
          mappings = {
            ["<Tab>"] = "open",
            ["<leftrelease>"] = "open",
            ["p"] = {
              "toggle_preview",
              config = { use_float = false, use_image_nvim = true },
            },
          },
        },
      },
    },
    config = function(_, opts)
      vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>")
      require("neo-tree").setup(opts)
    end,
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      vim.keymap.set("n", "<C-d>", require("illuminate").goto_next_reference)
      require("illuminate").configure()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
    },
  },
}
