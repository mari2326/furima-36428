class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :scheduled_state, :shipping_charge, :prefecture, :scheduled_day

  validates :name, :explanation, :price, :image, presence: true

  validates :category_id, :scheduled_state_id, :shipping_charge_id, :prefecture_id, :scheduled_day_id, numericality: { other_than: 1 , message: "can't be blank"}
end
