class Car
  @@dataset = []

  attr_accessor :id, :color, :model, :year, :brand

  extend Commom::Searchable
  include Commom::Jsonable

  def initialize(id: nil, color: nil, model: nil, year: nil, brand: nil)
    @color = color
    @model = model
    @year = year
    @brand = brand

    return self unless id.nil?

    @id = @@dataset.size + 1
    @@dataset << self
  end
end