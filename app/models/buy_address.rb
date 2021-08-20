class BuyAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :street_number, :building_name, :telephone_number, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality, :street_numbe, :user_id, :item_id
    validates :telephone_number, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid"}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, street_number: street_number, building_name: building_name, telephone_number: telephone_number, buy_id: buy.id)
  end