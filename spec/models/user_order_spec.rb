require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '注文者情報の保存' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    context '商品購入できるとき' do
      it '入力内容が正常であれば、購入できる' do
        expect(@user_order).to be_valid
      end
    end

    context '商品購入できないとき' do
      it '正しいクレジットカードが空では決済できないこと' do
        @user_order.token = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと購入できないこと' do
        @user_order.post_code = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が半角数字でないと保存できないこと' do
        @user_order.post_code = "あああ"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Post code Input half-width number and Include hyphen(-)")
      end
      it '郵便番号にはハイフンが必要であること' do
        @user_order.post_code = 1234567
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Post code Input half-width number and Include hyphen(-)")
      end
      it '都道府県を選択していないと保存できないこと' do
        @user_order.prefecture_id = 0
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture select")
      end
      it '市区町村が空だと保存できないこと' do
        @user_order.area_city = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Area city can't be blank")
      end
      it '市区町村が全角でないと保存できないこと' do
        @user_order.area_city = 12345
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Area city Input full-width characters")
      end
      it '番地が空だと保存できないこと' do
        @user_order.area2_address = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Area2 address can't be blank")
      end
      it '電話番号が空ではと保存できないこと' do
        @user_order.phone_number = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が半角数字でないと保存できないこと' do
        @user_order.phone_number = "あああ"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number Input only number")
      end
      it '電話番号にはハイフンは不要であること' do
        @user_order.phone_number = "090-1234-5678"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number Input only number")
      end
      it '電話番号は11桁であること' do
        @user_order.phone_number = "0901234567811"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number Input only 11 digits")
      end
    end
  end
end
