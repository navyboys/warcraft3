# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit

  def initialize(hp = 60, ap = 10)
    super(hp, ap)
  end

  def attack!(target)
    if target.is_a? Barracks
      target.damage(5)
    else
      target.damage(10)
    end
  end
end
