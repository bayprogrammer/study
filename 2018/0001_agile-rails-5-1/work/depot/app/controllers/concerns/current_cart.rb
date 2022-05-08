module CurrentCart

  private

  def set_cart
    @cart = Cart.find(session[:card_id])
  rescue
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

end