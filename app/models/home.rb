class Home < ApplicationRecord
  belongs_to :user
  has_many :projects
  has_many :contractors, through: :projects
end
