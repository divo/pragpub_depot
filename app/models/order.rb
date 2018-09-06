class Order < ApplicationRecord
  enum pay_type: {
    "Check" => 0,
    "Credit Card" => 1,
    "Purchase order" => 2
  }
  
  has_many :line_items, dependent: :destroy
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: pay_types.keys
  
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil # Disassociate from Cart so LineItem isnt destroyed with the Cart
      line_items << item # Add the item to the line_items collection. Rails uses the belongs_to and has_many declartion in the respecitve models to knit them together in the db
    end
  end
end
