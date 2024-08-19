class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :purchase_record
  belongs_to :category
  belongs_to :condition
  belongs_to :area
  belongs_to :load
  belongs_to :delivery
  belongs_to :user
  has_many_attached :images

  validates :content, presence: true
  validates :category_id, :condition_id, :load_id, :area_id, :delivery_id,
            numericality: { other_than: 1, message: 'を選択してください' },
            presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
