class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.bigint :number, null: false
      t.index :number, name: "phone_number_index", unique: true
      t.timestamps
    end
  end
end
