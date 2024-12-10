class Venda < ApplicationRecord
  belongs_to :cliente
  has_many :detalhes_vendas, dependent: :destroy
end
