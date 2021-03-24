class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :delivery_from_id, :city, :street, :building, :tel, :purchase_id

  with_options presence: true do
    validates :user_id
    validates :item_id

    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :delivery_from_id, numericality: { other_than: 1 }
    validates :city
    validates :street
    validates :tel, format: {with: /[0-9]{ ,11}/}
    validates :purchase_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, delivery_from_id: delivery_from_id, city: city, street: street, tel: tel, purchase_id: purchase.id)
  end
end