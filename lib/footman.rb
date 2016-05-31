# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit

  def initialize
    super(60, 10)
  end

  def attack!(target)
    target.damage(10)
  end

  def damage(hp)
    @health_points -= hp
  end
end
