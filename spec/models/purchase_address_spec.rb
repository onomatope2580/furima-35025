require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入機能' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it '全ての項目が存在し、かつ入力条件を満たしているとき登録できること' do
      expect(@purchase_address).to be_valid
    end

    it 'postal_codeが空では登録できないこと' do
      @purchase_address.postal_code = " "
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeにハイフンがないと登録できないこと' do
      @purchase_address.postal_code = 1234567
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
    end

    it 'postal_codeが全角なら登録できないこと' do
      @purchase_address.postal_code = "１２３ー４５６７"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
    end

    it 'postal_codeが半角英字なら登録できないこと' do
      @purchase_address.postal_code = "abc-defg"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
    end

    it 'delivery_fee_idが"1"だと登録できないこと' do
      @purchase_address.delivery_from_id = 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Delivery from must be other than 1')
    end

    it 'cityが空では登録できないこと' do
      @purchase_address.city = " "
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end

    it 'streetが空では登録できないこと' do
      @purchase_address.street = " "
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Street can't be blank")
    end

    it 'buildingが空でも登録できること' do
      @purchase_address.building = " "
      expect(@purchase_address).to be_valid
    end

    it 'telが空では登録できないこと' do
      @purchase_address.tel = " "
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Tel can't be blank")
    end

    it 'telが全角なら登録できないこと' do
      @purchase_address.tel = "０９０１２３４５６７８"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Tel is invalid")
    end

    it 'telが半角英字なら登録できないこと' do
      @purchase_address.tel = "abcdefghijk"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Tel is invalid")
    end

    it 'telにハイフンがあったら登録できないこと' do
      @purchase_address.tel = "090-1234-5678"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Tel is invalid")
    end

    it 'telが12字以上なら登録できないこと' do
      @purchase_address.tel = "090123456789"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Tel is invalid")
    end

    it 'tokenが空では登録できないこと' do
      @purchase_address.token = " "
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idが紐付いていないと登録できないこと' do
      @purchase_address.user_id = " "
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが紐付いていないと登録できないこと' do
      @purchase_address.item_id = " "
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
    end

  end
end
