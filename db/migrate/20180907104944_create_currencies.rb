class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.float :value, null: false
      t.datetime :to, null: false, index: true

      t.timestamps
    end
  end
end
