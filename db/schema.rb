# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_12_10_003212) do
  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detalhes_vendas", force: :cascade do |t|
    t.integer "venda_id", null: false
    t.integer "produto_id", null: false
    t.integer "quantidade"
    t.decimal "subtotal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_detalhes_vendas_on_produto_id"
    t.index ["venda_id"], name: "index_detalhes_vendas_on_venda_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.decimal "preco"
    t.integer "estoque"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendas", force: :cascade do |t|
    t.integer "cliente_id", null: false
    t.decimal "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_vendas_on_cliente_id"
  end

  add_foreign_key "detalhes_vendas", "produtos"
  add_foreign_key "detalhes_vendas", "vendas"
  add_foreign_key "vendas", "clientes"
end
