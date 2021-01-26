class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :shipping_cost, :prefecture, :prefecture, :delivery_schedule
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 1000 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 9_999_999 }, format: { with: /\A[0-9]+\z/i }
  end

  validates :category_id, :status_id, :shipping_cost_id, :prefecture_id, :delivery_schedule_id, numericality: { other_than: 1 }
end
