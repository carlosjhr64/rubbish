module Rubbish
  VERSION = '1.0.221207'
  SHELL_VERSION = {bash: nil, fish: nil}

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

  def self.method_missing(shell, *args, **kw, &block)
    shell=shell[0..-2].to_sym unless read=(shell[-1]!='?')
    if SHELL_VERSION.has_key?(shell) and args.length.between?(0,1)
      if minimum = SHELL_VERSION[shell]
        minimum = Gem::Version.new minimum
        if version = `#{shell} --version`.scan(/\d+\.\d+\.\d+/).first
          version  = Gem::Version.new version
          bumped = minimum.bump
          unless version >= minimum and version < bumped
            raise "Need #{shell} version ~> #{minimum}"
          end
          # need to only check once
          SHELL_VERSION[shell] = nil
        else
          raise "Could not get the #{shell} version"
        end
      end
      shell = shell.to_s
      if kw.length > 0
        shell << ' ' + kw.select{_2}.map{
          "--#{_1}=#{_2}".sub(/=(true)?$/,'').sub(/^--(\w)$/, '-\1')}.join(' ')
      end
      script = args[0]
      return Rubbish.shell(script, shell:shell, read:read,  &block)
    end
    super
  end
end
# Requires:
#`ruby`
#`bash`
#`fish`
