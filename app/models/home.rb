class Home < ApplicationRecord
  belongs_to :User
  has_many :projects
end
