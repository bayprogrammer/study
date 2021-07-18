class Comment < ApplicationRecord
  include Visible

  belongs_to :article

  attribute :status, :string, default: 'public'
end
