return {
    {
        "folke/persistence.nvim",
        keys = function(_, keys)
            keys = keys or {}

            local function current_session_file()
                local persistence = require("persistence")
                local file = persistence.current()
                if vim.fn.filereadable(file) == 0 then
                    file = persistence.current({ branch = false })
                end
                if vim.fn.filereadable(file) == 0 then
                    return nil
                end
                return file
            end

            local function delete_current_session()
                local persistence = require("persistence")
                local file = current_session_file()
                if not file then
                    vim.notify("No current session file found", vim.log.levels.INFO)
                    return
                end

                local ok = vim.fn.delete(file) == 0
                if not ok then
                    vim.notify("Failed to delete session: " .. file, vim.log.levels.ERROR)
                    return
                end

                persistence.stop()
                vim.notify("Deleted session and disabled autosave for this run", vim.log.levels.INFO)
            end

            local function resume_session_persist()
                local persistence = require("persistence")
                persistence.start()
                vim.notify("Session autosave re-enabled", vim.log.levels.INFO)
            end

            vim.list_extend(keys, {
                { "<leader>qD", delete_current_session, desc = "Delete Current Session" },
                { "<leader>qR", resume_session_persist, desc = "Resume Session Saving" },
            })

            return keys
        end,
    },
    {
        "saghen/blink.cmp",
        opts = {
            snippets = {
                score_offset = 0.5
            },
            completion = {
                ghost_text = {
                    show_with_menu = false
                },
            },
            sources = {
                providers = {
                    lsp = { async = true },
                    snippets = {
                        score_offset = 1
                    },
                },
            },
        },
    },
}
