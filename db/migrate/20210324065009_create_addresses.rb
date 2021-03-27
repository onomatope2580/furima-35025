class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,       null: false
      t.integer :delivery_from_id, null: false
      t.string :city,              null: false
      t.string :street,            null: false
      t.string :building
      t.string :tel,               null: false
      t.references :purchase,      null: false, foreing_key: true
      t.timestamps
    end
  end
end
