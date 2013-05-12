require 'spec_helper'

describe Entry do
    it "has a valid full_name func" do
        entry = FactoryGirl.create(:entry)
        entry.full_name.should be == entry.first_name + ' ' + entry.last_name
    end

    it "has a valid to_phone func" do
        entry = FactoryGirl.create(:entry)
        phone = FactoryGirl.create(:phone, entry: entry)
        phone.to_phone.should be == (phone.prefix + phone.name)
    end

    it "has a valid prefix" do
        entry = FactoryGirl.create(:entry)
        phone = FactoryGirl.create(:phone, entry: entry)
        phone.prefix.should be == 'Tel: '
    end
end
