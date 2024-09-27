module Commom
  module Present
    def run
      puts "Hi I'm #{self.instance_variable_get(:@name)}"
    end
  end
end
