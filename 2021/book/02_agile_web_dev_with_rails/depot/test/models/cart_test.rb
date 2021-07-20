require 'test_helper'

class CartTest < ActiveSupport::TestCase
  setup do
    @cart = carts(:sam_cart)
  end

  test "add distinct products using #add_product" do
    assert_equal 0, @cart.line_items.length

    @cart.add_product(products(:ruby)).save
    @cart.add_product(products(:crystal)).save
    @cart.line_items.reload

    assert_equal 2, @cart.line_items.count
    assert_equal 1, @cart.line_items.first.quantity
    assert_equal 1, @cart.line_items.last.quantity
  end

  test "add duplicate products using #add_product" do
    assert_equal 0, @cart.line_items.length

    @cart.add_product(products(:ruby)).save
    @cart.add_product(products(:ruby)).save
    @cart.add_product(products(:crystal)).save
    @cart.add_product(products(:crystal)).save
    @cart.line_items.reload

    assert_equal 2, @cart.line_items.count
    assert_equal 2, @cart.line_items.first.quantity
    assert_equal 2, @cart.line_items.last.quantity
  end

  test "adding products via #add_product records price within line item" do
    ruby_item    = @cart.add_product(products(:ruby))
    crystal_item = @cart.add_product(products(:crystal))

    assert_equal products(:ruby).price, ruby_item.product_price
    assert_equal products(:crystal).price, crystal_item.product_price
  end
end
