require 'spec_helper'

describe Email do
    it "has a valid email" do
        entry = FactoryGirl.create(:entry)
        FactoryGirl.create(:email, entry: entry).should be_valid
    end

    it "has a valid to_phone func" do
        entry = FactoryGirl.create(:entry)
        email = FactoryGirl.create(:email, entry: entry)
        email.to_email.should be == (email.prefix + email.name)
    end

    it "has a valid prefix" do
        entry = FactoryGirl.create(:entry)
        email = FactoryGirl.create(:email, entry: entry)
        email.prefix.should be == 'mailto:'
    end
end
