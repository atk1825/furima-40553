class ItemsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy]
  before_action :move_to_sign_in, only: [:new, :edit]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :bought, only: [:edit]

  def index
    @items = Item.all.order('id  DESC')
  end

  def new
    @item_form = ItemForm.new
    @categories = Category.new
    # 昇順で13番目までのインスタンス変数を生成
    @maincategories = Category.all.order('id ASC').limit(13)
  end

  def create
    @item_form = ItemForm.new(item_form_params)
    @categories = Category.new
    @maincategories = Category.all.order('id ASC').limit(13)
    # ApplicationRecordを継承していないので、saveメソッドにバリデーションを実行する機能がない
    if @item_form.valid?
      @item_form.save
      redirect_to items_path(@item)
    else
      render action: :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    # @itemから情報をハッシュで取得している
    item_attributes = @item.attributes
    @item_form = ItemForm.new(item_attributes)
    @categories = Category.new
    @maincategories = Category.all.order('id ASC').limit(13)
    @item_form.tag_name = @item.tags.first&.tag_name
  end

  def update
    @item_form = ItemForm.new(item_form_params)
    @categories = Category.new
    @maincategories = Category.all.order('id ASC').limit(13)
    # 画像を選択し直していない場合は、既存の画像をセットする(自己代入演算子)
    @item_form.images ||= @item.images.blobs

    if @item_form.valid?
      @item_form.update(item_form_params, @item)
      redirect_to item_path(@item)
    else
      render action: :edit, status: :unprocessable_entity
    end
  end

  def destroy
    return unless @item.destroy

    redirect_to root_path
  end

  def search
    # フォームの入力内容がからであれば、javascriptにnilを返す
    return nil if params[:keyword] == ''

    # whereメソッドとLIKE句を使用して、曖昧検索をする
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"])
    render json: { keyword: tag }
  end

  private

  def find_params
    @item = Item.find(params[:id])
  end

  def move_to_sign_in
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def move_to_index
    return if current_user.id == @item.user.id

    redirect_to root_path
  end

  def item_form_params
    params.require(:item_form).permit(:name, :content, { images: [] }, :price, :category_id, :condition_id, :area_id, :load_id,
                                      :delivery_id, :tag_name).merge(user_id: current_user.id)
  end

  def bought
    return unless @item.purchase_record

    redirect_to root_path
  end
end
