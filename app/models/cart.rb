class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    self.line_items.each do |line_item|
      total += (line_item.quantity * line_item.item.price)
    end
    return total
  end

  def add_item(item_id)
    if self.line_items.find_by(item_id: item_id,cart_id: self.id)
      line_item = self.line_items.find_by(item_id: item_id)
      if line_item.item.inventory > 0
        line_item.quantity += 1
        line_item.item.inventory -= 1
        line_item.item.save
      end
    else
      line_item = self.line_items.build(item_id: item_id)
    end
    return line_item
  end

  def checkout
   self.status = "submitted"
   self.clear_inventory
   self.user.current_cart_id = nil
   self.user.save
   self.save
 end

 def clear_inventory
   if self.status == "submitted"
     self.line_items.each do |line_item|
       line_item.item.inventory -= line_item.quantity
       line_item.item.save
     end
   end
 end
end
