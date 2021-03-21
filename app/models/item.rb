class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :delivery_from_id
    validates :delivery_day_id
    validates :price
    validates :user, foreign_key: true
  end

  belongs_to :user
  has_one_attached :image

end
