-- local cmp = require 'cmp'

-- cmp.setup.filetype('vue', {
--   sources = cmp.config.sources({
--     { name = 'css-intellisense' }, -- You can specify the `cmp_git` source if you were installed it.
--   }, {
--     { name = 'buffer' },
--   })
-- })
local source = {}

local items = require("cmp-css-intellisense/items")

source.new = function()
  return setmetatable({}, { __index = source })
end

source.get_trigger_characters = function()
  return { "\"", " " }
end

source.get_keyword_patter = function()
  return "\\w"
end

source.complete = function(self, request, callback)
  if not self.items then
    self.items = items
  end
  callback(self.items)
end
