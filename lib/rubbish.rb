module Rubbish
  VERSION = '0.2.200128'
  SHELL_VERSION = {bash: nil, fish: nil}

  # Fine!
  # Let there be Rubbish.args!!!
  def self.args(*args)
    script, read  =  nil, true
    until args.empty?
      arg = args.shift
      case arg
      when String
        script = arg
      when TrueClass, FalseClass
        read = arg
      when Hash
        script = arg[:script]  if arg.has_key? :script
        read   = arg[:read]    if arg.has_key? :read
      end
    end
    return script, read
  end

  def self.shell(shell, *args, &block)
    script, read = Rubbish.args(*args)
    IO.popen(shell, (read)? 'w+' : 'w') do |pipe|
      # No matter what, we know we're going to write first.
      writing = true
      if script
        # We were given the script, so we write it and close.
        pipe.write script
        pipe.close_write
        writing = false
      end
      if block
        block.call(pipe)
        # close if we were writing
        pipe.close_write if writing
      end
      # Read if reading
      read = pipe.read if read
    end
    read || $?.to_i==0
  end

  def self.method_missing(shell, *args, &block)
    if args.length.between?(0,2) and SHELL_VERSION.has_key? shell
      if minimum = SHELL_VERSION[shell]
        minimum = Gem::Version.new minimum
        if version = `#{shell} --version`.scan(/\d+\.\d+\.\d+/).first
          version  = Gem::Version.new version
          bumped = minimum.bump
          raise "Need #{shell} version ~> #{minimum}" unless version >= minimum and version < bumped
          # need to only check once
          SHELL_VERSION[shell] = nil
        else
          raise "Could not get the #{shell} version"
        end
      end
      script, read  =  Rubbish.args(*args)
      return Rubbish.shell(shell.to_s, script, read,  &block)
    end
    super
  end
end

# Requires:
#`ruby`
#`bash`
#`fish`
