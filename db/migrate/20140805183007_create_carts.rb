class CreateCarts < ActiveRecord::Migration
  def change
  	create_table :carts do |t|
      t.float   "total"
  	  t.string :status,  default: "not submitted"
      t.integer :user_id
    end
  end
end
