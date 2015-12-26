module Rubbish

  module Fish
    @@sh = 'fish'
    def self.sh=(sh)
      @@sh = sh
    end
    def self.sh
      @@sh
    end
    def fish(a=nil, b=nil, &c)
      Rubbish.shell(Fish.sh, a, b, &c)
    end
  end
  extend Fish

end
