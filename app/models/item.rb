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
  has_many :item_tag_relations, dependent: :destroy
  has_many :tags, through: :item_tag_relations
  has_many :comments

  def self.ransackable_attributes(_auth_object = nil)
    ['name']
  end

  def self.ransackable_associations(_auth_object = nil)
    ['user']
  end
end
