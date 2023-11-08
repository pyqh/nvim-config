return {
  {
    "nvim-telescope/telescope.nvim",
    version = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = vim.fn.executable("make") == 1,
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
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
    "RRethy/vim-illuminate", -- highlighting other uses of the word under the cursor
    config = function()
      require("illuminate").configure()
    end,
  },
  { "folke/trouble.nvim", opts = { cycle_results = false } },
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
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
      window = {
        mappings = {
          ["<Tab>"] = "toggle_node",
          ["o"] = "open",
          ["p"] = {
            "toggle_preview",
            config = { use_float = false, use_image_nvim = true },
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
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>ol", "<cmd>SymbolsOutline<cr>" } },
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    -- event = "BufReadPost",
    config = function()
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.keymap.set("n", "z", function()
        require("ufo").closeFoldsWith(1)
      end)
      vim.keymap.set("n", "z2", function()
        require("ufo").closeFoldsWith(2)
      end)
      vim.keymap.set("n", "z3", function()
        require("ufo").closeFoldsWith(3)
      end)
      vim.keymap.set("n", "z4", function()
        require("ufo").closeFoldsWith(4)
      end)
      vim.keymap.set("n", "Z", require("ufo").openAllFolds)
      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").set_default_keymaps()
    end,
  },
}
