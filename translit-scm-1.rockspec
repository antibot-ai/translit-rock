package = 'translit'
version = 'scm-1'
description = {
  summary = 'Transliterate Cyrillic script to Latin script',
  license = 'MIT'
}
source  = {
  url = 'file:///usr/local/src/app/'..package..'-'..version..'.tar.gz'
}
build = {
  type = 'builtin',
  modules = {
    ['translit'] = 'init.lua',
  }
}
dependencies = {
  'lua >= 5.1'
}
