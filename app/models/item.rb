class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_day

  with_options presence: true do
    validates :name, :price, :explanation, :image
    validates :status_id, numericality: { other_than: 1 }
    validates :category_id, numericality: { other_than: 1 }
    validates :delivery_charge_id, numericality: { other_than: 1 }
    validates :delivery_area_id, numericality: { other_than: 1 }
    validates :delivery_day_id, numericality: { other_than: 1 }
  end
end
