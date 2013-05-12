require 'faker'

r = Random

FactoryGirl.define do
    factory :web do |url|
        url.address_type_id {r.rand(1..4)}
        url.name {Faker::Internet.url}
    end
end
