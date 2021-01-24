class Home < ApplicationRecord
  belongs_to :user
  has_many :projects
  has_many :contractors, through: :projects


  validates :name, presence: true
  validates :year_built, presence: true, numericality: true
  validates :sf, presence: true, numericality: true
  validates :beds, presence: true, numericality: true
  validates :baths, presence: true, numericality: true
  scope :lead_paint_risk, -> { where("year_built < 1978") }
  scope :order_by_date, -> {year_built :desc}

  def self.order_by_date
    self.order(year_built: :desc) 
end

end
