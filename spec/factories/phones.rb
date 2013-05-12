require 'faker'

FactoryGirl.define do
    factory :phone do |phone|
        phone.address_type_id {rand(AddressType.count)}
        phone.name {Faker::PhoneNumber.phone_number}
    end
end


