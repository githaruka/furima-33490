class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :shipping_cost, :prefecture, :prefecture, :delivery_schedule

  validates :image, :name, :info, :price, presence: true

  validates :category_id, :status_id, :shipping_cost_id, :prefecture_id, :delivery_schedule_id, numericality: { other_than: 1 } 
end
