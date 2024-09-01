class CategoriesController < ApplicationController
  def new
    @categories = Category.new
    # 昇順で13番目までのインスタンス変数を生成
    @maincategories = Category.all.order('id ASC').limit(13)
  end

  def search
    item = Category.find(params[:id])
    children_item = item.children
    render json: { item: children_item }
  end
end
