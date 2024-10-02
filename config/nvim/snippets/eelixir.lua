local s = require("luasnip.nodes.snippet").S
local sn = require("luasnip.nodes.snippet").SN
local t = require("luasnip.nodes.textNode").T
local f = require("luasnip.nodes.functionNode").F
local i = require("luasnip.nodes.insertNode").I
local c = require("luasnip.nodes.choiceNode").C
-- local d = require("luasnip.nodes.dynamicNode").D
-- local r = require("luasnip.nodes.restoreNode").R
-- local l = require("luasnip.extras").lambda
-- local rep = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local types = require("luasnip.util.types")
-- local events = require("luasnip.util.events")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ai = require("luasnip.nodes.absolute_indexer")

local echo_fun = function(
    args, -- text from i(x) node, accessed with [1][1]
    _,    -- parent snippet or parent node, unused
    _     -- user_args from opts.user_args
)
    return args[1][1]
end

return {
    s(
        { trig = "t=", name = "template tag: <%= %>", },
        {
            t("<%= "), i(1, ""), t(" %>"),
        }
    ),
    s(
        { trig = "t-", name = "template tag: <% %>", },
        {
            t("<% "), i(1, ""), t(" %>"),
        }
    ),
    s(
        { trig = "tend", name = "template tag: <% end %>", },
        { t("<% end %>") }
    ),
    s(
        { trig = "ta", name = "template tag (arbitrary): <></>", },
        {
            t("<"), i(1, ""), t(">"),
            i(0, ""),
            t("</"), f(echo_fun, { 1 }, nil), t(">"),
        }
    ),
}
