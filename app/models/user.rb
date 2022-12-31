class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable, :lockable
  has_many :sessaos
  has_one_attached :foto
  validates :nome, :role, presence: true
  validates :cpf, cpf: true # admite CPF em branco, a pedido do dono do site
  validates :cpf, exclusion: { in: Blacklist.select(:cpf) }
  validates :email, exclusion: { in: Blacklist.select(:email) }
end
