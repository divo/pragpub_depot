class CombineItemsInCart < ActiveRecord::Migration[5.2]
  
  def up 
    # replace multiple items for a single product in a cart with a single item
    Cart.all.each do |cart|
      # count the number of each product in the cart
      # This thing is map of id and count
      sums = cart.line_items.group(:product_id).sum(:quantity)
      sums.each do |product_id, quantity|
        if quantity > 1
          #remove indvidual items
          cart.line_items.where(product_id: product_id).delete_all
          
          # replace with a sigle item
          item = cart.line_items.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end
  
  
end
