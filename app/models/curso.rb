class Curso < ApplicationRecord
  has_one_attached :foto
  validates :nome, :descricao, presence: true
end
