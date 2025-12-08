return {
  "yetone/avante.nvim",
  build = "make",
  event = "VeryLazy",
  lazy = false,
  version = false,
  opts = {
    provider = "copilot",
    auto_suggestions_provider = "copilot",

    -- 動作設定
    behaviour = {
      auto_suggestions = false,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
      minimize_diff = true,
    },

    -- ウィンドウ設定
    windows = {
      position = "right",  -- サイドバーの位置
      wrap = true,        -- テキストの折り返し
      width = 30,         -- サイドバーの幅
      -- その他の詳細設定は省略
    },
  },
  context_manager = "frontier",
  -- 依存関係の設定
  dependencies = {
    -- 必須の依存関係
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- オプションの依存関係
    "hrsh7th/nvim-cmp",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
    -- その他の拡張機能
  }
}
-- return {
--   -- avante.nvim の設定
--   {
--     "yetone/avante.nvim",
--     event = "VeryLazy",
--     lazy = false, -- 初期ロード時に有効にする場合は false
--     version = false, -- 最新の変更を常にプルしたい場合は false
--     opts = {
--       -- Bedrock をプロバイダとして指定
--       provider = "bedrock",
--
--       -- Bedrock 固有の設定 (モデルIDは適宜変更してください)
--       model = "anthropic.claude-3-sonnet-20240229-v1:0", -- 例: Claude 3 Sonnet
--       -- model = "amazon.titan-text-express-v1", -- Titan モデルの場合
--       -- model = "meta.llama3-8b-instruct-v1:0", -- Llama 3 の場合
--
--       -- その他の avante.nvim の設定
--       -- 動作に関する設定
--       behaviour = {
--         auto_suggestions = true, -- 自動補完を有効にするか
--         auto_set_highlight_group = true,
--         auto_set_keymaps = true, -- デフォルトキーマップを自動設定
--         edit_in_place_replace_cursor = false,
--       },
--       -- UIに関する設定
--       ui = {
--         window_options = { -- フローティングウィンドウのオプション
--           border = "single",
--           width = 80,
--           height = 30,
--         },
--         mode_icons = {
--           -- AIとの対話モードでのアイコン設定
--           prompt = "󰚑 ",
--           chat = "󰍡 ",
--           select = "󰮙 ",
--           edit = "󰏫 ",
--           replace = "󰏫 ",
--           explain = "󰅵 ",
--           test = "󰨇 ",
--           refactor = "󱪖 ",
--           generate = "󰏫 ",
--           review = "󱍊 ",
--           summary = "󰅜 ",
--           diff = "󰽓 ",
--           git = "󰊢 ", -- 新たに設定するアイコン
--         },
--       },
--       -- プロンプトのテンプレート (カスタマイズ可能)
--       prompts = {
--         chat = "You are a helpful AI assistant. Always remember previous messages in the current buffer. Do not output anything other than your response.",
--         edit = "You are a helpful AI assistant. The user wants to edit the selected code. Output only the modified code.",
--         explain = "You are a helpful AI assistant. Explain the following code clearly and concisely.",
--         -- GitHub 連携用のカスタムプロンプト例
--         pr_summary = [[
--           You are a helpful AI assistant for GitHub pull requests.
--           Based on the following git diff and commit messages, generate a concise and informative pull request title and body.
--           The body should include:
--           - A brief summary of the changes.
--           - Why the changes were made (purpose/problem solved).
--           - What specific files/areas were affected.
--           - (Optional) Any notes for reviewers or known limitations.
--           Format the output clearly.
--
--           --- Git Diff ---
--           %s
--           --- Commit Messages ---
--           %s
--         ]],
--         issue_template_fill = [[
--           You are a helpful AI assistant for GitHub issues.
--           Based on the following context (error logs, code snippets, user description), fill in the provided GitHub issue template.
--           Output only the filled template content.
--
--           --- Context ---
--           %s
--
--           --- Issue Template ---
--           %s
--         ]],
--         commit_message_gen = [[
--           You are a helpful AI assistant for Git commit messages.
--           Based on the following git diff and user instructions, generate a concise and informative commit message following the Conventional Commits specification.
--           Focus on a single, clear subject line (type: scope: subject).
--           The body should explain the 'what' and 'why' of the changes.
--           Output only the commit message.
--
--           --- Git Diff ---
--           %s
--           --- User Instructions ---
--           %s
--         ]],
--       },
--     },
--     -- avante.nvim が依存するプラグイン
--     dependencies = {
--       "nvim-lua/plenary.nvim", -- 必須: 非同期処理やユーティリティ
--       "MunifTanjim/nui.nvim",   -- 必須: UIコンポーネント (フローティングウィンドウなど)
--       "stevearc/dressing.nvim", -- オプション: プロンプト入力や選択UIの見た目を改善
--       "MeanderingProgrammer/render-markdown.nvim", -- オプション: AIのMarkdown出力をレンダリング
--       -- nvim-cmp を使用する場合はこれも追加
--       -- "hrsh7th/nvim-cmp",
--     },
--   },
-- }
