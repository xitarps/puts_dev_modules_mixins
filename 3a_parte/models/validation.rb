module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
    # base.send(:extend, ClassMethods)
  end

  module InstanceMethods
    def valid?
      @errors = []
      return true unless self.class.class_variables.include?(:@@validations)

      self.class.class_variable_get(:@@validations).each do |validation|
        send(*validation[:type].to_a.flatten, validation[:field])
      end

      @errors.empty?
    end

    def errors
      @errors
    end

    private

    def presence(value, field)
      return unless value

      attr = self.send(field)
      return @errors << "#{field} can't be nil" if attr.nil?

      @errors << "#{field} can't be blank" if attr&.is_a?(String) && attr.empty?
    end

    def min_length(value, field)
      attr = self.send(field)
      return if attr.nil?

      @errors << "#{field} length is too small" if attr&.size < value
    end

    def number(value, field)
      attr = self.send(field)
      return if attr.nil?

      @errors << "#{field} should be a number" if (!attr&.is_a?(Numeric) && value)
    end

    def max_length(value, field)
      @errors << "#{field} is too long" if (self.send(field).to_s.size > value)
    end
  end

  module ClassMethods
    def validates(field, **opts)
      if class_variable_defined?('@@validations')
        validations = class_variable_get('@@validations')
      else
        validations = []
      end

      opts.each do |opt|
        validation = { field: field, type: { opt.first => opt.last}}
        validations << validation
      end

      class_variable_set('@@validations', validations)
    end
  end
end