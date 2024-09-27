class Car
  attr_accessor :color, :model, :year, :brand

  def initialize(color: nil, model: nil, year: nil, brand: nil)
    @color = color
    @model = model
    @year = year
    @brand = brand
  end
end