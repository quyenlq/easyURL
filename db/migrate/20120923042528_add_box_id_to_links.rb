class AddBoxIdToLinks < ActiveRecord::Migration
  def change
  	add_column :links, :box_id, :integer
  end
end
