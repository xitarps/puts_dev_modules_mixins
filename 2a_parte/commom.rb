module Commom
  module Searchable
    def search(term)
      result = self.class_variable_get(:@@dataset).map(&:as_json).select do |item|
        item.values.any? { |attr| attr.to_s.include?(term.to_s) }
      end

      result.map{ |item| self.new(**item) }
    end
  end

  module Jsonable
    def as_json
      {}.tap{ |hash| instance_variables.each{ |var| hash[var.to_s.delete('@').to_sym] = send(var.to_s.gsub('@','').to_sym) } }
    end
  end
end