class CargoWagon < Wagon
  def initialize(type = "cargo", volume)
    super
    @number = (rand() * 103).to_i
    @volume = volume
    @bought_volume = 0
  end

  def buy_volume(volume)
    if @volume >= volume
      @volume -= volume
      @bought_volume += volume
    else
      raise "Try again!"
    end
  end

  def show_bought_place
    @bought_volume
  end

  def show_available_place
    @volume
  end
end
