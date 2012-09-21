class Link < ActiveRecord::Base
  attr_accessible :rlink, :title, :name
  #validates :rlink, presence: true, length: { maximum: 500}
  #validates :title, length: {maximum: 255}

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

