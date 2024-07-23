# Транслитерация кириллицы в латиницу
Модуль переводит символы кириллицы в латиницу.

### Параметры
- **str** (строка): Строка для транслитерации
- **opts** (таблица [опционально]):
   - `invalid_char_replacement = 'symbol'` - Замена специальных символов

# Установка
### tarantool
```bash
tt rocks install --only-server=https://rocks.antibot.ru translit
```
### luarocks
```bash
luarocks install --server=https://rocks.antibot.ru translit
```

# Использование
```lua
local translit = require('translit')

local str = translit('Привет, Мир!')
print(str) -- Privet, Mir!
```

# Генерация ldoc
```bash
ldoc -s '!new' -d ldoc lua
```

# Тестирование
```bash
luatest test/*
```
