class StoreController < ApplicationController
  include Metrics

  def index
    increment_counter!
    @show_counter = show_counter?
    @current_count = current_count
    @products = Product.order(:title)
  end
end
