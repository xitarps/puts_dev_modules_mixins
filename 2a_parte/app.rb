require_relative 'car'

class App
  def self.call
    car = Car.new(color: 'red', model: 'ecosport', year: 2005, brand: 'ford')
    car = Car.new(color: 'blue', model: 'ka', year: 2005, brand: 'ford')
    car = Car.new(color: 'red', model: 'viper', year: 2000, brand: 'dodge')

    binding.irb
  end
end

App.call