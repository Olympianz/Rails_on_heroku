require 'faker'

namespace :db do
    desc "create some fake data"
    
    task :fake_people => :environment do
        
        
       50.times do
           entry = Entry.create!    :first_name => Faker::Name.first_name,
                                    :last_name  => Faker::Name.last_name

           entry_addresses = Address.create!(
               :city    => Faker::Address.city,
               :state   => Faker::Address.state_abbr,
               :street  => Faker::Address.street_address,
               :zip     => Faker::Address.zip_code,
               :address_type_id => rand(1..3),
               :entry_id => entry.id
           )

           entry_emails = Email.create!(
               :name => Faker::Internet.email(name = nil),
               :type => "Email",
               :address_type_id => rand(1..3),
               :entry_id => entry.id
           )

           entry_webs = Web.create!(
               :name => Faker::Internet.url,
               :type => "Web",
               :address_type_id => rand(1..3),
               :entry_id => entry.id
           )

        end
    end
end

