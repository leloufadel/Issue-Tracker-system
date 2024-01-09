class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    enum role: [:regular, :admin]

    has_many :issues, foreign_key: 'assigned_to'

  
end
