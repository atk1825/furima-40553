class ItemForm
  include ActiveModel::Model
  # ItemFormクラスオブジェクトがItemモデルの属性を使えるようにする
  attr_accessor(
    :name, :images, :content, :price,
    :category_id, :condition_id, :load_id, :area_id, :delivery_id, :numericality,
    :user_id,
    :id, :created_at, :updated_at,
    :tag_name
  )

  with_options presence: true do
    validates :images
    validates :name
    validates :content
    validates :category_id, :condition_id, :load_id, :area_id, :delivery_id,
              numericality: { other_than: 1, message: 'を選択してください' }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  def save
    item = Item.create(name:, images:, content:, category_id:, condition_id:, load_id:, area_id:, delivery_id:, price:, user_id:)
    return unless tag_name.present?

    tag = Tag.where(tag_name:).first_or_initialize
    tag.save
    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

  def update(params, item)
    # 一度タグの紐付けを消す
    item.item_tag_relations.destroy_all

    # paramsの中のタグの情報を削除。同時に返り値としてタグの情報を変数に代入
    tag_name = params.delete(:tag_name)

    # もしタグの情報がすでに保存されていればインスタンスを取得、なければインスタンスを新規作成
    tag = Tag.where(tag_name:).first_or_initialize if tag_name.present?

    # タグを保存
    tag.save if tag_name.present?
    item.update(params)
    ItemTagRelation.create(item_id: item.id, tag_id: tag.id) if tag_name.present?
  end
end
