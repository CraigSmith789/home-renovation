class Task < ApplicationRecord
  belongs_to :contractor

  validates :name, presence: true
end
