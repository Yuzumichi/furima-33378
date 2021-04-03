class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_day
  end

  with_potions presence: true do
    validates :name, :price, :explanation, :image
    with_options numericality: { other_than: 1 } do
      validates :status_id, :category_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id
    end
  end
end
