class ListingsController < ApplicationController
    
    def index
      @listings = Listing.all.order("created_at DESC")
    end
    
    def new
      @listing = Listing.new
    end
    
    def create
      @listing = Listing.new(listing_params)
      if @listing.save
        redirect_to root_path
      else
        render 'new'
      end
    end
    
    private
    
    def listing_params
      params.require(:listing).permit(:title, :description, :price)
    end
    
end
