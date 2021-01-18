class Project < ApplicationRecord
  belons_to :homes
  has_many :contractors
end
