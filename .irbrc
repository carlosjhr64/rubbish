require 'rubbish'

# IRB Tools
require 'irbtools/configure'
_ = Rubbish::VERSION.split('.')[0..1].join('.')
Irbtools.welcome_message = "### Rubbish(#{_}) ###"
require 'irbtools'
IRB.conf[:PROMPT][:Rubbish] = {
  PROMPT_I:    '> ',
  PROMPT_N:    '| ',
  PROMPT_C:    '| ',
  PROMPT_S:    '| ',
  RETURN:      "=> %s \n",
  AUTO_INDENT: true,
}
IRB.conf[:PROMPT_MODE] = :Rubbish
