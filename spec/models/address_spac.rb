require 'spec_helper'

describe Address do
    it "has a valid address" do
        entry = FactoryGirl.create(:entry)
        FactoryGirl.create(:address, entry: entry).should be_valid
    end
    
    it "fails for no address_type" do
        entry = FactoryGirl.create(:entry)
        FactoryGirl.build(:address, entry: entry, :address_type_id => nil).should_not be_valid
    end

    it "fails for state size not 2" do
        entry = FactoryGirl.create(:entry)
        FactoryGirl.build(:address, entry: entry, :state => "NNN").should_not be_valid
        FactoryGirl.build(:address, entry: entry, :state => "N").should_not be valid
    end

    it "fails for no zip or wrong zip" do
        entry = FactoryGirl.create(:entry)
        FactoryGirl.build(:address, entry: entry, :zip => "alphabetic").should_not be_valid
        FactoryGirl.build(:address, entry: entry, :zip => nil).should_not be_valid
    end
end
