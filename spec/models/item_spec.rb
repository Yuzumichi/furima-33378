require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context '商品出品できるとき' do
      it "入力内容が正常であれば、出品できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it "商品名が空欄だと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品画像が空欄だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品説明が空欄だと出品できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "商品カテゴリーが空欄だと出品できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it "商品カテゴリーが1では出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it "商品状態が空欄だと出品できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end

      it "商品状態が1だと出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end

      it "配送料の負担が空欄だと出品できない" do
        @item.delivery_charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge Select")
      end

      it "配送料の負担が空欄だと出品できない" do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge Select")
      end

      it "配送元の地域が空欄だと出品できない" do
        @item.delivery_area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area Select")
      end

      it "配送元の地域が1だと出品できない" do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area Select")
      end

      it "配送までの日数が空欄だと出品できない" do
        @item.delivery_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day Select")
      end
      
      it "配送までの日数が1だと出品できない" do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day Select")
      end

      it "商品価格が空欄だと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "商品価格が全角文字だと出品できない" do
        @item.price = "ああああああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end

      it "商品価格が半角英数混合だと出品できない" do
        @item.price = "aaa11111"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end

      it "商品価格が半角英語だけだと出品できない" do
        @item.price = "aaaaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end

      it "商品価格が300円以上でなければ出品できない" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it "商品価格が9,999,999円以下でなければ出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end
