class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.date :date_posted
      t.float :amount
	  t.boolean :sold, default: true
      t.timestamps null: false
    end
  end
end
