class AddBuyerToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :buyer
  end
end
