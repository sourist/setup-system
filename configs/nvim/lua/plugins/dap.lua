return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "mfussenegger/nvim-dap-python",
        "theHamsta/nvim-dap-virtual-text",
    },
    keys = {
        -- F-keys (VSCode style)
        { "<F9>", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
        { "<F5>", "<cmd>DapContinue<cr>", desc = "Start/Continue Debugging" },
        { "<F11>", "<cmd>DapStepInto<cr>", desc = "Step Into" },
        { "<F10>", "<cmd>DapStepOver<cr>", desc = "Step Over" },
        { "<F4>", function() require("dap").terminate() end, desc = "Terminate Debugging" },
        
        -- Alternative mappings
        { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
        { "<leader>dc", "<cmd>DapContinue<cr>", desc = "Start/Continue Debugging" },
        { "<leader>di", "<cmd>DapStepInto<cr>", desc = "Step Into" },
        { "<leader>do", "<cmd>DapStepOver<cr>", desc = "Step Over" },
        { "<leader>dq", function() require("dap").terminate() end, desc = "Quit Debugging" },
        
        -- UI toggles
        { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle Debug UI" },
        { "<leader>de", function() require("dapui").eval() end, desc = "Evaluate variable under cursor" },
        { "<leader>dw", function() require("dapui.elements.watches").add(vim.fn.expand("<cword>")) end, desc = "Add to Watches" },
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("dapui").setup({
            layouts = {
                {
                    elements = {
                        { id = "watches", size = 0.7 },
                        { id = "scopes", size = 0.3 },
                    },
                    position = "right",
                    size = 40,
                },
                {
                    elements = {
                        { id = "console", size = 1.0 },
                    },
                    position = "bottom",
                    size = 10,
                },
            },
        })
        require("nvim-dap-virtual-text").setup()

        -- Mason installed debugpy path
        local debugpy_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
        require("dap-python").setup(debugpy_path)

        -- Auto-open UI on start
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        
        -- Icons
        vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "Error", linehl = "", numhl = "" })
        vim.fn.sign_define("DapStopped", { text = "▶", texthl = "Success", linehl = "CursorLine", numhl = "" })
    end,
}
