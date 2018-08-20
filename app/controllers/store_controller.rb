class StoreController < ApplicationController
  def index
    @products = Product.order(:title) #Pretty sure scaffold created a Product accessor for db?
  end
end
