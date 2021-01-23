class Project < ApplicationRecord
  belongs_to :home
  belongs_to :contractor
  has_many :tasks, through: :contractor
  accepts_nested_attributes_for :contractor

  validates :name, presence: true

end
