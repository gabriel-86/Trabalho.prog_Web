class CreateVendas < ActiveRecord::Migration[8.0]
  def change
    create_table :vendas do |t|
      t.references :cliente, null: false, foreign_key: true
      t.decimal :total

      t.timestamps
    end
  end
end
