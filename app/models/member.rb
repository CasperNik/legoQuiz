class Member < ActiveRecord::Base

  has_one :bike
  default_scope :order => 'created_at DESC'

end
