class CreateSequences < ActiveRecord::Migration[5.2]
  def change
    create_table :sequences do |t|
      t.bigint :last, null: false
      t.timestamps
    end
  end
end
