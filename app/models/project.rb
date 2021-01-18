class Project < ApplicationRecord
  belongs_to :homes
  has_many :contractors
end
