require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての項目が存在し、かつ入力条件を満たしているとき登録できること' do
      expect(@item).to be_valid
    end

    it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では登録できないこと' do
      @item.name = " "
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では登録できないこと' do
      @item.description = " "
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_idが"1"だと登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it 'status_idが"1"だと登録できないこと' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it 'delivery_fee_idが"1"だと登録できないこと' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
    end

    it 'delivery_from_idが"1"だと登録できないこと' do
      @item.delivery_from_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery from must be other than 1")
    end

    it 'delivery_day_idが"1"だと登録できないこと' do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
    end

    it 'peiceが空では登録できないこと' do
      @item.price = " "
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it 'peiceが全角では登録できないこと' do
      @item.price = "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it 'peiceが299以下では登録できないこと' do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it 'peiceが10000000以上では登録できないこと' do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it 'userが紐づいていなければ登録できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end

  end

end
