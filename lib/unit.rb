class Unit
  attr_reader :health_points, :attack_power

  def initialize(hp, ap)
    @health_points = hp
    @attack_power = ap
  end

  def damage(hp)
    raise StandardError, 'Not a Fixnum' unless hp.is_a?(Fixnum)
    @health_points -= hp
  end

  def attack!(target)
    if self.dead? || target.dead?
      raise StandardError, 'Dead unit can not attack or be attacked.'
    end
    target.damage(3)
  end

  def dead?
    @health_points <= 0
  end
end
