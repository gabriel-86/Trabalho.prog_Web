class Cliente < ApplicationRecord
    
    validates :nome, presence: true, length: { minimum: 3 }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
    validates :telefone, presence: true, format: { with: /\A\d{10,11}\z/, message: "deve conter 10 ou 11 dígitos" }
    has_many :vendas

end
