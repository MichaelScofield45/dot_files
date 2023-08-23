local ls = require("luasnip")
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node

ls.add_snippets("lua", {
  s("fn", {
    t({ "function()", "\t" }),
      i(0),
      t({ "\t", "end" }),
    }),

    s(
    "new",
    fmt(
    [[
    function {}({})
    {}
  end
  ]],
  {
    i(1),
    i(2),
    i(0, "body"),
  }
  )
  ),
})

ls.add_snippets("latex", {
  s("vec", fmta( [[ \vec{<>} ]], {i(0)})),

  s("begin", fmta(
      [[
        \begin{<>}
            <>
        \end{<>}
      ]],
      {
        i(1),
        i(0, "body"),
        rep(1)
      }
    )
  ),

  s("table", fmta(
      [[
        \begin{tabular}
            <>
        \end{tabular}
      ]],
      {
        i(1, "body"),
      }
    )
  )
})
