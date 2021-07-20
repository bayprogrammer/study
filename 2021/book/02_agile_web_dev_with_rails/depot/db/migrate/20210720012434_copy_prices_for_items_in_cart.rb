class CopyPricesForItemsInCart < ActiveRecord::Migration[6.0]
  def up
    each_line_item do |line_item|
      line_item.product_price = line_item.product.price
    end
  end

  def down
    each_line_item do |line_item|
      line_item.product_price = nil
    end
  end

  private

  def each_line_item(&block)
    Cart.all.each do |cart|
      cart.line_items.each do |line_item|
        block.call(line_item)
        line_item.save
      end
    end
  end
end
