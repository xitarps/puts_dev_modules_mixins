autoload :User, './models/user.rb'
autoload :Record, './models/record.rb'
autoload :Validation, './models/validation.rb'

class App
  def call
    run
  end

  def self.call
    new.call
  end

  private

  def run
    # user = User.new(name: 'x', age: 1)
    # user.valid?

    binding.irb
    puts 'running'
  end
end

App.call
