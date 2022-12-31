class Agendada < ApplicationRecord
  validates :data_hora, uniqueness: true
  validates :atend, inclusion: { in: %w(online presencial ambos) }
end