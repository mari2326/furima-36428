class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :scheduled_state, :shipping_charge, :prefecture, :scheduled_day
end
