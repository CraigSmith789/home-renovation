class Project < ApplicationRecord
  belongs_to :home
  has_and_belongs_to_many :contractors
  has_many :tasks, through: :contractors

end
