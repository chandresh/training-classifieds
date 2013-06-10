class User < ActiveRecord::Base
  attr_accessible :address, :email, :name, :password, :password_confirmation

  has_secure_password




  def password=(password)
    #do hashing logic & store  the hashed password into digest
  end

end
