local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local types = require("luasnip.util.types")
local ps = ls.parser.parse_snippet

ls.config.set_config{
  history = true,
  updateevents = "TextChanged,TextChangedI",
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "choiceNode", "Comment" } },
      },
    },
  },
  ext_base_prio = 300,
  ext_prio_increase = 1,
  enable_autosnippets = true
}

-- args is a table, where 1 is the text in Placeholder 1, 2 the text in
-- placeholder 2,...
local function copy(args)
	return args[1]
end

local rec_ls
rec_ls = function()
  return sn(nil, {
    c(1, {
      -- important!! Having the sn(...) as the first choice will cause infinite recursion.
      t({""}),
      -- The same dynamicNode as in the snippet (also note: self reference).
      sn(nil, {t({"", "\t\\item "}), i(1), d(2, rec_ls, {})}),
    }),
  });
end

local inline_math = s("ii", {t("\\("), i(1), t("\\)"), i(0)})

local display_math = s("dd", {
                        t({"\\[", "\t"}),
                        i(1),
                        t({"", "\\]", ""}),
                        i(0)
                      })

local math_aligned = 
  s("aligned", {
    t({"\\begin{aligned}", "\t", ""}),
    i(1),
    t({"", "\\end{aligned}", ""}),
    i(0)
  })

local anki_cloze = s("cl", {t("{{c1::"), i(1), t("}}"), i(0)})
--local anki_cloze = s("cl", {t(""), i(1), t("\}\}"), i(0)})
-- local anki_cloze = s("ii", {t("\\{"), i(1), t("\\)"), i(0)})

ls.snippets = {
  tex = {
    math_aligned,

    s("columns", {
      t({"\\begin{columns}["}), i(1, "t"), t({"]", "\t"}),
      i(2), t({"", ""}),
      t({"\\end{columns}", ""}),
      i(0)
    }),

    s("column", {
      t("\\begin{column}{"), i(1, "0.45\\linewidth"), t({"}", ""}),
      t("\t"), i(2), t({"", ""}),
      t({"\\end{column}", ""}),
      i(0),
    }),

    s("block", {
      t({"\\begin{block}{"}), i(1), t({"}", "\t"}),
      i(2),
      t({"", "\\end{block}", ""}),
      i(0)
    }),

    s("begin", {
      t("\\begin{"), i(1), t("}"),
      t({"", "\t"}),
      i(2),
      t({"", ""}),
      t("\\end{"), f(copy, 1), t("}"),
      t({"", ""}),
      i(0)
    }),

    s("sec", {
      t("\\section{"), i(1), t("}"),
      t({"", "\\label{sec:"}),
      i(2), 
      t({"}", ""}),
      i(0)
    }),

    s("frame", {
      t({"\\begin{frame}{"}), i(1), t({"}", "\t"}),
      i(2),
      t({"", "\\end{frame}", ""}),
      i(0)
    }),

    s("eq", {
      t({"\\begin{equation}", "\t\\label{eq:"}),
      i(1),
      t({"}", "\t"}),
      i(2),
      t({"", "\\end{equation}", ""}),
      i(0)
    }),

    s("eq", {
      t({"\\begin{equation}", "\t\\label{eq:"}),
      i(1),
      t({"}", "\t"}),
      i(2),
      t({"", "\\end{equation}", ""}),
      i(0)
    }),

    s("eqno", {
      t({"\\begin{equation*}", "\t"}),
      i(1),
      t({"", "\\end{equation*}", ""}),
      i(0)
    }),

    s("thm", {
      t({"\\begin{theorem}", "\t\\label{thm:"}),
      i(1),
      t({"}", "\t"}),
      i(2),
      t({"", "\\end{theorem}", ""}),
      i(0)
    }),

    s("em", {t("\\emph{"), i(1), t("}"), i(0)}),

    s("op", {t("\\operatorname{", i(1), t("}"), i(0))}),

    s("ul", {
      t({"\\begin{itemize}", "\t\\item "}),
      i(1),
      d(2, rec_ls, {}),
      t({"", "\\end{itemize}", ""}),
      i(0)
    }),

    s("ol", {
      t({"\\begin{enumerate}", "\t\\item "}),
      i(1),
      d(2, rec_ls, {}),
      t({"", "\\end{enumerate}", ""}),
      i(0)
    }),
  },
  pandoc = {
    aligned,
    anki_cloze,
  },
  rmarkdown = {
    aligned,
    anki_cloze,
  },
  markdown = {
    aligned,
    anki_cloze,
  },
}

ls.autosnippets = {
  tex = {
    inline_math,
    display_math,
  },
  pandoc = {
    inline_math,
    display_math,
  },
  markdown = {
    inline_math,
    display_math,
  },
  rmarkdown = {
    inline_math,
    display_math,
  },
}
