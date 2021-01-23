class User < ApplicationRecord
  has_many :homes

  has_secure_password

  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(uid: auth['uid'])

         user.name = auth['info']['name']
         user.email = auth['info']['email']
         user.image = auth['info']['image']
         # password field is required
         user.password = 'fb'

    user.save
    user
  end
end
