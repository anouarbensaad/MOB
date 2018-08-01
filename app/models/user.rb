class User < ApplicationRecord
  has_secure_password
  has_many :created_pannes, :class_name => 'Panne', :foreign_key => 'prof_id', dependent: :destroy
  has_many :resolved_pannes, :class_name => 'Panne', :foreign_key => 'tech_id', dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :login, presence: true, uniqueness: true
  def name
   [prenom, nom].select(&:present?).join(' ').titleize
  end
end
