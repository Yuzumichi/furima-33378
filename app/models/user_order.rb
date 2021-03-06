class UserOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :prefecture_id, :post_code, :area_city, :area2_address, :area3_building, :phone_number, :token

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 0, message: 'select' }
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input half-width number and Include hyphen(-)' }
    validates :area_city, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'Input full-width characters' }
    validates :area2_address
    validates :phone_number, numericality: { only_integer: true, message: 'Input only number' }
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Input only 10 or 11 digits' }

  def save
    # 購入者の情報を保存
    buyer = Buyer.create(item_id: item_id, user_id: user_id)
    # 購入地域の情報を保存
    Address.create(prefecture_id: prefecture_id, post_code: post_code, area_city: area_city, area2_address: area2_address,
                   area3_building: area3_building, phone_number: phone_number, buyer_id: buyer.id)
  end
end
