-- install with
-- pacman -S markdown-oxide

---@brief
---@type vim.lsp.Config
return {
    root_markers = { '.git', '.obsidian', '.moxide.toml' },
    filetypes = { 'markdown' },
    cmd = { 'markdown-oxide' },
}
