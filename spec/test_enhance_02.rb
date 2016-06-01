require_relative 'spec_helper'

describe Unit do
  describe "#dead?" do
    before :each do
      @unit = Unit.new(30, 10)
    end

    it 'should return true when health_points reachs 0' do
      @unit.damage(30)
      expect(@unit.dead?).to be true
    end

    it 'should return true when health_points is lower than 0' do
      @unit.damage(31)
      expect(@unit.dead?).to be true
    end

    it 'should return false when health_points is higher than 0' do
      @unit.damage(10)
      expect(@unit.dead?).to be false
    end
  end

  describe "#attack!" do
    before do
      @unit = Unit.new(30, 10)
      @enemy = Unit.new(30, 10)
    end

    it 'should not attack others when unit is dead' do
      @unit.damage(31)
      expect {@unit.attack!(@enemy)}.to raise_error 'Dead unit can not attack or be attacked.'
    end

    it 'should not attact other dead units' do
      @enemy.damage(31)
      expect {@unit.attack!(@enemy)}.to raise_error 'Dead unit can not attack or be attacked.'
    end
  end
end
