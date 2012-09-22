class Link < ActiveRecord::Base
  attr_accessible :rlink, :title, :name, :user_id, :desc, :favicon
  belongs_to :user

  validates :rlink, presence: true, length: { maximum: 500}
  validates :name, presence: true, length: {maximum: 81, minimum: 4}, uniqueness: {case_sensitive: true}

  default_scope order: 'links.created_at DESC'

end
# == Schema Information
#
# Table name: links
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  rlink      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

