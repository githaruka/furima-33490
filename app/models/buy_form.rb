class BuyForm
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ } 
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number)
  end
end