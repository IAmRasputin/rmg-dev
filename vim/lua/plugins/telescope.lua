return {
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        }
    },
    {
        'nvim-telescope/telescope-file-browser.nvim',
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    }
}
