local M = {}

function M.goToDefinition()
    if vim.bo.filetype == 'cs' then
        require('omnisharp_extended').telescope_lsp_definition()
    else
        vim.cmd('TroubleToggle lsp_definitions')
    end
end

return M
