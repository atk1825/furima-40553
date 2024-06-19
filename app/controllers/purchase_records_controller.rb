class PurchaseRecordsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_sign_in, only: [:index]
  before_action :move_to_index, only: [:index]

  def index
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new
  end

  def create
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new(purchase_record_params)
    if @purchase_record_shipping_address.valid?
      @purchase_record_shipping_address.save
      redirect_to root_path
    else
      render action: :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_record_params
    params.require(:purchase_record_shipping_address).permit(:post_number, :area_id, :municipality, :street_address, 
                                                             :building_name, :telephone_number, :purchase_record_id, :item_id, :user_id)
  end

  def move_to_sign_in
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def move_to_index
    return unless current_user.id == @item.user.id

    redirect_to root_path
  end
end
