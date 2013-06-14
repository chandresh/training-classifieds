class Advert < ActiveRecord::Base
  attr_accessible :category_id, :contact_details, :description, :title, :user_id, :approved, :image
  belongs_to :category
  belongs_to :user
  has_many  :leads

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def self.approved
    where(approved: true)
  end

end
