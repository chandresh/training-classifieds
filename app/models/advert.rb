class Advert < ActiveRecord::Base
  attr_accessible :category_id, :contact_details, :description, :title
end
