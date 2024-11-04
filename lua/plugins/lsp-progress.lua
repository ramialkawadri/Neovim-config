return {
    "linrongbin16/lsp-progress.nvim",
    opts = {
        max_size = 40,

        format = function(client_messages)
            -- icon: nf-fa-gear \uf013
            if #client_messages > 0 then
                return table.concat(client_messages, " ")
            end
            return ""
        end,
        client_format = function(_, _, series_messages)
            return #series_messages > 0
                and (table.concat(series_messages, ", "))
                or nil
        end,
    },
}
