# frozen_string_literal: true

# CargoWagon class
class CargoWagon < Wagon
  def initialize(volume, type = 'cargo')
    super
    @number = (rand * 103).to_i
    @volume = volume
    @bought_volume = 0
  end

  def buy_volume(volume)
    if @volume >= volume
      @volume -= volume
      @bought_volume += volume
    end
  end

  def show_bought_place
    @bought_volume
  end

  def show_available_place
    @volume
  end
end
