module Rubbish
  VERSION = '0.1.191209'
  SHELL_VERSION = {bash: nil, fish: nil}

  def self.shell(sh, script=nil, read: true, &block)
    IO.popen(sh, (read)? 'w+' : 'w') do |psh|
      # No matter what, we know we're going to write first.
      writing = true
      if script
        # We were given the script, so we write it and close.
        psh.write script 
        psh.close_write
        writing = false
      end
      if block
        block.call(psh)
        # close if we were writing
        psh.close_write if writing
      end
      # Read if reading
      read = psh.read if read
    end
    read || $?.to_i==0
  end

  def self.method_missing(shell, *args, &block)
    if args.length.between?(0,2) and SHELL_VERSION.has_key? shell
      if minimum = SHELL_VERSION[shell]
        minimum = Gem::Version.new minimum
        if version = `#{shell} --version`.scan(/\d+\.\d+\.\d+/).first
          version  = Gem::Version.new version
          bumped = mininum.bump
          raise "Need #{shell} version ~> #{minimum}" unless version >= minimum and version < bumped
          # need to only check once
          SHELL_VERSION[shell] = nil
        else
          raise "Could not get the #{shell} version"
        end
      end
      return Rubbish.shell(shell.to_s, *args, &block)
    end
    super
  end
end

# Requires:
#`ruby`
#`bash`
#`fish`
