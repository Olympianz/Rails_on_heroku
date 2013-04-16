class Address < ActiveRecord::Base
    belongs_to :entry
    belongs_to :address_type
    attr_accessible :address_type_id, :city, :state, :street, :zip, :entry_id

    def state=(val)
        write_attribute(:state, val.upcase)
    end

    def city=(val)
        write_attribute(:city, val.titleize)
    end
end
