json.extract! produto, :id, :nome, :preco, :estoque, :created_at, :updated_at
json.url produto_url(produto, format: :json)
