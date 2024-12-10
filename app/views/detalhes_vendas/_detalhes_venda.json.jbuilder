json.extract! detalhes_venda, :id, :venda_id, :produto_id, :quantidade, :subtotal, :created_at, :updated_at
json.url detalhes_venda_url(detalhes_venda, format: :json)
