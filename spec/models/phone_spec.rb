require 'spec_helper'

describe Phone do
    it "has a valid phone #" do
        entry = FactoryGirl.create(:entry)
        FactoryGirl.create(:phone, entry: entry).should be_valid
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
