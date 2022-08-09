local s = require("luasnip.nodes.snippet").S
local sn = require("luasnip.nodes.snippet").SN
local t = require("luasnip.nodes.textNode").T
-- local f = require("luasnip.nodes.functionNode").F
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

return {
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
        { trig = "amp", name = "function capture ampersand" },
        { t("& &1"), i(1, "") }
    ),
    s(
        { trig = "pmap", name = "pipe-map" },
        {
            t("|> Enum.map("),
            c(1, {
                sn(nil, {
                    t("& &1"), i(1, "")
                }),
                sn(nil, {
                    t("fn "), i(1, "x"), t(" -> "), i(2, ""), t(" end")
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
        { trig = "pstr", name = "pipe-stream" },
        { t("|> Stream."), i(1, "") }
    ),
    s(
        {
            trig = "spec",
            name = "typespec",
            desc = "standard typespec line"
        },
        {
            t("@spec "),
            i(1, "name"),
            t("("),
            i(2, "name"),
            t(") :: "),
            i(3, "returns")
        }
    )
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
-- snippet doc
--     @doc """
--     ${0}
--     """
-- snippet mdoc
--     @moduledoc """
--     ${0}
--     """
-- snippet test
--     test "${1:test name}" do
--         ${0}
--     end
-- snippet des
--     describe "${1:test group subject}" do
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
