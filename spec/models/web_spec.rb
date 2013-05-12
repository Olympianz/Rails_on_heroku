require 'spec_helper'

describe Web do
    it "has a valid web address" do
        entry = FactoryGirl.create(:entry)
        FactoryGirl.create(:web, entry: entry).should be_valid
    end

    it "has a valid to_url func" do
        entry = FactoryGirl.create(:entry)
        web = FactoryGirl.create(:web, entry: entry)
        web.to_url.should be == (web.prefix + web.name)
    end

    it "has a valid prefix" do
        entry = FactoryGirl.create(:entry)
        web = FactoryGirl.create(:web, entry: entry)
        web.prefix.should be == 'http://'
    end
end
