class Barracks
  attr_accessor :gold, :food

  def initialize
    @gold = 1000
    @food = 80
  end

  def train_footman
    return unless can_train_footman?
    @gold -= 135
    @food -= 2
    Footman.new
  end

  def train_peasant
    return unless can_train_peasant?
    @gold -= 90
    @food -= 5
    Peasant.new
  end

  def can_train_footman?
    if food < 2 || gold < 135
      false
    else
      true
    end
  end

  def can_train_peasant?
    if food < 5 || gold < 90
      false
    else
      true
    end
  end
end
