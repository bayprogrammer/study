class Product < ApplicationRecord

  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true, length: {
    minimum: 10,
    message: "You can't have a title that small dude!"
  }
  validates :image_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for a GIF, JPG, or PNG image.'
  }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

end
