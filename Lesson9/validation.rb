# frozen_string_literal: true

# Validation module
module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :validations
    def validate(name, type, arg = nil)
      self.validations ||= []
      validations << { name: name, type: type, arg: arg }
    end
  end

  module InstanceMethods
    def validate?
      validate!
      true
    rescue StandardError
      false
    end

    protected

    def validate!
      self.class.validations.each do |arg|
        send("validate_#{arg[:type]}", instance_variable_get("@#{arg[:name]}".to_sym), arg[:arg])
      end
    end

    def validate_presence(name, _arg)
      raise 'Variable name is an empty string!' if ['', nil].include?(name)
    end

    def validate_format(name, arg)
      raise 'Variable name has got invalid format!' unless name =~ arg
    end

    def validate_type(name, arg)
      raise 'Variable name has got invalid type!' unless name.class == arg
    end
  end
end
