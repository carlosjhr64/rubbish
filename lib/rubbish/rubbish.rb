module Rubbish

  def self.shell(sh, a=nil, b=nil, &block)
    script = [a,b].detect{|c|c.kind_of?(String)}
    read = [a,b].detect{|c|c==true||c==false}
    read = true if read.nil?
    IO.popen(sh, (read)? 'w+' : 'w') do |psh|
      # No matter what, we know we're going to write first.
      writing = true
      if script.class == String
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

end
