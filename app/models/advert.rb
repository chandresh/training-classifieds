class Advert < ActiveRecord::Base
  attr_accessible :category_id, :contact_details, :description, :title, :user_id, :approved
  belongs_to :category
  belongs_to :user
end
