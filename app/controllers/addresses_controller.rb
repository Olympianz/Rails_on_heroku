class AddressesController < ApplicationController
  # GET /addresses
  # GET /addresses.json

 before_filter {@entry = Entry.find(params[:entry_id])}

 respond_to :html #, :json
  
  
  def index
	@addresses = @entry.addresses.all
	respond_with(@addresses)
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
    respond_with(@address = @entry.addresses.find(params[:id]))
  end

  # GET /addresses/new
  # GET /addresses/new.json
  def new
	respond_with(@address = @entry.addresses.build)
  end

  # GET /addresses/1/edit
  def edit
    @address = @entry.addresses.find(params[:id])
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = @entry.addresses.build(params[:address])
    flash[:notice] = "Address created" if @address.save
    respond_with(@address) do |format|
    	format.html { redirect_to entry_address_url(@entry, @address) }
    end
  end

  # PUT /addresses/1
  # PUT /addresses/1.json
  def update
    @address = @entry.addresses.find(params[:id])
   if @address.update_attributes(params[:address])
	flash[:notice] = "Address was updated"
	respond_with(@address)	do |format|
	format.html { redirect_to entry_address_url(@entry, @address) }
        end
   end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address = @entry.addresses.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to entry_addresses_url(@entry) }
      format.json { head :no_content }
    end
  end
end
