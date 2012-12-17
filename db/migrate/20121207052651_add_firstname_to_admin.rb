class AddFirstnameToAdmin < ActiveRecord::Migration
  def change
 		add_column :admins, :firstname, :string
  end
end
