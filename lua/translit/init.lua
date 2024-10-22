--- Транслитерация кириллицы в латиницу
--
-- @module translit

local utf8 = require('utf8')
local translit

local RuTranslit = {
  ['а'] = 'a',
  ['б'] = 'b',
  ['в'] = 'v',
  ['г'] = 'g',
  ['д'] = 'd',
  ['е'] = 'e',
  ['ё'] = 'yo',
  ['ж'] = 'zh',
  ['з'] = 'z',
  ['и'] = 'i',
  ['й'] = 'y',
  ['к'] = 'k',
  ['л'] = 'l',
  ['м'] = 'm',
  ['н'] = 'n',
  ['о'] = 'o',
  ['п'] = 'p',
  ['р'] = 'r',
  ['с'] = 's',
  ['т'] = 't',
  ['у'] = 'u',
  ['ф'] = 'f',
  ['х'] = 'kh',
  ['ц'] = 'ts',
  ['ч'] = 'ch',
  ['ш'] = 'sh',
  ['щ'] = 'shch',
  ['ъ'] = '',
  ['ы'] = 'y',
  ['ь'] = '',
  ['э'] = 'e',
  ['ю'] = 'yu',
  ['я'] = 'ya',
  ['А'] = 'A',
  ['Б'] = 'B',
  ['В'] = 'V',
  ['Г'] = 'G',
  ['Д'] = 'D',
  ['Е'] = 'E',
  ['Ё'] = 'Yo',
  ['Ж'] = 'Zh',
  ['З'] = 'Z',
  ['И'] = 'I',
  ['Й'] = 'Y',
  ['К'] = 'K',
  ['Л'] = 'L',
  ['М'] = 'M',
  ['Н'] = 'N',
  ['О'] = 'O',
  ['П'] = 'P',
  ['Р'] = 'R',
  ['С'] = 'S',
  ['Т'] = 'T',
  ['У'] = 'U',
  ['Ф'] = 'F',
  ['Х'] = 'Kh',
  ['Ц'] = 'Ts',
  ['Ч'] = 'Ch',
  ['Ш'] = 'Sh',
  ['Щ'] = 'Shch',
  ['Ъ'] = '',
  ['Ы'] = 'Y',
  ['Ь'] = '',
  ['Э'] = 'E',
  ['Ю'] = 'Yu',
  ['Я'] = 'Ya',
}

--- Переводит строку кириллицы в латиницу
--
-- @param str Строка для перевода
-- @param[opt] opts Опции
-- @param opts.invalid_char_replacement (string): Символ, который заменит специальные символы
-- @return result Строка
-- @usage
  -- local str = translit('Привет, Мир!')
  -- print(str) -- Privet, Mir!
function translit(str, opts)
  opts = opts or {}

  local result = ''
  for i = 1, utf8.len(str) do
    local char = utf8.sub(str, i, i)
    if RuTranslit[char] then
      result = result .. RuTranslit[char]
    else
      if opts.invalid_char_replacement then
        -- Замена символа за пределами ascii
        if string.byte(char, 2) then
          result = result .. opts.invalid_char_replacement
        else
          -- Замена специального символа (знак препинания, пробел, управляющий символ или '_')
          result = result .. char:gsub('[%p%c%s_]', opts.invalid_char_replacement)
        end
      else
        result = result .. char
      end
    end
  end

  return result
end

return translit
