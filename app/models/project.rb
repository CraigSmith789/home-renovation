class Project < ApplicationRecord
  belongs_to :home
  belongs_to :contractors
  has_many :tasks, through: :contractors

end
