class Collection < ActiveRecord::Base
belongs_to :user
has_many :saves
has_many :tags
  validates :name, :user_id, :url, presence:true
  validates :user_id, numericality: true

  def a_method_used_for_validation_purposes
  	errors.add(:name, "Cannot be Blank")
  	errors.add(:url,"Cannot be Blank")
  end

end
