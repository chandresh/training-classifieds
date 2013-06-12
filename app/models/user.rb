class User < ActiveRecord::Base
  attr_accessible :address, :email, :name, :password, :password_confirmation, :admin

  has_secure_password

end
