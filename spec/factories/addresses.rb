require 'faker'

FactoryGirl.define do
    factory :address do |addr|
        addr.address_type_id {rand(AddressType.count)}
        addr.street {Faker::Address.street_name}
        addr.city {Faker::Address.city}
        addr.state {Faker::Address.state_abbr}
        addr.zip {Faker::Address.zip_code}
    end
end
