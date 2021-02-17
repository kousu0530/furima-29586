class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :tell,         null: false
      t.references  :purchase,     foreign_key: true
      t.string      :postal_code,   null: false
      t.integer     :area_id,       null: false
      t.string      :city,          null: false
      t.string      :prefectures,   null: false
      t.string      :apartment
      t.timestamps
    end
  end
end
