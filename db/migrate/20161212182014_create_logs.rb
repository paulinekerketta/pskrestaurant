class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
t.float "out_collection"
      t.float "in_collection"
      t.float "total_collection"
      t.float "total_payout"
      t.float "profit"
      t.integer   "day"
    t.integer   "month"
      t.timestamps
    end
  end
end
