require 'faker'

FactoryGirl.define do
    factory :entry do |entry|
        entry.first_name {Faker::Name.first_name}
        entry.last_name {Faker::Name.last_name}
        entry.title {Faker::Name.title}
    end

    factory :invalid_entry, parent: :entry do |e|
        e.first_name ""
        e.last_name ""
    end
end
