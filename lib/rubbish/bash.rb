module Rubbish

  module Bash
    @@sh = 'bash'
    def self.sh=(sh)
      @@sh = sh
    end
    def self.sh
      @@sh
    end
    def bash(a=nil, b=nil, &c)
      Rubbish.shell(Bash.sh, a, b, &c)
    end
  end
  extend Bash

end
