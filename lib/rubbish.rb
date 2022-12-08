module Rubbish
  VERSION = '1.1.221208'
  SHELL_VERSION = {bash: nil, fish: nil}
  # This is a contraction of Shellwords.escape function
  SHELLWORDS_ESCAPE = lambda{|w|w.gsub(/[^\w\-.,:+\/@\n]/,'\\\\\\&').gsub(/\n/,"'\n'")}

  def self.shell(script=nil, shell:'bash', read:true, &block)
    IO.popen(shell, (read)? 'w+' : 'w') do |pipe|
      # No matter what, we know we're going to write first.
      writing = true
      if script
        # We were given the script, so we write it and close.
        pipe.write script
        pipe.close_write
        writing = false
      end
      block.call(pipe) if block
      # close if we were writing
      pipe.close_write if writing
      # Read if reading
      read = pipe.read if read
    end
    read || $?.to_i==0
  end

  def self.method_missing(cmd, *args, **kw, &block)
    cmd=cmd[0..-2].to_sym unless read=(cmd[-1]!='?')
    return super unless SHELL_VERSION.has_key?(cmd) and args.length.between?(0,1)
    if minimum = SHELL_VERSION[cmd]
      minimum = Gem::Version.new minimum
      if version = `#{cmd} --version`.match(/\d+\.\d+\.\d+/)&.match(0)
        version  = Gem::Version.new version
        bumped = minimum.bump
        unless version >= minimum and version < bumped
          raise "Need #{cmd} version ~> #{minimum}"
        end
        # need to only check once
        SHELL_VERSION[cmd] = nil
      else
        raise "Could not get the #{cmd} version"
      end
    end
    command = [cmd.to_s]
    if kw.length > 0
      kw.each do |k,w|
        next if not w
        if w==true
          command << "#{k.length>1? '--':'-'}#{k}"
        else
          command << "--#{k}=#{w}"
        end
      end
    end
    script = args[0]
    return Rubbish.shell(script, shell:command, read:read,  &block)
  end
end
# Requires:
#`ruby`
#`bash`
#`fish`
