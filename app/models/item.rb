class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :buy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :scheduled_state
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :scheduled_day

  validates :name, :explanation, :category_id, :scheduled_state_id, :shipping_charge_id, :prefecture_id, :scheduled_day_id,
            :image, presence: true

  with_options presence: true do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank" }
  end

  validates :category_id, :scheduled_state_id, :shipping_charge_id, :prefecture_id, :scheduled_day_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
