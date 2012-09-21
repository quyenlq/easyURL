class AddIndexToLinksName < ActiveRecord::Migration
  def change
  	add_index :links, :name, unique: true
  end
end
