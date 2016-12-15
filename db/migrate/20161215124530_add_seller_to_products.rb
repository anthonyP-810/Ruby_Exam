class AddSellerToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :seller
  end
end
