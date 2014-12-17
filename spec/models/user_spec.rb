require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_valid(:first_name).when('John', 'Spencer', 'Dan')}
  it { should_not have_valid(:first_name).when('', nil) }

  it { should have_valid(:last_name).when('Smith', 'Samsonite') }
  it { should_not have_valid(:last_name).when('', nil) }
end
