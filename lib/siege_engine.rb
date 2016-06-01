class SiegeEngine < Unit
  def initialize(hp = 400, ap = 50)
    super(hp, ap)
  end

  def attack!(target)
    if target.is_a?(Barracks) || target.is_a?(SiegeEngine)
      target.damage(20)
    else
      raise StandardError, 'SiegeEngine can not attack such units.'
    end
  end

end
