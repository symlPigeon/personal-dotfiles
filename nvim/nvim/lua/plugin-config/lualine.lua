local status, lualine = pcall(require, "lualine")
if not status then
    vim.notify("lualine not found", vim.log.levels.WARN)
    return
end

lualine.setup({
    options = {
        theme = "moonlight",
        component_separators = {
            left = "|",
            right = "|"
        },
        section_separators = {
            left = " ",
            right = ""
        }
    },
    extensions = {
        "nvim-tree",
        "toggleterm"
    },
    sections = {
        lualine_c = {
            "filename",
        },
        lualine_x = {
            "filesize",
            {
                "fileformat",
                symbols = {
                    unix = "LF",
                    dos = "CRLF",
                    mac = "CR"
                }
            },
            "encoding",
            "filetype"
        }
    }
})
