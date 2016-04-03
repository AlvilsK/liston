class ListingsController < ApplicationController
    before_action :find_listing, only: [:show, :edit, :update, :destroy]
    
    def index
      @listings = Listing.all.order("created_at DESC")
    end
    
    def show
    end
    
    def new
      @listing = current_user.listings.build
    end
    
    def create
      @listing = current_user.listings.build(listing_params)
      if @listing.save
        redirect_to listings_path
      else
        render 'new'
      end
    end
    
    def edit
    end
    
    def update
      if @listing.update(listing_params)
        redirect_to listing_path(@listing)
      else
        render 'edit'
      end
    end
    
    def destroy
      @listing.destroy
      redirect_to root_path
    end
    
    private
    
    def listing_params
      params.require(:listing).permit(:title, :description, :price)
    end
    
    def find_listing
      @listing = Listing.find(params[:id])
    end
    
end
