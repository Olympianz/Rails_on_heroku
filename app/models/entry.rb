class Entry < ActiveRecord::Base
  has_many :addresses, dependent: :destroy

  attr_accessible :email, :first_name, :last_name
  :addresses_attributes
  # attr_nested_attributes_for :addresses, allow_destroy:true, reject_if :all_black
  # validates_presence_of [:email, :first, :last_name]
  # validate_email_format_of :email  
end
class Address < ActiveRecord::Base
    belongs_to :entry
    belongs_to :address_type
    attr_accessible :address_type_id, :city, :state, :street, :zip
end






