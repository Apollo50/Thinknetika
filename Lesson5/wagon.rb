class Wagon
  attr_reader :type, :number
  include Maker

  def initialize(type)
    @type = type
  end
end
