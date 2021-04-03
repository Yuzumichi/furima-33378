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
    validates :name, :explanation, :image
    validates :status_id, numericality: { other_than: 1, message: "Select"}
    validates :category_id, numericality: { other_than: 1, message: "Select"}
    validates :delivery_charge_id, numericality: { other_than: 1, message: "Select"}
    validates :delivery_area_id, numericality: { other_than: 1, message: "Select"}
    validates :delivery_day_id, numericality: { other_than: 1, message: "Select"}
    validates :price, format:{with: /\A[0-9]+\z/, message: "Half-width number"}, numericality:{greater_than: 300, less_than: 9999999, message: "Out of setting range"}
  end
end
