class StoreController < ApplicationController
  include Metrics
  include CurrentCart
  before_action :set_cart

  def index
    increment_counter!
    @show_counter = show_counter?
    @current_count = current_count
    @products = Product.order(:title)
  end
end
