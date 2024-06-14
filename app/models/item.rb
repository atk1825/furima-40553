class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :area
  belongs_to :load
  belongs_to :delivery
  belongs_to :user
  has_one_attached :image

  validates :category_id, :condition_id, :area_id, :load_id, :delivery_id,
            numericality: { other_than: 1, message: "can't be blank" },
            presence: true
  validates :name, presence: true
  validates :content, presence: true
end
