class Home < ApplicationRecord
  belongs_to :user
  has_many :projects
  has_many :contractors, through: :projects


  validates :name, presence: true
  validates :year_built, presence: true, numericality: true
  validates :sf, presence: true, numericality: true
  validates :beds, presence: true, numericality: true
  validates :baths, presence: true, numericality: true
end
