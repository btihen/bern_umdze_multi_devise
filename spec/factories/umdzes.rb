FactoryBot.define do
  factory :umdze do
    sequence(:email)      { |n| "#{Faker::Internet.email}".split('@').join("#{n}@") }
    password              { 'LetM3-InNow!' }
    password_confirmation { 'LetM3-InNow!' }
    umdzes_name           { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
    # enable this if using confirmable
    # confirmed_at          { Date.today }
  end
end
