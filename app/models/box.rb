class Box < ActiveRecord::Base
  attr_accessible :name, :user_id
  has_many :links
  belongs_to :user

  validates :name, presence: true, length: { maximum: 100 }

  default_scope order: 'boxes.created_at DESC'

end
