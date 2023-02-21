local M = {}

function M.on_attach(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gd",         vim.lsp.buf.definition,  bufopts)
    vim.keymap.set("n", "K",          vim.lsp.buf.hover,       bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,      bufopts)
    vim.keymap.set("n", "<leader>F",  vim.lsp.buf.format,      bufopts)

    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, bufopts)

    vim.keymap.set("n", "<leader>ds", ":Telescope lsp_document_symbols<CR>", bufopts)
    vim.keymap.set("n", "<leader>rr", ":Telescope lsp_references<CR>",       bufopts)
end

return M
