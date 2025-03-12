return {
    
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        config = function()
            require("nvim-autopairs").setup({
           check_ts = true, -- Enable Treesitter integration
                fast_wrap = {},
            })
        end
    
}

