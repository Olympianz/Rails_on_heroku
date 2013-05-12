class Phone < Url
#    validates_format_of :name, :with => /[0-9]{3}-[0-9]{3}-[0-9]{4}/
#    phony_normalize :name, :default_country_code => 'US'
#    validates :name, :phony_plausible => true
    def self.prefix
        'Tel: '
    end 

    def to_phone
       return self.prefix + read_attribute(:name)
    end
end
