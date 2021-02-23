class CreateOrdersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string  :brewery_type
      t.string  :phone
    end 
      
  end
end
