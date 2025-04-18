local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node

-- Function to get the correct comment prefix based on filetype
local function comment_prefix()
    local ft = vim.bo.filetype
    local comment_map = {
        python = "# TODO: ",
        cpp = "// TODO: ",
        c = "// TODO: ",
        java = "// TODO: ",
        lua = "-- TODO: ",
        sh = "# TODO: ",
        javascript = "// TODO: ",
        rust = "// TODO: ",
        go = "// TODO: ",
        cs = "// TODO: ",
    }
    return comment_map[ft] or "-- TODO: " -- Default comment style
end

-- Define the TODO snippet for all file types
ls.add_snippets("all", {
    s("todo", { f(comment_prefix, {}), t("") })
})
