class Entry < ActiveRecord::Base
  has_many :addresses
  attr_accessible :email, :first_name, :last_name
end
class Address < ActiveRecord::Base
    belongs_to :entry
    belongs_to :address_type
    attr_accessible :address_type_id, :city, :state, :street, :zip
end






