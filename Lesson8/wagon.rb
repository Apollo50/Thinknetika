# frozen_string_literal: true

# Dispatch Service
# Wagon class
class Wagon
  attr_reader :type, :number
  include Maker

  def initialize(type, _capacity)
    @type = type
    validate!
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  protected

  def validate!
    raise 'Type has invalid format' if @type != 'pass' && @type != 'cargo'
  end
end
