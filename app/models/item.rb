class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :delivery_from_id
    validates :delivery_day_id
    validates :price, format: { with: /[3-9][0-9]{2}|[1-9][0-9]{3,6}/ }
  end

  belongs_to :user
  has_one_attached :image

end
