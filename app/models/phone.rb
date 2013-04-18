class Phone < Url
    def self.prefix
        'Tel: '
    end 

    def to_phone
       return self.prefix + read_attribute(:name)
    end
end
