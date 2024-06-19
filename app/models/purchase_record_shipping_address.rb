class PurchaseRecordShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :area_id, :municipality, :street_address, :building_name, :telephone_number,
                :purchase_record_id

  with_options presence: true do
    validates :item_id
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id
    validates :municipality
    validates :street_address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: "must be 10 to 11 digits" }
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_number: post_number, area_id: area_id, municipality: municipality, street_address: street_address,
                           building_name: building_name, telephone_number: telephone_number, purchase_record_id: purchase_record.id)
  end
end
