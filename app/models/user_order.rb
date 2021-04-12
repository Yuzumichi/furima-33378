class UserOrder
  include ActiveModel::Model
  attr_accessor :user, :item, :prefecture_id, :post_code, :area_city, :area2_address, :area3_building, :phone_number, :buyer

  with_options presence: true do
    validates :user
    validates :item
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :area_city
    validates :area2_address
    validates :phone_number, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
    validates :buyer
  end

  def save
    # ユーザーの情報を保存し、「user」という変数に入れている
    user = User.create(nickname: nickname, email: email, birthday: birthday, first_name: first_name, last_name: last_name, first_name_kana: first_name_kana, last_name_kana: last_name_kana, password: password)
    # 商品を保存し、「item」という変数に入れている
    item = Item.create(name: name, explanation: explanation, image: image, status_id: status_id, category_id: category_id, delivery_charge_id: delivery_charge_id, delivery_area_id: delivery_area_id, delivery_day_id: delivery_day_id, price: price)
    # 購入者の情報を保存
    buyer = Buyer.create(item_id: item.id, user_id: user.id)
    # 購入地域の情報を保存
    Address.create(prefecture_id: prefecture_id, post_code: post_code, area_city: area_city, area2_address: area2_address, : area3_building: area3_building, phone_number: phone_number, buyer_id: buyer.id)
  end
end