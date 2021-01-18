class User < ApplicationRecord
  has_many :homes

  has_secure_password
end
