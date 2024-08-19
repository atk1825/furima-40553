class ItemFrom
  include ActiveModel::Model

  # ItemFormクラスオブジェクトがItemモデルの属性を使えるようにする
  attr_accessor :name, :images

  with_options presence: true do
    validates :name
    validates :was_attached?
  end

  def save
    item.create(name:, image:)
  end

  private

  def was_attached?
    errors.add(:images, 'を選択してください') unless images.attached?
  end
end
