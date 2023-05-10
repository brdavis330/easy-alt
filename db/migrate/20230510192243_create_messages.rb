class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :photo
      t.integer :sender_id
      t.integer :ticket_id

      t.timestamps
    end
  end
end
