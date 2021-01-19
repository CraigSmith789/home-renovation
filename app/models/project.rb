class Project < ApplicationRecord
  belongs_to :home
  has_many :contractors

end
