FactoryBot.define do
  factory :patron do
    sequence(:email)      { |n| "#{Faker::Internet.email}".split('@').join("#{n}@") }
    # sequence(:username)   { |n| "student-#{Faker::Internet.username}-#{n}" }
    password              { 'LetM3-InNow' }
    password_confirmation { 'LetM3-InNow' }
  end
end
