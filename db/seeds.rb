require 'faker'

AddressType.delete_all
AddressType.create(:name => 'Home')
AddressType.create(:name => 'Work')
AddressType.create(:name => 'Other')
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

def street
    s = Faker::Address.street_address
    return s if rand(2)
    s += "\n" + Faker::Address.secondary_address
end

def random_type
    AddressType.offset(rand(AddressType.count)).first.id
end

Entry.delete_all
500.times do
    entry = Entry.new(
        first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
        title: Faker::Name.title
    )

    rand(2)+1.times do |i|
        entry.addresses.build(
            address_type_id: random_type,
            street: street,
            city:   Faker::Address.city,
            state:  Faker::Address.state_abbr,
            zip:    Faker::Address.zip_code
        )
    end

    rand(2)+1.times do |i|
        entry.emails.build(
            address_type_id: random_type,
            name: Faker::Internet.email
        )
    end

    rand(2)+1.times do |i|
        entry.webs.build(
            address_type_id: random_type,
            name: Faker::Internet.url
        )
    end

    rand(2)+1.times do |i|
        entry.phones.build(
            address_type_id: random_type,
            name: Faker::PhoneNumber.phone_number
        )
    end

    entry.save!
end



