class CreateDetalhesVendas < ActiveRecord::Migration[8.0]
  def change
    create_table :detalhes_vendas do |t|
      t.references :venda, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true
      t.integer :quantidade
      t.decimal :subtotal

      t.timestamps
    end
  end
end
