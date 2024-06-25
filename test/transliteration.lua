-- test/transliteration.lua
local luatest = require('luatest')
local g = luatest.group('translit')

-- Функция транслитерации
local translit = require('lua.translit.init')

-- Тесты
g.test_translit = function()
  local translitStr = translit('Привет, Мир!')
  luatest.assert_equals(translitStr, 'Privet, Mir!')
end

g.test_translit_opts = function()
  local translitStr = translit('Привет, Мир!', { invalid_char_replacement = '_' })
  luatest.assert_equals(translitStr, 'Privet__Mir_')
end