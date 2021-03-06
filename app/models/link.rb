class Link < ActiveRecord::Base
  attr_accessible :rlink, :title, :name, :user_id, :desc, :favicon, :box_id
  belongs_to :user
  belongs_to :box

  VALID_NAME_REGEX = /^[a-zA-Z0-9_]*[a-zA-Z][a-zA-Z0-9_]*$/

  validates :rlink, presence: true, length: { maximum: 500}
  validates :name, presence: true, length: {maximum: 81, minimum: 3}, uniqueness: {case_sensitive: true},
  				   format: {with: VALID_NAME_REGEX}

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

