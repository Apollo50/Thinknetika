# frozen_string_literal: true

# Dispatch Service
# Wagon class
class Wagon
  attr_reader :type, :number
  include Maker
  include Validation

  validate :type, :presence

  def initialize(type, _capacity)
    @type = type
    validate!
  end
end
