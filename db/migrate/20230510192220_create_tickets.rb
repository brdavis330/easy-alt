class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.integer :customer_id
      t.integer :vendor_id
      t.text :details
      t.string :photo
      t.string :status

      t.timestamps
    end
  end
end
