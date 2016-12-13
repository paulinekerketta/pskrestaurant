class CreateDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :drivers do |t|
        t.string   "name"
    t.integer   "delivery"
    t.float  "payment"
    t.string    "pay"
    t.integer   "day"
    t.integer   "month"
      t.timestamps
    end
  end
end
