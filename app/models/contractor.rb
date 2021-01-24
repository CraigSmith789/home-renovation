class Contractor < ApplicationRecord
  has_many :projects
  has_many :tasks, dependent: :destroy
  has_many :homes, through: :projects

end
