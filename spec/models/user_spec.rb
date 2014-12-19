require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_valid(:first_name).when('John', 'Spencer', 'Dan')}
  it { should_not have_valid(:first_name).when('', nil) }

  it { should have_valid(:last_name).when('Smith', 'Samsonite') }
  it { should_not have_valid(:last_name).when('', nil) }

  context 'admin?' do
    it 'is not an admin if it is not the admin role' do
      # expect(FactoryGirl.build(:admin_user).admin?).to be true
      expect(FactoryGirl.build(:admin_user)).to be_admin
    end

    it 'is an admin if it is in the admin role' do
      expect(FactoryGirl.build(:user)).to_not be_admin
    end
  end
end
