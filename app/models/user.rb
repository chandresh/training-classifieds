class User < ActiveRecord::Base
  attr_accessible :address, :email, :name, :password, :password_confirmation, :admin

  has_secure_password

  has_many :adverts

end
