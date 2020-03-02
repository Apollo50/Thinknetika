class Wagon
  attr_reader :type, :number
  include Maker

  def initialize(type)
    @type = type
    validate!
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  protected

  def validate!
    raise "Type has invalid format" if @type != "pass"  &&  @type != "cargo"
  end

end
