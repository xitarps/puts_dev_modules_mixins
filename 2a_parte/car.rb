class Car
  @@dataset = []

  attr_accessor :id, :color, :model, :year, :brand

  def initialize(id: nil, color: nil, model: nil, year: nil, brand: nil)
    @color = color
    @model = model
    @year = year
    @brand = brand

    return self unless id.nil?

    @id = @@dataset.size + 1
    @@dataset << self
  end

  def self.search(term)
    result = @@dataset.map(&:as_json).select do |item|
      item.values.any? { |attr| attr.to_s.include?(term.to_s) }
    end

    result.map{ |item| self.new(**item) }
  end

  def as_json
    # hash = {}

    # instance_variables.each do |variable|
    #   hash[variable.to_s.gsub('@','')] = send(variable.to_s.gsub('@','').to_sym)
    # end

    # hash

    {}.tap{ |hash| instance_variables.each{ |var| hash[var.to_s.delete('@').to_sym] = send(var.to_s.gsub('@','').to_sym) } }
  end
end