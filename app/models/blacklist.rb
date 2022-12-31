class Blacklist < ApplicationRecord
  validates :cpf, cpf: true, allow_blank: true
  validates :email,  allow_blank: true, format: { with: /\A[^@\s]+@[^@\s]+\z/,
    message: "não é e-mail válido!" }
end
