-- Install with: npm i -g vscode-langservers-extracted

---@type vim.lsp.Config
return {
    cmd = { 'vscode-html-language-server', '--stdio' },
    filetypes = { 'html', 'htmlangular' },
    embeddedLanguages = { css = true, javascript = true },
}
