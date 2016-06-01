require_relative 'spec_helper'

describe Barracks do
  it "has and knows its HP (health points)" do
    barracks = Barracks.new
    expect(barracks.health_points).to eq(500)
  end
end

describe Footman do
  describe "#attack!" do
    it "should do deal 5 (AP) damage to Barracks" do
      footman = Footman.new
      barracks = Barracks.new
      footman.attack!(barracks)
      expect(barracks.health_points).to eq(495)
    end
  end
end

describe Unit do
  describe "#damage" do
    before { @unit = Unit.new(30, 10) }

    it 'should use Fixnum for damage amount' do
      expect {@unit.damage(10)}.not_to raise_error
    end

    it 'should raise an error if Float is passed' do
      expect {@unit.damage(10.3)}.to raise_error 'Not a Fixnum'
    end

    it 'should raise an error if Array is passed' do
      expect {@unit.damage([1,2,3,4])}.to raise_error 'Not a Fixnum'
    end

    it 'should raise an error if String is passed' do
      expect {@unit.damage('error')}.to raise_error 'Not a Fixnum'
    end
  end

end
