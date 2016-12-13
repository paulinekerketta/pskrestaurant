class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
     t.integer "out_sales"
      t.float "out_collection"
      t.integer "in_sales"
      t.float "in_collection"
       t.integer   "day"
    t.integer   "month"
      t.timestamps
    end
  end
end
