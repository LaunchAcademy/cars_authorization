FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name 'Smith'
    sequence(:email){|n| "user#{n}@example.com"}

    password 'password'
    password_confirmation 'password'
  end

  factory :admin_user, parent: :user do
    role 'admin'
  end

  factory :car do
    make 'Audi'
    model 'A6'
    price 35000
    color 'Green'
    year 2014
  end
end
