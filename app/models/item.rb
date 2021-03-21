class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :description
    validates :price, format: { with: /[3-9][0-9]{2}|[1-9][0-9]{3,6}/ }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :delivery_from_id
    validates :delivery_day_id
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :delivery_from
  belongs_to :delivery_day

end
