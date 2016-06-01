class Barracks
  attr_reader :gold, :food, :lumber, :health_points

  def initialize
    @gold = 1000
    @food = 80
    @lumber = 500
    @health_points = 500
  end

  def damage(hp)
    raise StandardError, 'Not a Fixnum' unless hp.is_a?(Fixnum)
    @health_points -= hp
  end

  def build_siege_engine
    return unless can_build_siege_engine?
    @gold -= 200
    @food -= 3
    @lumber -= 60
    SiegeEngine.new
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

  def can_build_siege_engine?
    food >= 3 && gold >= 200 && lumber >= 60
  end

  def can_train_footman?
    food >= 2 && gold >= 135
  end

  def can_train_peasant?
    food >= 5 && gold >= 90
  end
end
