#Delegation forward responsibility to another object. use both method missing and forwardable

class Parser
   def  phone_number
     p "formats phone number"
   end
end

class User
  def initialize parser
    @parser = parser
  end

  def method_missing method, *args
    if method.to_s.match(/format_(.+)/)
      @parser.send($1, *args)       #$1 is the group matched in the regex
    end

  end
end


u = User.new(Parser.new)
u.format_phone_number



# using forwardable

require 'forwardable'

class Userf
  extend Forwardable

  def_delegators :@parser , :phone_number
  def_delegator   :@parser, :phone_number, :format_phone_number      ## using prependor format

  def initialize parser
    @parser = parser
  end

end

u = Userf.new(Parser.new)
u.phone_number
u.format_phone_number