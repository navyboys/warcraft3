require_relative 'spec_helper'

describe SiegeEngine do

  before :each do
    @siege_engine = SiegeEngine.new
  end

  it "has and knows its HP (health points)" do
    expect(@siege_engine.health_points).to eq(400)
  end

  it "has and knows its AP (attack power)" do
    expect(@siege_engine.attack_power).to eq(50)
  end

  describe '#attack!' do
    it 'does 2× damage against a Barracks' do
      enemy = Barracks.new
      @siege_engine.attack!(enemy)
      expect(enemy.health_points).to eq(480)
    end

    it 'can attack other SiegeEngines' do
      enemy = SiegeEngine.new
      @siege_engine.attack!(enemy)
      expect(enemy.health_points).to eq(380)
    end

    it 'can\'t attack Peasants' do
      enemy = Peasant.new
      expect { @siege_engine.attack!(enemy) }.to raise_error('SiegeEngine can not attack such units.')
    end

    it 'can\'t attack Footmans' do
      enemy = Footman.new
      expect { @siege_engine.attack!(enemy) }.to raise_error('SiegeEngine can not attack such units.')
    end
  end
end

describe Barracks do
  before :each do
    @barracks = Barracks.new
  end

  it "starts off with 500 lumber resources" do
    expect(@barracks.lumber).to eq(500)
  end

  describe "#build_siege_engine" do
    it "costs 200 gold" do
      @barracks.build_siege_engine
      expect(@barracks.gold).to eq(800) # starts at 1000
    end

    it "costs 60 lumber" do
      @barracks.build_siege_engine
      expect(@barracks.lumber).to eq(440) # starts at 500
    end

    it "costs 3 food" do
      @barracks.build_siege_engine
      expect(@barracks.food).to eq(77) # starts at 80
    end

    it "builds a seige engine unit" do
      siege_engine = @barracks.build_siege_engine
      expect(siege_engine).to be_an_instance_of(SiegeEngine)
    end
  end
end
