require_relative 'car'

class App
  def self.call
    car = Car.new(color: 'red', model: 'ecosport', year: 2005, brand: 'ford')
    binding.irb
  end
end

App.call