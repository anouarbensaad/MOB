class Panne < ApplicationRecord
  belongs_to :prof, :class_name => 'User'
  belongs_to :tech, :class_name => 'User'
  default_scope -> { order(created_at: :desc) }
  validates :prof, presence: true
  validates :description, presence: true, length: { maximum: 512 }
  validates :type_panne, presence: true, length: { maximum: 50 }
  validates :laboratoire, presence: true, length: { maximum: 150 }
  validates :type_Composant, presence: true, length: { maximum: 50 }
  validates :id_Composant, presence: true, length: { maximum: 150 }
  validates :panne_status, presence: true, length: { maximum: 50 }
end
