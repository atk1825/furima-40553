class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :area_id
  belongs_to :load_id
  belongs_to :delivery_id

  validates :category_id, :condition_id, :area_id, :load_id, :delivery_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
