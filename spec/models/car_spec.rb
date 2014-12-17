require 'rails_helper'

RSpec.describe Car, :type => :model do
  it { should have_valid(:make).when('Audi', 'Toyota', 'Ford') }
  it { should_not have_valid(:make).when(nil, '') }

  it { should have_valid(:model).when('A4', 'Camry', 'Focus') }
  it { should_not have_valid(:model).when(nil, '') }

  it { should have_valid(:year).when(1994, 2004, 2014) }
  it { should_not have_valid(:year).when(nil, '', 'fdfasda') }

  it { should have_valid(:color).when('Red', 'Green', 'Gray') }
  it { should_not have_valid(:color).when(nil, '') }

  it { should have_valid(:price).when(10000, 12000.94) }
  it { should_not have_valid(:price).when(nil, '', 'dfasfasgf') }

  context 'friendly title' do
    let(:car) { FactoryGirl.build(:car) }

    it 'contains the make' do
      expect(car.friendly_title).to include(car.make)
    end

    it 'contains the model' do
      expect(car.friendly_title).to include(car.model)
    end

    it 'contains the year' do
      expect(car.friendly_title).to include(car.year.to_s)
    end

    it 'contains the color' do
      expect(car.friendly_title).to include(car.color)
    end

    it 'contains the price' do
      expect(car.friendly_title).to include(car.price.to_s)
    end
  end
end
