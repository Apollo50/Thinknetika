# frozen_string_literal: true

# Accessors module
module Accessors
  def attr_accessor_with_history(*names)
    value_history = '@value_history'
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }

      define_method("#{name}=".to_sym) do |value|
        unless instance_variable_defined?(value_history)
          instance_variable_set(value_history, {})
      end
        value_hist = instance_variable_get(value_history)
        value_hist[name] ||= []
        value_hist[name] << value
        instance_variable_set var_name, value
      end

      define_method("#{name}_history") do
        value = instance_variable_get(value_history)
        return [] if value.nil? || value[name].nil?

        value[name]
      end
    end
  end

  def strong_attr_accessor(name, type)
    var_name = name.to_s.to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      if value.class == type
        instance_variable_set(var_name, value)
      else
        raise 'Enter attribute with correct type.'
      end
    end
  end
end

class Test
  extend Accessors
  attr_accessor_with_history :my_attr, :a, :b
  strong_attr_accessor :a, Integer
end
