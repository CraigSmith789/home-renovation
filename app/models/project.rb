class Project < ApplicationRecord
  belongs_to :home
  belongs_to :contractor
  has_many :tasks, through: :contractor

end
