class Contractor < ApplicationRecord
  has_many :projects
  has_many :tasks
  has_many :homes, through: :projects
end
