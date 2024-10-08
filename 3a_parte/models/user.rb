class User < Record
  @@attributes = %i[name age]

  validates :name, presence: true, min_length: 3, max_length: 5
  validates :age, presence: true, number: true

  def say_hi
    puts "hi, my name is #{name}"
  end

  # private

  # def max_length(value, field)
  #   @errors << "#{field} is too long" if (self.send(field).to_s.size > value)
  # end
end
