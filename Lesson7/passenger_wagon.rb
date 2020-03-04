class PassengerWagon < Wagon
  def initialize(type = "pass", capacity)
    super
    @number = (rand() * 102).to_i
    @capacity = capacity
    @bought_tickets = 0
  end

  def buy_ticket
    if @capacity !=0
    @capacity -= 1
    @bought_tickets += 1
    end
  end

  def show_bought_place
    @bought_tickets
  end

  def show_available_place
    @capacity
  end
end
