class ListingsController < ApplicationController
    before_action :find_listing, only: [:show, :edit, :update, :destroy]
    
    def index
      @listings = Listing.all.order("created_at DESC")
    end
    
    def show
    end
    
    def new
      @listing = Listing.new
    end
    
    def create
      @listing = Listing.new(listing_params)
      if @listing.save
        redirect_to listings_path
      else
        render 'new'
      end
    end
    
    def edit
      @listing = Listing.edit
    end
    
    def update
      if @listing.update(listing_params)
        redirect_to listing_path(@listing)
      else
        render 'edit'
      end
    end
    
    def destroy
    end
    
    private
    
    def listing_params
      params.require(:listing).permit(:title, :description, :price)
    end
    
    def find_listing
      @listing = Listing.find(params[:id])
    end
    
end
