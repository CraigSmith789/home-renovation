class Contractor < ApplicationRecord
  has_many :projects
  has_many :tasks,dependent: :destroy
  has_many :homes, through: :projects

  # validates :name, presence: true
  # validates :email,
  # format: { with: /^(.+)@(.+)$/, message: "Email invalid"  },
  #           uniqueness: { case_sensitive: false },
  #           length: { minimum: 4, maximum: 254 }   
end
