class Lead < ActiveRecord::Base
  attr_accessible :advert_id, :email, :message, :name, :phone

  belongs_to :advert

end
