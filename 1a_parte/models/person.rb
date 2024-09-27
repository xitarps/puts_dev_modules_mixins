require_relative '../commom/greeting'
require_relative '../commom/present'

module Models
  class Person
    extend Commom::Greeting #classe
    include Commom::Present #instancia

    def initialize(name = 'unknown')
      @name = name
    end
  end
end

person = Models::Person.new

binding.irb

puts 'batata'
