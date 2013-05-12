require 'spec_helper'

describe EntriesController do
    

    describe "Get 'Index'" do
#        it "entires should be sorted by their last_names" do
#            entry1 = FactoryGirl.create(:entry, last_name: "Chong")
#            entry2 = FactoryGirl.create(:entry, last_name: "Yue")
#            get :index
#            assigns(:entries).should eq([entry1,entry2].sort{|a,b| a.last_name <=> b.last_name})
#        end

        it "render index page" do
            get :index
            response.should render_template :index
        end
    end

    describe "Get 'Show'" do
        it "id of entry for show should equal current id" do
            entry = FactoryGirl.create(:entry)
            get :show, id: entry
            assigns(:entry).should eq(entry) 
        end

        it "renders the 'show' page" do
            get :show, id: FactoryGirl.create(:entry)
            response.should render_template :show
        end
    end

    describe "Get 'new'" do
        it "creates a new entry" do
            get :new
            assigns(:entry).should be_instance_of(Entry)
        end
    end

    describe "Get 'edit'" do
        it "id of entry to be edited should equal current id" do
            entry = FactoryGirl.create(:entry)
            get :edit, id: entry
            assigns(:entry).should eq(entry)
        end

        it "renders the 'edit' page" do
            get :edit, id: FactoryGirl.create(:entry)
            response.should render_template :edit
        end
    end

    describe "Destroy" do
        before :each do
           @entry = FactoryGirl.create(:entry)
        end

        it "should destroy an entry from database" do
            expect{delete :destroy, id:@entry}.to change(Entry, :count).by(-1)
        end

        it "redirects to entries page" do
            delete :destroy, id:@entry
            response.should redirect_to entries_url
        end
    end

    describe "Update" do
        before :each do
            @entry = FactoryGirl.create(:entry, first_name:"Chong", last_name:"Yue")
        end
        context "Use 'Edit' page" do
            it "finds the right entry" do
                put :update, id:@entry
                assigns(:entry).should eq(@entry)
            end
        end
        context "valid entries" do
            it "finds an entry id" do
                put :update, id:@entry, entry: FactoryGirl.attributes_for(:entry)
                assigns(:entry).should eq(@entry)
            end
            it "should update the attributes" do
                put :update, id:@entry, entry: FactoryGirl.attributes_for(:entry, first_name:"Chong007", last_name:"Yue007")
                @entry.reload
                @entry.first_name.should == "Chong007"
                @entry.last_name.should == "Yue007"
            end

            it "redirects to updated entry" do
                put :update, id:@entry, entry: FactoryGirl.attributes_for(:entry)
                response.should redirect_to @entry
            end
        end

        context "invalid entries" do
            it "finds the right entry" do
                put :update, id:@entry, entry: FactoryGirl.attributes_for(:invalid_entry)
                assigns(:entry).should eq(@entry)
            end
            it "should not update the attributes" do
                put :update, id:@entry, entry: FactoryGirl.attributes_for(:invalid_entry)
                @entry.reload
                @entry.first_name.should == "Chong"
                @entry.last_name.should == "Yue"
            end
            it "redirects to the same entry" do
                put :update, id:@entry, entry: FactoryGirl.attributes_for(:invalid_entry)
                response.should render_template :edit
            end

        end
    end

    describe "Create" do
        context "valide inputs" do
            it "creates a new entry" do
                expect{
                    post :create, entry: FactoryGirl.attributes_for(:entry)
                }.to change(Entry, :count).by(1)
            end
            it "uses the 'new' page" do
                post :create, entry: FactoryGirl.attributes_for(:entry)
                response.should redirect_to Entry.last
            end
        end

        context "invalid inputs" do
            it "creates no entry" do
                expect{post :create, entry: FactoryGirl.attributes_for(:invalid_entry)}.to_not change(Entry, :count)
            end
            it "stay on the 'new' page" do
                post :create, entry: FactoryGirl.attributes_for(:invalid_entry)
                response.should render_template :new
            end
        end
    end
end

