local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local date = function() return { os.date('%Y-%m-%d') } end

ls.add_snippets(nil, {
  all = {
    snip({
      trig = "date",
      namr = "Date",
      dscr = "Date in the form of YYYY-MM-DD",
    }, {
      func(date, {}),
    }),

    snip({
      trig = "co",
      namr = "Const",
      dscr = "Template for a const declaration",
    }, {
      text("const "),
      insert(1, "variable"),
      text(" = "),
      insert(2),
    }),

    snip({
      trig = "rn",
      namr = "Return",
      dscr = "Template for a return statement",
    }, {
      text("return "),
      insert(1),
      text(";"),
    }),
  },
})

ls.add_snippets('typescript', {

  snip({
    trig = "ex",
    namr = "Export",
    dscr = "Basic export statement",
  }, {
    text("export "),
    insert(1, "default "),
  }),

  snip({
    trig = "im",
    namr = "Import",
    dscr = "Template for an import statement",
  }, {
    text("import "),
    insert(1, "moduleName"),
    text(" from "),
  }),

})

ls.add_snippets('typescriptreact', {
  snip({
    trig = "rfc",
    namr = "React Functional Component",
    dscr = "Template for a React functional component",
  }, {
    text({ "import React from 'react';", "", "const " }),
    insert(1, "ComponentName"),
    text(" = (props) => {"),
    text({ "", "  return (" }),
    text({ "    <div>" }),
    insert(2, "Component content"),
    text({ "    </div>", "  );", "};", "", "export default " }),
    insert(1),
    text(";"),
  }),

  snip({
    trig = "ex",
    namr = "Export",
    dscr = "Basic export statement",
  }, {
    text("export "),
    insert(1, "default "),
  }),

  snip({
    trig = "im",
    namr = "Import",
    dscr = "Template for an import statement",
  }, {
    text("import "),
    insert(1, "moduleName"),
    text(" from "),
  }),
})
