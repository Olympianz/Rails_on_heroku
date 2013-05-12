require 'faker'

FactoryGirl.define do
    factory :email do |email|
        email.address_type_id {rand(AddressType.count)}
        email.name {Faker::Internet.email}
    end
end
