class Article < ApplicationRecord
  include Visible

  has_many :comments

  attribute :status, :string, default: 'public'

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
