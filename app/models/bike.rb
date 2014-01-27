class Bike < ActiveRecord::Base

  belongs_to :member, dependent: :destroy
  default_scope :order => 'created_at DESC'

end
