class User < ActiveRecord::Base
  attr_accessible :address, :email, :name, :password, :password_confirmation
  attr_accessible :address, :email, :name, :password, :password_confirmation, :admin, as: :admin

  has_secure_password

  has_many :adverts
  has_many :leads, through: :adverts

end
