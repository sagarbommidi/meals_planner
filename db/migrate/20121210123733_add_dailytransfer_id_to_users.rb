class AddDailytransferIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :dailytransfer_id, :integer 
  end
end
