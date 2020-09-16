class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string     :postal_code,           null: false
      t.integer    :shipping_region_id,    null: false
      t.string     :city,                  null: false
      t.string     :adress,                null: false
      t.string     :bulilding_name
      t.string     :phone_number,          null: false
      t.references :order,                 null: false, foreign_key: true

      t.timestamps
    end
  end
end
