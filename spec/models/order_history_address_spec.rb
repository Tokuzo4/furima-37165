require 'rails_helper'

RSpec.describe OrderHistoryAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_history_address = FactoryBot.build(:order_history_address, user_id: user.id, item_id: item.id)
      sleep 0.5
    end
    context '成功する場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_history_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_history_address.building_name = ''
        expect(@order_history_address).to be_valid
      end
    end

    context '失敗する場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_history_address.postal_code = ''
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_history_address.postal_code = '1234567'
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include('Postal code Postal code は半角文字で記述する必要があります')
      end
      it 'prefecture_idが0では保存できないこと' do
        @order_history_address.prefecture_id = 0
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_history_address.city = ''
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("City can't be blank")
      end
      it 'chome_addressが空だと保存できないこと' do
        @order_history_address.chome_address = ''
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("Chome address can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @order_history_address.telephone_number = ''
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberは9桁以下だと保存できないこと' do
        @order_history_address.telephone_number = '090111111'
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include('Telephone number は半角数値で記述する必要があります')
      end
      it 'telephone_numberは12桁以上だと保存できないこと' do
        @order_history_address.telephone_number = '090123456789'
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include('Telephone number は半角数値で記述する必要があります')
      end
      it 'telephone_numberは半角数字以外が含まれている場合保存できないこと' do
        @order_history_address.telephone_number = 'あ嗚a１@'
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include('Telephone number は半角数値で記述する必要があります')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_history_address.user_id = nil
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_history_address.item_id = nil
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order_history_address.token = nil
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
