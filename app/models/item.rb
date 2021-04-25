class Item < ApplicationRecord
  belongs_to :user
  has_one :buyer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_day

  with_options presence: true do
    validates :name, :explanation, :image

    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :status_id
      validates :category_id
      validates :delivery_charge_id
      validates :delivery_area_id
      validates :delivery_day_id
    end
    validates :price, numericality: { only_integer: true, message: 'Half-width number' }
  end
  validates :price, numericality: { greater_than: 300, less_than: 9_999_999, message: 'Out of setting range' }
end
