class Record
  include Validation

  def initialize(**kargs)
    self.class.class_variable_get(:@@attributes).each do |attr|
      instance_variable_set("@#{attr}", kargs[attr])
      self.class.send(:attr_accessor, attr.to_s)
    end
  end
end