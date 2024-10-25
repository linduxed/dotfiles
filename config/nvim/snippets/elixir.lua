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
        { trig = "shebang", name = "#!-line for elixir" },
        { t({
            "#!/usr/bin/env elixir",
            "",
            "",
        }) }
    ),
    s(
        { trig = "doc", name = "function documentation" },
        { t({ '@doc """',
            "" }), i(1, "function description"), t({ "",
            '"""' }) }
    ),
    s(
        { trig = "mdoc", name = "module documentation" },
        { t({ '@moduledoc """',
            "" }), i(1, "module description"), t({ "",
            '"""' }) }
    ),
    s(
        { trig = "p", name = "pipe" },
        { t("|> "), i(1, "") }
    ),
    s(
        { trig = "fn", name = "lambda function" },
        { t("fn "), i(1, "x"), t(" -> "), i(2, ""), t(" end") }
    ),
    s(
        { trig = "fnm", name = "lambda function (multiline)" },
        {
            t("fn "), i(1, "x"), t({ " ->",
            "  " }), i(2, ""), t({ "",
            "end" }),
        }
    ),
    s(
        { trig = "fnz", name = "lambda function" },
        { t("fn -> "), i(1, ""), t(" end") }
    ),
    s(
        { trig = "amp", name = "function capture ampersand" },
        { t("& &1"), i(1, "") }
    ),
    s(
        { trig = "pemap", name = "pipe-enum-map" },
        {
            t("|> Enum.map("),
            c(1, {
                sn(nil, { t("& &1"), i(1, "") }),
                sn(nil, {
                    t("fn "), i(1, "x"), t({ " ->",
                    "  " }), i(2, ""), t({ "",
                    "end" }),
                }),
            }),
            t(")"),
        }
    ),
    s(
        { trig = "penum", name = "pipe-enum" },
        { t("|> Enum."), i(1, "") }
    ),
    s(
        { trig = "enum", name = "bare-enum" },
        { t("Enum."), i(1, "") }
    ),
    s(
        { trig = "emap", name = "bare-map" },
        {
            t("Enum.map("),
            i(1, "enum"),
            t(", "),
            c(2, {
                sn(nil, { t("& &1"), i(1, "") }),
                sn(nil, {
                    t("fn "), i(1, "x"), t({ " ->",
                    "  " }), i(2, ""), t({ "",
                    "end" }),
                }),
            }),
            t(")"),
        }
    ),
    s(
        { trig = "pstr", name = "pipe-stream" },
        { t("|> Stream."), i(1, "") }
    ),
    s(
        { trig = "pmap", name = "pipe-map" },
        { t("|> Map."), i(1, "") }
    ),
    s(
        { trig = "spec", name = "typespec", },
        {
            t("@spec "),
            i(1, "name"),
            t("("),
            i(2, "name"),
            t(") :: "),
            i(3, "returns")
        }
    ),
    s(
        { trig = "test", name = "test clause", },
        {
            t("test \""), i(1, "test name"), t({ "\" do",
            "  " }), i(2, ""), t({ "",
            "end" }),
        }
    ),
    s(
        { trig = "desc", name = "describe clause", },
        {
            t("describe \""), i(1, "test group subject"), t({ "\" do",
            "  " }), i(2, ""), t({ "",
            "end" }),
        }
    ),

    -- LiveView
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

-- TODO snippets:
--
-- snippet op
--     @opaque ${1:type_name} :: ${2:type}
-- snippet ty
--     @type ${1:type_name} :: ${2:type}
-- snippet typ
--     @typep ${1:type_name} :: ${2:type}
-- snippet cb
--     @callback ${1:name}(${2:args}) :: ${3:returns}
-- snippet defd
--     @doc """
--     ${1:doc string}
--     """
--     def ${2:name} do
--         ${0}
--     end
-- snippet defs
--     @spec ${1:name}(${2:arg types}) :: ${3:no_return}
--     def $1(${4:args}) do
--         ${0}
--     end
-- snippet defsd
--     @doc """
--     ${1:doc string}
--     """
--     @spec ${2:name}(${3:arg types}) :: ${4:no_return}
--     def $2(${5:args}) do
--         ${0}
--     end
-- snippet defmo
--     defmodule ${1:`substitute(vim_snippets#Filename(), '\(_\|^\)\(.\)', '\u\2', 'g')`} do
--         ${0}
--     end
-- snippet destag
--     @describetag :${1:describe tag}
-- snippet mtag
--     @moduletag :${1:module tag}
-- snippet tp
--     @tag :pending
-- snippet exunit
--     defmodule ${1:`substitute(vim_snippets#Filename(), '\(_\|^\)\(.\)', '\u\2', 'g')`} do
--         use ExUnit.Case, async: true
--
--         ${0}
--     end
-- snippet pry
--     require IEx; IEx.pry
--     ${0}
-- snippet ppry
--     |> (fn x -> require IEx; IEx.pry; x end).()${0}
-- snippet >i pipe to inspect
--     |> IO.inspect
-- snippet >il pipe to inspect with label
--     |> IO.inspect(label: "${1:label}")
-- snippet genserver basic genserver structure
--     use GenServer
--
--     @doc false
--     def start_link do
--         GenServer.start_link(__MODULE__, ${1:Map.new})
--     end
--
--     @impl true
--     def init(state) do
--         {:ok, state}
--     end
