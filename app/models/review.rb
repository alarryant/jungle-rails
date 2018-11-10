class Review < ActiveRecord::Base

  belongs_to :product
  belongs_to :user

  validates :description, presence: true
  validates :rating, presence: true
  validates :user_id, presence: true
  validates :product_id, presence: true
end
